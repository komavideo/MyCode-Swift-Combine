///////////////////////////////////////////////////////////
// 03.消息中心(NotificationCenter)方式处理数据流
///////////////////////////////////////////////////////////
import Foundation
import Combine

extension Notification.Name {
    static let finishCalc = Notification.Name("finisheCalc")
}
class TestResult {
    var score: Int
    init(score: Int) {
        self.score = score
    }
}

let myTestResult = TestResult(score: 0)
print("我的考试结果是：\(myTestResult.score)")

let cancellable = NotificationCenter.default.publisher(
    for: .finishCalc,
    object: nil
    )
    .map({ notification in
        return notification.userInfo?["result"] as? Int ?? 0
    })
    .assign(to: \.score, on: myTestResult)

// 重新判分处理
NotificationCenter.default.post(
    name: .finishCalc,
    object: nil,
    userInfo: ["result": 85]
)

print("重新判分后结果：\(myTestResult.score)")
