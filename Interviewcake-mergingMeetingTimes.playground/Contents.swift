//: A UIKit based Playground for presenting user interface
  
import UIKit

//: Write a function mergeRanges() that takes an array of multiple meeting time ranges and
//: returns an array of condensed ranges.

struct Meeting: CustomStringConvertible, Comparable {
    
    var meetingName: String
    var startTime: Int
    var endTime: Int
    
    init(startTime: Int, endTime: Int, meetingName: String) {
        
        // number of 30 min blocks past 9:00 am
        self.meetingName = meetingName
        self.startTime = startTime
        self.endTime = endTime
    }
    
    var description: String {
        return "(\(startTime), \(endTime))"
    }
    
    var timeRange: String {
        var startTimeString = ""
        var endTimeString = ""
        var start = 0
        var end = 0
        if startTime % 2 == 0 {
            start = (startTime * 30) / 60
            startTimeString = "\(9 + start):00"
        } else {
            start = (startTime * 30) / 60
            if start == 0 {
                start = 9
            }
            startTimeString = "\(Int(floor(Double(start)))):30"
            
        }
        
        if endTime % 2 == 0 {
            end = (endTime * 30) / 60
            endTimeString = "\(9 + end):00"
        } else {
            end = (endTime * 30) / 60
            endTimeString = "\(Int(floor(Double(end)))):30"
        }
        
        return "\(startTimeString) - \(endTimeString)"
    }
    
    static func < (lhs: Meeting, rhs: Meeting) -> Bool {
        return lhs.startTime < rhs.startTime
    }
    
    static func == (lhs: Meeting, rhs: Meeting) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime
    }
    
    
}


func mergeRanges(_ array: [Meeting]) {
    var meetingTimes = array.sorted()
    
    var Gaps: [String] = []
    
    for indx in 0..<meetingTimes.count - 1 {
        var firstMeetingName = ""
        var secondMeetingName = ""
        
        if meetingTimes[indx].endTime < meetingTimes[indx + 1].startTime {
            let difference = meetingTimes[indx + 1].startTime - meetingTimes[indx].endTime
            
            firstMeetingName = meetingTimes[indx].meetingName
            secondMeetingName = meetingTimes[indx + 1].meetingName
            
            if difference == 1 {
                Gaps.append("\(30) Min Gap Between \(firstMeetingName) and \(secondMeetingName)")
                
            } else {
                let timeGap = (difference * 30) / 60
                
                if timeGap % 2 == 0 {
                    Gaps.append("\(timeGap) hour[s] Gap Between \(firstMeetingName) and \(secondMeetingName)")
                    
                } else {
                    Gaps.append("\(timeGap) hour[s]: 30 Mins Gap Between \(firstMeetingName) and \(secondMeetingName)")
                }
                
            }
            
        }
    }
    
    Gaps.forEach({ (g) in
        print(g)
    })
}


