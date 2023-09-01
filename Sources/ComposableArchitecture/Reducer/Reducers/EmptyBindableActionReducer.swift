/// A reducer that does nothing.

public struct EmptyBindableActionReducer<State, Action: BindableAction>: Reducer where Action.State == State {

  public init() { }

  public var body: some Reducer<State, Action> {
    BindingReducer()
    
    Reduce.init(EmptyReducer())
  }
}
