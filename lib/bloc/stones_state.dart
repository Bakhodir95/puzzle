sealed class StonesState{}

final class InitialStonesState extends StonesState{}

final class LoadingStonesState extends StonesState{}

final class LoadedStonesState extends StonesState{
  Map<String,int> mp;
  Map<String,int> finished;


  LoadedStonesState(this.mp,this.finished);
}

final class ErrorStonesState extends StonesState{}