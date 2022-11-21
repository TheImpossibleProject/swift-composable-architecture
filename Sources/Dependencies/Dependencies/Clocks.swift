#if swift(>=5.7) && (canImport(RegexBuilder) || !os(macOS) && !targetEnvironment(macCatalyst))
  import Clocks

  @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
  extension DependencyValues {
    public var continuousClock: any Clock<Duration> {
      get { self[ContinuousClockKey.self] }
      set { self[ContinuousClockKey.self] = newValue }
    }
    public var suspendingClock: any Clock<Duration> {
      get { self[SuspendingClockKey.self] }
      set { self[SuspendingClockKey.self] = newValue }
    }

    public enum ContinuousClockKey: DependencyKey {
      public static let liveValue: any Clock<Duration> = ContinuousClock()
      public static let testValue: any Clock<Duration> = UnimplementedClock(name: "ContinuousClock")
    }
    public enum SuspendingClockKey: DependencyKey {
      public static let liveValue: any Clock<Duration> = SuspendingClock()
      public static let testValue: any Clock<Duration> = UnimplementedClock(name: "SuspendingClock")
    }
  }
#endif
