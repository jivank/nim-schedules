import unittest

import os, times, options, asyncdispatch
import schedules

schedules:
  every(seconds=1, id="sync tick"):
    echo("sync tick, seconds=1 ", now())

  every(seconds=1, id="async tick", async=true):
    echo("async tick, seconds=1 ", now())

  every(seconds=1, id="sync sleep", throttle=2):
    echo("async sleep, seconds=1", now())
    sleep(3000)

  every(seconds=2, id="async sleep", async=true, throttle=2):
    echo("async sleep, seconds=1", now())
    await sleepAsync(4000)

#test "IntervalBeater.$":
  #let beater = initBeater(TimeInterval(seconds: 1))
  #check $beater == "Beater(bkInterval,1 second)"

#test "IntervalBeater.fireTime | startTime hasn't come":
  #let current = now().utc()
  #let beater = initBeater(
    #initTimeInterval(seconds=10),
    #startTime=some(current + initTimeInterval(seconds=4))
  #)
  #let expect = current + initTimeInterval(seconds=4)
  #let actual = beater.fireTime(none(DateTime), current).get()
  #check actual == expect

#test "IntervalBeater.fireTime | startTime has come":
  #let current = now().utc()
  #let beater = initBeater(
    #initTimeInterval(seconds=10),
    #startTime=some(current - initTimeInterval(seconds=14))
  #)
  #let expect = current + initTimeInterval(seconds=6)
  #let actual = beater.fireTime(none(DateTime), current).get()
  #check actual == expect

#test "IntervalBeater.fireTime | startTime has come 2":
  #let current = now().utc()
  #let beater = initBeater(
    #initTimeInterval(seconds=10),
    #startTime=some(current - initTimeInterval(seconds=4))
  #)
  #let expect = current + initTimeInterval(seconds=6)
  #let actual = beater.fireTime(none(DateTime), current).get()
  #check actual == expect

#test "IntervalBeater.fireTime | some prev":
  #let current = now().utc()
  #let beater = initBeater(initTimeInterval(seconds=10))
  #let prev = some(current - initTimeInterval(seconds=4))
  #let actual = beater.fireTime(prev, current).get()
  #let expect = current + initTimeInterval(seconds=6)
  #check actual == expect
