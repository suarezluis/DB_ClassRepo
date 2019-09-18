class Test1:
    
    # The __init__ method initializes the
    testVar1 = 1
    
    def __init__(self):
        self.testVar2 = 1
        
    def setTestVar1(self, var):
        self.testVar1 = var
        self.testVar3 += 5
        
    def setTestVar2(self, var):
        self.testVar2 = var
        self.testVar3 = 20;

    def getTestVar1(self):
        return self.testVar1
    
    def getTestVar2(self):
        self.testVar3 = self.testVar3 + 10
        return self.testVar3
