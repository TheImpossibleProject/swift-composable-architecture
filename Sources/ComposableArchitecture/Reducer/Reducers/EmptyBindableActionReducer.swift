/// A reducer that does nothing.

public struct EmptyBindableActionReducer<State, Action: BindableAction>: ReducerProtocol where Action.State == State {

  public init() { }

  public var body: some ReducerProtocol<State, Action> {
    BindingReducer()
    
    Reduce.init(EmptyReducer())
  }
}
