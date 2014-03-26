import nose


class Calc(object):
    names = 'zero one two three four five six seven eight nine ten ' \
            'eleven twelve thirteen fourteen fifteen sixteen seventeen ' \
            'eighteen nineteen twenty'.split()
    mapping = dict(zip(names, range(20)))

    def __getattribute__(self, name):
        if name in Calc.names:
            self.register = Calc.mapping[name]
            return self
        else:
            super(Calc, self).__getattribute__(name)


    def __init__(self):
        self.result = 0
        self.register = 0

    @property
    def plus(self):
        self.result += self.register
        return self

    @property
    def minus(self):
        self.result -= self.register
        return self

    @property
    def times(self):
        self.result *= self.register
        return self

    @property
    def divided_by(self):
        self.result /= self.register
        return self

    def __repr__(self):
        return str(self.result)


c = Calc()
