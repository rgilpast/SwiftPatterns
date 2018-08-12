//Abastract Factory Pattern

//Definition

protocol AbstractFactory {
    func createObject() -> AbstractObject;
    func createOtherObject() -> OtherAbstractObject;
}

protocol AbstractObject {
    func methodA() -> Void;
    func methodB() -> Bool;
    func methodC() -> String;
}

protocol OtherAbstractObject {
    func methodX() -> Void;
    func methodY() -> Bool;
}

//Concrete implementations

class ConcreteFactory1: AbstractFactory {
    
    func createObject() -> AbstractObject {
        return ConcreteObject1();
    }
    
    func createOtherObject() -> OtherAbstractObject {
        return OtherConcreteObject1();
    }
}

class ConcreteFactory2: AbstractFactory {
    
    func createObject() -> AbstractObject {
        return ConcreteObject2();
    }
    
    func createOtherObject() -> OtherAbstractObject {
        return OtherConcreteObject2();
    }
}

class ConcreteObject1: AbstractObject {
    
    func methodA() -> Void {
        print("methodA - ConcreteObject1");
    }
    
    func methodB() -> Bool {
        print("methodB - ConcreteObject1");
        return false;
    }
    
    func methodC() -> String {
        print("methodC - ConcreteObject1");
        return "";
    }
}

class OtherConcreteObject1: OtherAbstractObject {
    
    func methodX() -> Void {
        print("methodX - OtherConcreteObject1");
    }
    
    func methodY() -> Bool {
        print("methodY - OtherConcreteObject1");
        return false;
    }
}

class ConcreteObject2: AbstractObject {
    
    func methodA() -> Void {
        print("methodA - ConcreteObject2");
    }
    
    func methodB() -> Bool {
        print("methodB - ConcreteObject2");
        return false;
    }
    
    func methodC() -> String {
        print("methodC - ConcreteObject2");
        return "";
    }
}

class OtherConcreteObject2: OtherAbstractObject {
    
    func methodX() -> Void {
        print("methodX - OtherConcreteObject2");
    }
    
    func methodY() -> Bool {
        print("methodY - OtherConcreteObject2");
        return false;
    }
}

//Use of my Abstract Factory

class MyApp {
    
    public enum MyProductFamilies {
        case ProductFamily1
        case ProductFamily2
    }
    
    func createFactory(ofProductFamily family: MyProductFamilies) -> AbstractFactory? {
        
        switch (family) {
        case .ProductFamily1:
            return ConcreteFactory1();
        case .ProductFamily2:
            return ConcreteFactory2();
        }
    }
    
    func useMyPattern(withProductFamily family: MyProductFamilies) {
        
        let factory = self.createFactory(ofProductFamily: family);
        let object = factory?.createObject();

        object?.methodA();
        object?.methodB();
        object?.methodC();
        
        let otherObject = factory?.createOtherObject();
        otherObject?.methodX();
        otherObject?.methodY();
    }
}

let app: MyApp = MyApp();
app.useMyPattern(withProductFamily: .ProductFamily2);
app.useMyPattern(withProductFamily: .ProductFamily1);
