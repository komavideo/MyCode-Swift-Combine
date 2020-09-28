///////////////////////////////////////////////////////////
// 01.简单的发布于接收数据流
///////////////////////////////////////////////////////////
import Combine

// 发送整数型数值42
let publisher = Just(10)

// 通过订阅者接受发布者的数据
let subscriber = Subscribers.Sink<Int, Never>(
    receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
            print(error)
        case .finished:
            print("程序结束")
        }
    },
    receiveValue: { value in 
        print("收到：\(value)")
    }
)

// 连接订阅和发布者，完成数据流传送与接受
publisher.subscribe(subscriber)

///////////////////////////////////////
// 简单的实现
///////////////////////////////////////
Just(20).sink(
    receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
            print(error)
        case .finished:
            print("程序结束")
        }
    },
    receiveValue: { value in 
        print("收到：\(value)")
    }
)

Just(30).sink(
    receiveValue: { value in 
        print("最简单的接收：\(value)")
    }
)

let cancellable = Just(40).sink(
    receiveValue: { value in 
        print("最简单的接收：\(value)")
    }
)
