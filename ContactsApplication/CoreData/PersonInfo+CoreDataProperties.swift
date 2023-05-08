//
//  PersonInfo+CoreDataProperties.swift
//  ContactsApplicationAppSwiftUI
//
//  Created by Nitin on 4/26/23.
//
//

import Foundation
import CoreData


extension PersonInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonInfo> {
        return NSFetchRequest<PersonInfo>(entityName: "PersonInfo")
    }

    @NSManaged public var company: String?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: Data?
    @NSManaged public var lastName: String?
    @NSManaged public var notes: String?
    @NSManaged public var personToContact: Set<ContactInfo>?
    @NSManaged public var personToEmail: Set<EmailInfo>?
    @NSManaged public var personToUrl: Set<UrlInfo>?
    @NSManaged public var personToAddress: Set<AddressInfo>?
    @NSManaged public var personToBirthdate: Set<BirthdateInfo>?
    @NSManaged public var personToDate: Set<DateInfo>?
    @NSManaged public var personToRelated: Set<RelatedInfo>?
    @NSManaged public var personToProfile: Set<SocialProfileInfo>?
    @NSManaged public var personToMessage: Set<InstantMessageInfo>?

}

// MARK: Generated accessors for personToContact
extension PersonInfo {

    @objc(addPersonToContactObject:)
    @NSManaged public func addToPersonToContact(_ value: ContactInfo)

    @objc(removePersonToContactObject:)
    @NSManaged public func removeFromPersonToContact(_ value: ContactInfo)

    @objc(addPersonToContact:)
    @NSManaged public func addToPersonToContact(_ values: Set<ContactInfo>)

    @objc(removePersonToContact:)
    @NSManaged public func removeFromPersonToContact(_ values: Set<ContactInfo>)

}

// MARK: Generated accessors for personToEmail
extension PersonInfo {

    @objc(addPersonToEmailObject:)
    @NSManaged public func addToPersonToEmail(_ value: EmailInfo)

    @objc(removePersonToEmailObject:)
    @NSManaged public func removeFromPersonToEmail(_ value: EmailInfo)

    @objc(addPersonToEmail:)
    @NSManaged public func addToPersonToEmail(_ values: Set<EmailInfo>)

    @objc(removePersonToEmail:)
    @NSManaged public func removeFromPersonToEmail(_ values: Set<EmailInfo>)

}

// MARK: Generated accessors for personToUrl
extension PersonInfo {

    @objc(addPersonToUrlObject:)
    @NSManaged public func addToPersonToUrl(_ value: UrlInfo)

    @objc(removePersonToUrlObject:)
    @NSManaged public func removeFromPersonToUrl(_ value: UrlInfo)

    @objc(addPersonToUrl:)
    @NSManaged public func addToPersonToUrl(_ values: Set<UrlInfo>)

    @objc(removePersonToUrl:)
    @NSManaged public func removeFromPersonToUrl(_ values: Set<UrlInfo>)

}

// MARK: Generated accessors for personToAddress
extension PersonInfo {

    @objc(addPersonToAddressObject:)
    @NSManaged public func addToPersonToAddress(_ value: AddressInfo)

    @objc(removePersonToAddressObject:)
    @NSManaged public func removeFromPersonToAddress(_ value: AddressInfo)

    @objc(addPersonToAddress:)
    @NSManaged public func addToPersonToAddress(_ values: Set<AddressInfo>)

    @objc(removePersonToAddress:)
    @NSManaged public func removeFromPersonToAddress(_ values: Set<AddressInfo>)

}

// MARK: Generated accessors for personToBirthdate
extension PersonInfo {

    @objc(addPersonToBirthdateObject:)
    @NSManaged public func addToPersonToBirthdate(_ value: BirthdateInfo)

    @objc(removePersonToBirthdateObject:)
    @NSManaged public func removeFromPersonToBirthdate(_ value: BirthdateInfo)

    @objc(addPersonToBirthdate:)
    @NSManaged public func addToPersonToBirthdate(_ values: Set<BirthdateInfo>)

    @objc(removePersonToBirthdate:)
    @NSManaged public func removeFromPersonToBirthdate(_ values: Set<BirthdateInfo>)

}

// MARK: Generated accessors for personToDate
extension PersonInfo {

    @objc(addPersonToDateObject:)
    @NSManaged public func addToPersonToDate(_ value: DateInfo)

    @objc(removePersonToDateObject:)
    @NSManaged public func removeFromPersonToDate(_ value: DateInfo)

    @objc(addPersonToDate:)
    @NSManaged public func addToPersonToDate(_ values: Set<DateInfo>)

    @objc(removePersonToDate:)
    @NSManaged public func removeFromPersonToDate(_ values: Set<DateInfo>)

}

// MARK: Generated accessors for personToRelated
extension PersonInfo {

    @objc(addPersonToRelatedObject:)
    @NSManaged public func addToPersonToRelated(_ value: RelatedInfo)

    @objc(removePersonToRelatedObject:)
    @NSManaged public func removeFromPersonToRelated(_ value: RelatedInfo)

    @objc(addPersonToRelated:)
    @NSManaged public func addToPersonToRelated(_ values: Set<RelatedInfo>)

    @objc(removePersonToRelated:)
    @NSManaged public func removeFromPersonToRelated(_ values: Set<RelatedInfo>)

}

// MARK: Generated accessors for personToProfile
extension PersonInfo {

    @objc(addPersonToProfileObject:)
    @NSManaged public func addToPersonToProfile(_ value: SocialProfileInfo)

    @objc(removePersonToProfileObject:)
    @NSManaged public func removeFromPersonToProfile(_ value: SocialProfileInfo)

    @objc(addPersonToProfile:)
    @NSManaged public func addToPersonToProfile(_ values: Set<SocialProfileInfo>)

    @objc(removePersonToProfile:)
    @NSManaged public func removeFromPersonToProfile(_ values: Set<SocialProfileInfo>)

}

// MARK: Generated accessors for personToMessage
extension PersonInfo {

    @objc(addPersonToMessageObject:)
    @NSManaged public func addToPersonToMessage(_ value: InstantMessageInfo)

    @objc(removePersonToMessageObject:)
    @NSManaged public func removeFromPersonToMessage(_ value: InstantMessageInfo)

    @objc(addPersonToMessage:)
    @NSManaged public func addToPersonToMessage(_ values: Set<InstantMessageInfo>)

    @objc(removePersonToMessage:)
    @NSManaged public func removeFromPersonToMessage(_ values: Set<InstantMessageInfo>)

}

extension PersonInfo : Identifiable {

}
