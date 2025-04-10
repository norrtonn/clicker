import SwiftUI

// Структура для главной страницы
struct StartPage: View {
    @State private var showGame = false
    
    var body: some View {
        VStack {
            Text("Clicker")
                .font(.largeTitle)
            
            Button(action: {
                self.showGame = true
            }) {
                Text("Начать")
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showGame) {
            ContentView()
        }
    }
}

// Структура для игровой страницы
struct ContentView: View {
    @State private var clicks = 0
    @State private var passiveClicksPerSecond = 0
    @State private var clicksPerTap = 0
    @State private var cursorPrice = 10
    @State private var farmPrice = 100
    @State private var factoryPrice = 1000
    @State private var taxiPrice = 5000
    @State private var spaceshipPrice = 50000
    @State private var clickMultiplierPrice = 10
    
    @State private var showClickEmoji = false
    @State private var showCursorEmoji = false
    @State private var showFarmEmoji = false
    @State private var showFactoryEmoji = false
    @State private var showTaxiEmoji = false
    @State private var showSpaceshipEmoji = false
    @State private var showClickMultiplierEmoji = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Клики: \(clicks)")
                    .font(.largeTitle)
                
                Button(action: {
                    self.buttonClicked()
                }) {
                    Text("Кликай 🦾")
                }
                .padding()

                Text("Пассивные клики в секунду 👤 : \(passiveClicksPerSecond)")
                    .padding()
                
                Text("Количество увеличенных кликов 💪 : \(clicksPerTap)")
                    .padding()
                
                Button(action: {
                    self.buyCursor()
                }) {
                    Text("Купить курсор 🪄 (\(cursorPrice) кликов)")
                }
                .padding()
                
                Button(action: {
                    self.buyFarm()
                }) {
                    Text("Купить поезд 🚅 (\(farmPrice) кликов)")
                }
                .padding()
                
                Button(action: {
                    self.buyFactory()
                }) {
                    Text("Купить фабрику 🏭  (\(factoryPrice) кликов)")
                }
                .padding()
                
                Button(action: {
                    self.buyTaxi()
                }) {
                    Text("Купить таксопарк 🚕 (\(taxiPrice) кликов)")
                }
                .padding()
                
                Button(action: {
                    self.buySpaceship()
                }) {
                    Text("Купить космический корабль 🛸 (\(spaceshipPrice) кликов)")
                }
                .padding()
                
                Button(action: {
                    self.buyClickMultiplier()
                }) {
                    Text("Увеличить клики за раз 🔧 (\(clickMultiplierPrice) кликов)")
                }
                .padding()
            }
            
            if showClickEmoji {
                Text("🔥")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showClickEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showClickEmoji)
            }
            
            if showCursorEmoji {
                Text("🪄")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showCursorEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showCursorEmoji)
            }
            
            if showFarmEmoji {
                Text("🚅")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showFarmEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showFarmEmoji)
            }
            
            if showFactoryEmoji {
                Text("🏭")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showFactoryEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showFactoryEmoji)
            }
            
            if showTaxiEmoji {
                Text("🚕")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showTaxiEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showTaxiEmoji)
            }
            
            if showSpaceshipEmoji {
                Text("🛸")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showSpaceshipEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showSpaceshipEmoji)
            }
            
            if showClickMultiplierEmoji {
                Text("🔧")
                    .font(.largeTitle)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 400)
                    .opacity(showClickMultiplierEmoji ? 1 : 0)
                    .animation(.easeInOut(duration: 0.5), value: showClickMultiplierEmoji)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.clicks += self.passiveClicksPerSecond
            }
        }
    }
    
    func buttonClicked() {
        clicks += clicksPerTap + 1 // Добавляем 1, чтобы клик всегда увеличивал счёт
        withAnimation(.easeInOut(duration: 0.5)) {
            showClickEmoji = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.showClickEmoji = false
            }
        }
    }
    
    func buyCursor() {
        if clicks >= cursorPrice {
            clicks -= cursorPrice
            passiveClicksPerSecond += 1
            cursorPrice = Int(Double(cursorPrice) * 1.15)
            withAnimation(.easeInOut(duration: 0.5)) {
                showCursorEmoji = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showCursorEmoji = false
                }
            }
        }
    }
    
    func buyFarm() {
        if clicks >= farmPrice {
            clicks -= farmPrice
            passiveClicksPerSecond += 5
            farmPrice = Int(Double(farmPrice) * 1.15)
            withAnimation(.easeInOut(duration: 0.5)) {
                showFarmEmoji = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showFarmEmoji = false
                }
            }
        }
    }
    
    func buyFactory() {
        if clicks >= factoryPrice {
            clicks -= factoryPrice
            passiveClicksPerSecond += 20
            factoryPrice = Int(Double(factoryPrice) * 1.15)
            withAnimation(.easeInOut(duration: 0.5)) {
                showFactoryEmoji = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showFactoryEmoji = false
                }
            }
        }
    }
    
    func buyTaxi() {
        if clicks >= taxiPrice {
            clicks -= taxiPrice
            passiveClicksPerSecond += 50
            taxiPrice = Int(Double(taxiPrice) * 1.15)
            withAnimation(.easeInOut(duration: 0.5)) {
                showTaxiEmoji = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showTaxiEmoji = false
                }
            }
        }
    }
    
    func buySpaceship() {
        if clicks >= spaceshipPrice {
            clicks -= spaceshipPrice
            passiveClicksPerSecond += 200
            spaceshipPrice = Int(Double(spaceshipPrice) * 1.15)
            withAnimation(.easeInOut(duration: 0.5)) {
                showSpaceshipEmoji = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showSpaceshipEmoji = false
                }
            }
        }
    }
    
    func buyClickMultiplier() {
        if clicks >= clickMultiplierPrice {
            clicks -= clickMultiplierPrice
            clicksPerTap += 1
            clickMultiplierPrice = Int(Double(clickMultiplierPrice) * 2)
            withAnimation(.easeInOut(duration: 0.5)) {
                showClickMultiplierEmoji = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showClickMultiplierEmoji = false
                }
            }
        }
    }
}

// Предварительный просмотр для StartPage
struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
 
