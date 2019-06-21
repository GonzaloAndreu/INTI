

from lantz.ino import INODriver, QuantityFeat

class TemperatureSensor(INODriver):

    # We create a read only property for the arduino (si anda borro esto)
    temperature = QuantityFeat('TEMP', units='degC', setter=True)
