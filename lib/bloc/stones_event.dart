sealed class StonesEvent{}

final class RandomStonesEvent extends StonesEvent{}

final class InitialStonesEvent extends StonesEvent{}

final class GetStonesEvent extends StonesEvent{}

final class CheckStoneStonesEvent extends StonesEvent{
  int stoneNumber;
  int stoneValue;

  CheckStoneStonesEvent(this.stoneNumber,this.stoneValue);
}