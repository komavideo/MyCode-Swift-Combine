///////////////////////////////////////////////////////////
// 02.发布者直接通过路径(KeyPath)方式分配数据流
///////////////////////////////////////////////////////////
import Combine

class TestResult {
    var score: Int
    init(score: Int) {
        self.score = score
    }
}

let myTestResult = TestResult(score: 0)
print("我的考试结果是：\(myTestResult.score)")

let cancellable = Just(100).assign(to: \.score, on: myTestResult)
print("重新判分后结果：\(myTestResult.score)")

/////////////////////////////////////////////
// 当发送与接收的数据流类型不一致的时候
/////////////////////////////////////////////
Just("99")
    .map({ value in
        return Int(value)!
    })
    .assign(to: \.score, on: myTestResult)
print("文本判分后结果：\(myTestResult.score)")
