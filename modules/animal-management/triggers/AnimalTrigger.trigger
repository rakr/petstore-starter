/**
 * @description Trigger on animal object
 *              When an animal is created, we need to create a vet
 *              appointment. The booking is created upon animal record
 *              creation.
 */
trigger AnimalTrigger on Animal__c (after insert) {
    Map<Id, Animal__c> newAnimals = (Map<Id, Animal__c>) Trigger.newMap;
    Type handlerType = Type.forName('BookingHandler');
    AnimalTriggerHandler handler = (AnimalTriggerHandler) handlerType.newInstance();
    handler.handle(newAnimals);
    handlerType = Type.forName('ProductSelector');
    handler = (AnimalTriggerHandler) handlerType.newInstance();
    handler.handle(newAnimals);
}
