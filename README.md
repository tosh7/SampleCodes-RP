# カウントアプリ(RxSwift)

カウントアプリをRxSwiftで書いてみました。

labelに文字を入れるところがあまりクールじゃない気がするので変更したい。

基本的に全て、 `Button.rx.tap`の方法をしようして作成しています。

以下に実装例
```
addButton.rx.tap
            .subscribe(onNext: {
                self.number += 1
                self.label.text = String(self.number)
            })
            .disposed(by: disposeBag)
```
