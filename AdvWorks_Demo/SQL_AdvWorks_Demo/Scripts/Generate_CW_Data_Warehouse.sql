USE [master]
GO
/****** Object:  Database [CW_DataWarehouse]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE DATABASE [CW_DataWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CW_DataWarehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CW_DataWarehouse.mdf' , SIZE = 37888KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CW_DataWarehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CW_DataWarehouse_log.ldf' , SIZE = 26816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CW_DataWarehouse] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CW_DataWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CW_DataWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CW_DataWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CW_DataWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CW_DataWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CW_DataWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [CW_DataWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [CW_DataWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CW_DataWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CW_DataWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CW_DataWarehouse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CW_DataWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CW_DataWarehouse]
GO
/****** Object:  Schema [HumanResources]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE SCHEMA [HumanResources]
GO
/****** Object:  Schema [Person]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE SCHEMA [Person]
GO
/****** Object:  Schema [Production]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE SCHEMA [Production]
GO
/****** Object:  Schema [Purchasing]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE SCHEMA [Purchasing]
GO
/****** Object:  Schema [Sales]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE SCHEMA [Sales]
GO
/****** Object:  XmlSchemaCollection [HumanResources].[HRResumeSchemaCollection]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE XML SCHEMA COLLECTION [HumanResources].[HRResumeSchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume" elementFormDefault="qualified"><xsd:element name="Address" type="t:AddressType" /><xsd:element name="Education" type="t:EducationType" /><xsd:element name="Employment" type="t:EmploymentType" /><xsd:element name="Location" type="t:LocationType" /><xsd:element name="Name" type="t:NameType" /><xsd:element name="Resume" type="t:ResumeType" /><xsd:element name="Telephone" type="t:TelephoneType" /><xsd:complexType name="AddressType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Addr.Type" type="xsd:string" /><xsd:element name="Addr.OrgName" type="xsd:string" minOccurs="0" /><xsd:element name="Addr.Street" type="xsd:string" maxOccurs="unbounded" /><xsd:element name="Addr.Location"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="t:Location" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="Addr.PostalCode" type="xsd:string" /><xsd:element name="Addr.Telephone" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="t:Telephone" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="EducationType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Edu.Level" type="xsd:string" /><xsd:element name="Edu.StartDate" type="xsd:date" /><xsd:element name="Edu.EndDate" type="xsd:date" /><xsd:element name="Edu.Degree" type="xsd:string" minOccurs="0" /><xsd:element name="Edu.Major" type="xsd:string" minOccurs="0" /><xsd:element name="Edu.Minor" type="xsd:string" minOccurs="0" /><xsd:element name="Edu.GPA" type="xsd:string" minOccurs="0" /><xsd:element name="Edu.GPAAlternate" type="xsd:decimal" minOccurs="0" /><xsd:element name="Edu.GPAScale" type="xsd:decimal" minOccurs="0" /><xsd:element name="Edu.School" type="xsd:string" minOccurs="0" /><xsd:element name="Edu.Location" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="t:Location" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="EmploymentType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Emp.StartDate" type="xsd:date" minOccurs="0" /><xsd:element name="Emp.EndDate" type="xsd:date" minOccurs="0" /><xsd:element name="Emp.OrgName" type="xsd:string" /><xsd:element name="Emp.JobTitle" type="xsd:string" /><xsd:element name="Emp.Responsibility" type="xsd:string" /><xsd:element name="Emp.FunctionCategory" type="xsd:string" minOccurs="0" /><xsd:element name="Emp.IndustryCategory" type="xsd:string" minOccurs="0" /><xsd:element name="Emp.Location" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="t:Location" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="LocationType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Loc.CountryRegion" type="xsd:string" /><xsd:element name="Loc.State" type="xsd:string" minOccurs="0" /><xsd:element name="Loc.City" type="xsd:string" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="NameType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Name.Prefix" type="xsd:string" minOccurs="0" /><xsd:element name="Name.First" type="xsd:string" /><xsd:element name="Name.Middle" type="xsd:string" minOccurs="0" /><xsd:element name="Name.Last" type="xsd:string" /><xsd:element name="Name.Suffix" type="xsd:string" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="ResumeType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="t:Name" /><xsd:element name="Skills" type="xsd:string" minOccurs="0" /><xsd:element ref="t:Employment" maxOccurs="unbounded" /><xsd:element ref="t:Education" maxOccurs="unbounded" /><xsd:element ref="t:Address" maxOccurs="unbounded" /><xsd:element ref="t:Telephone" minOccurs="0" /><xsd:element name="EMail" type="xsd:string" minOccurs="0" /><xsd:element name="WebSite" type="xsd:string" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="TelephoneType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Tel.Type" type="xsd:anyType" minOccurs="0" /><xsd:element name="Tel.IntlCode" type="xsd:int" minOccurs="0" /><xsd:element name="Tel.AreaCode" type="xsd:int" minOccurs="0" /><xsd:element name="Tel.Number" type="xsd:string" /><xsd:element name="Tel.Extension" type="xsd:int" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [Person].[AdditionalContactInfoSchemaCollection]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE XML SCHEMA COLLECTION [Person].[AdditionalContactInfoSchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"><xsd:element name="AdditionalContactInfo"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactRecord"><xsd:element name="ContactRecord"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" /></xsd:choice><xsd:attribute name="date" type="xsd:date" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" elementFormDefault="qualified"><xsd:element name="eMail" type="t:eMailType" /><xsd:element name="facsimileTelephoneNumber" type="t:phoneNumberType" /><xsd:element name="homePostalAddress" type="t:addressType" /><xsd:element name="internationaliSDNNumber" type="t:phoneNumberType" /><xsd:element name="mobile" type="t:phoneNumberType" /><xsd:element name="pager" type="t:phoneNumberType" /><xsd:element name="physicalDeliveryOfficeName" type="t:addressType" /><xsd:element name="registeredAddress" type="t:addressType" /><xsd:element name="telephoneNumber" type="t:phoneNumberType" /><xsd:element name="telexNumber" type="t:phoneNumberType" /><xsd:complexType name="addressType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Street" type="xsd:string" maxOccurs="2" /><xsd:element name="City" type="xsd:string" /><xsd:element name="StateProvince" type="xsd:string" /><xsd:element name="PostalCode" type="xsd:string" minOccurs="0" /><xsd:element name="CountryRegion" type="xsd:string" /><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="eMailType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="eMailAddress" type="xsd:string" /><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="phoneNumberType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="number"><xsd:simpleType><xsd:restriction base="xsd:string"><xsd:pattern value="[0-9\(\)\-]*" /></xsd:restriction></xsd:simpleType></xsd:element><xsd:element name="SpecialInstructions" type="t:specialInstructionsType" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="specialInstructionsType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [Person].[IndividualSurveySchemaCollection]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE XML SCHEMA COLLECTION [Person].[IndividualSurveySchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey" elementFormDefault="qualified"><xsd:element name="IndividualSurvey"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="TotalPurchaseYTD" type="xsd:decimal" minOccurs="0" /><xsd:element name="DateFirstPurchase" type="xsd:date" minOccurs="0" /><xsd:element name="BirthDate" type="xsd:date" minOccurs="0" /><xsd:element name="MaritalStatus" type="xsd:string" minOccurs="0" /><xsd:element name="YearlyIncome" type="t:SalaryType" minOccurs="0" /><xsd:element name="Gender" type="xsd:string" minOccurs="0" /><xsd:element name="TotalChildren" type="xsd:int" minOccurs="0" /><xsd:element name="NumberChildrenAtHome" type="xsd:int" minOccurs="0" /><xsd:element name="Education" type="xsd:string" minOccurs="0" /><xsd:element name="Occupation" type="xsd:string" minOccurs="0" /><xsd:element name="HomeOwnerFlag" type="xsd:string" minOccurs="0" /><xsd:element name="NumberCarsOwned" type="xsd:int" minOccurs="0" /><xsd:element name="Hobby" type="xsd:string" minOccurs="0" maxOccurs="unbounded" /><xsd:element name="CommuteDistance" type="t:MileRangeType" minOccurs="0" /><xsd:element name="Comments" type="xsd:string" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:simpleType name="MileRangeType"><xsd:restriction base="xsd:string"><xsd:enumeration value="0-1 Miles" /><xsd:enumeration value="1-2 Miles" /><xsd:enumeration value="2-5 Miles" /><xsd:enumeration value="5-10 Miles" /><xsd:enumeration value="10+ Miles" /></xsd:restriction></xsd:simpleType><xsd:simpleType name="SalaryType"><xsd:restriction base="xsd:string"><xsd:enumeration value="0-25000" /><xsd:enumeration value="25001-50000" /><xsd:enumeration value="50001-75000" /><xsd:enumeration value="75001-100000" /><xsd:enumeration value="greater than 100000" /></xsd:restriction></xsd:simpleType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [Production].[ManuInstructionsSchemaCollection]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE XML SCHEMA COLLECTION [Production].[ManuInstructionsSchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions" elementFormDefault="qualified"><xsd:element name="root"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Location" maxOccurs="unbounded"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="step" type="t:StepType" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="LocationID" type="xsd:integer" use="required" /><xsd:attribute name="SetupHours" type="xsd:decimal" /><xsd:attribute name="MachineHours" type="xsd:decimal" /><xsd:attribute name="LaborHours" type="xsd:decimal" /><xsd:attribute name="LotSize" type="xsd:decimal" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:complexType name="StepType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="tool" type="xsd:string" /><xsd:element name="material" type="xsd:string" /><xsd:element name="blueprint" type="xsd:string" /><xsd:element name="specs" type="xsd:string" /><xsd:element name="diag" type="xsd:string" /></xsd:choice></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [Production].[ProductDescriptionSchemaCollection]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE XML SCHEMA COLLECTION [Production].[ProductDescriptionSchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" elementFormDefault="qualified"><xsd:element name="Maintenance"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="NoOfYears" type="xsd:string" /><xsd:element name="Description" type="xsd:string" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="Warranty"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="WarrantyPeriod" type="xsd:string" /><xsd:element name="Description" type="xsd:string" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription" elementFormDefault="qualified"><xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain" /><xsd:element name="Code" type="xsd:string" /><xsd:element name="Description" type="xsd:string" /><xsd:element name="ProductDescription" type="t:ProductDescription" /><xsd:element name="Taxonomy" type="xsd:string" /><xsd:complexType name="Category"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="t:Taxonomy" /><xsd:element ref="t:Code" /><xsd:element ref="t:Description" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="Features" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="ns1:Warranty" /><xsd:element ref="ns1:Maintenance" /><xsd:any namespace="##other" processContents="skip" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="Manufacturer"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Name" type="xsd:string" minOccurs="0" /><xsd:element name="CopyrightURL" type="xsd:string" minOccurs="0" /><xsd:element name="Copyright" type="xsd:string" minOccurs="0" /><xsd:element name="ProductURL" type="xsd:string" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="Picture"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Name" type="xsd:string" minOccurs="0" /><xsd:element name="Angle" type="xsd:string" minOccurs="0" /><xsd:element name="Size" type="xsd:string" minOccurs="0" /><xsd:element name="ProductPhotoID" type="xsd:integer" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="ProductDescription"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="Summary" type="t:Summary" minOccurs="0" /><xsd:element name="Manufacturer" type="t:Manufacturer" minOccurs="0" /><xsd:element name="Features" type="t:Features" minOccurs="0" maxOccurs="unbounded" /><xsd:element name="Picture" type="t:Picture" minOccurs="0" maxOccurs="unbounded" /><xsd:element name="Category" type="t:Category" minOccurs="0" maxOccurs="unbounded" /><xsd:element name="Specifications" type="t:Specifications" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ProductModelID" type="xsd:string" /><xsd:attribute name="ProductModelName" type="xsd:string" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="Specifications" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any processContents="skip" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="Summary" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="http://www.w3.org/1999/xhtml" processContents="skip" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [Sales].[StoreSurveySchemaCollection]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE XML SCHEMA COLLECTION [Sales].[StoreSurveySchemaCollection] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey" targetNamespace="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey" elementFormDefault="qualified"><xsd:element name="StoreSurvey"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="ContactName" type="xsd:string" minOccurs="0" /><xsd:element name="JobTitle" type="xsd:string" minOccurs="0" /><xsd:element name="AnnualSales" type="xsd:decimal" minOccurs="0" /><xsd:element name="AnnualRevenue" type="xsd:decimal" minOccurs="0" /><xsd:element name="BankName" type="xsd:string" minOccurs="0" /><xsd:element name="BusinessType" type="t:BusinessType" minOccurs="0" /><xsd:element name="YearOpened" type="xsd:gYear" minOccurs="0" /><xsd:element name="Specialty" type="t:SpecialtyType" minOccurs="0" /><xsd:element name="SquareFeet" type="xsd:float" minOccurs="0" /><xsd:element name="Brands" type="t:BrandType" minOccurs="0" /><xsd:element name="Internet" type="t:InternetType" minOccurs="0" /><xsd:element name="NumberEmployees" type="xsd:int" minOccurs="0" /><xsd:element name="Comments" type="xsd:string" minOccurs="0" /></xsd:sequence></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:simpleType name="BrandType"><xsd:restriction base="xsd:string"><xsd:enumeration value="AW" /><xsd:enumeration value="2" /><xsd:enumeration value="3" /><xsd:enumeration value="4+" /></xsd:restriction></xsd:simpleType><xsd:simpleType name="BusinessType"><xsd:restriction base="xsd:string"><xsd:enumeration value="BM" /><xsd:enumeration value="BS" /><xsd:enumeration value="D" /><xsd:enumeration value="OS" /><xsd:enumeration value="SGS" /></xsd:restriction></xsd:simpleType><xsd:simpleType name="InternetType"><xsd:restriction base="xsd:string"><xsd:enumeration value="56kb" /><xsd:enumeration value="ISDN" /><xsd:enumeration value="DSL" /><xsd:enumeration value="T1" /><xsd:enumeration value="T2" /><xsd:enumeration value="T3" /></xsd:restriction></xsd:simpleType><xsd:simpleType name="SpecialtyType"><xsd:restriction base="xsd:string"><xsd:enumeration value="Family" /><xsd:enumeration value="Kids" /><xsd:enumeration value="BMX" /><xsd:enumeration value="Touring" /><xsd:enumeration value="Road" /><xsd:enumeration value="Mountain" /><xsd:enumeration value="All" /></xsd:restriction></xsd:simpleType></xsd:schema>'
GO
/****** Object:  UserDefinedDataType [dbo].[AccountNumber]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE TYPE [dbo].[AccountNumber] FROM [nvarchar](15) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Flag]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE TYPE [dbo].[Flag] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Name]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE TYPE [dbo].[Name] FROM [nvarchar](50) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[NameStyle]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE TYPE [dbo].[NameStyle] FROM [bit] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[OrderNumber]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE TYPE [dbo].[OrderNumber] FROM [nvarchar](25) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[Phone]    Script Date: 5/9/2017 11:09:33 AM ******/
CREATE TYPE [dbo].[Phone] FROM [nvarchar](25) NULL
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 5/9/2017 11:09:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[FullDateUK] [char](10) NULL,
	[FullDateUSA] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeekUSA] [char](1) NULL,
	[DayOfWeekUK] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHolidayUSA] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[HolidayUSA] [varchar](50) NULL,
	[IsHolidayUK] [bit] NULL,
	[HolidayUK] [varchar](50) NULL,
	[FiscalDayOfYear] [varchar](3) NULL,
	[FiscalWeekOfYear] [varchar](3) NULL,
	[FiscalMonth] [varchar](2) NULL,
	[FiscalQuarter] [char](1) NULL,
	[FiscalQuarterName] [varchar](9) NULL,
	[FiscalYear] [char](4) NULL,
	[FiscalYearName] [char](7) NULL,
	[FiscalMonthYear] [char](10) NULL,
	[FiscalMMYYYY] [char](6) NULL,
	[FiscalFirstDayOfMonth] [date] NULL,
	[FiscalLastDayOfMonth] [date] NULL,
	[FiscalFirstDayOfQuarter] [date] NULL,
	[FiscalLastDayOfQuarter] [date] NULL,
	[FiscalFirstDayOfYear] [date] NULL,
	[FiscalLastDayOfYear] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 5/9/2017 11:09:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimePK] [int] IDENTITY(1,1) NOT NULL,
	[DateValue] [datetime] NULL,
	[HourValue] [int] NULL,
	[MinuteValue] [int] NULL,
	[SecondValue] [int] NULL,
	[Meridian] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TimePK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Person].[Person]    Script Date: 5/9/2017 11:09:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Person].[Person](
	[BusinessEntityID] [int] NOT NULL,
	[PersonType] [nchar](2) NOT NULL,
	[NameStyle] [dbo].[NameStyle] NOT NULL CONSTRAINT [DF_Person_NameStyle]  DEFAULT ((0)),
	[Title] [nvarchar](8) NULL,
	[FirstName] [dbo].[Name] NOT NULL,
	[MiddleName] [dbo].[Name] NULL,
	[LastName] [dbo].[Name] NOT NULL,
	[Suffix] [nvarchar](10) NULL,
	[EmailPromotion] [int] NOT NULL CONSTRAINT [DF_Person_EmailPromotion]  DEFAULT ((0)),
	[AdditionalContactInfo] [xml](CONTENT [Person].[AdditionalContactInfoSchemaCollection]) NULL,
	[Demographics] [xml](CONTENT [Person].[IndividualSurveySchemaCollection]) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Person_rowguid]  DEFAULT (newid()),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Person_ModifiedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [Person].[Person]  WITH CHECK ADD  CONSTRAINT [CK_Person_EmailPromotion] CHECK  (([EmailPromotion]>=(0) AND [EmailPromotion]<=(2)))
GO
ALTER TABLE [Person].[Person] CHECK CONSTRAINT [CK_Person_EmailPromotion]
GO
ALTER TABLE [Person].[Person]  WITH CHECK ADD  CONSTRAINT [CK_Person_PersonType] CHECK  (([PersonType] IS NULL OR (upper([PersonType])='GC' OR upper([PersonType])='SP' OR upper([PersonType])='EM' OR upper([PersonType])='IN' OR upper([PersonType])='VC' OR upper([PersonType])='SC')))
GO
ALTER TABLE [Person].[Person] CHECK CONSTRAINT [CK_Person_PersonType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the Resume column in the HumanResources.JobCandidate table.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'HRResumeSchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the AdditionalContactInfo column in the Person.Contact table.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'AdditionalContactInfoSchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the Demographics column in the Person.Person table.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'IndividualSurveySchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the Instructions column in the Production.ProductModel table.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'ManuInstructionsSchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the CatalogDescription column in the Production.ProductModel table.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'ProductDescriptionSchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of XML schemas for the Demographics column in the Sales.Store table.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'XML SCHEMA COLLECTION',@level1name=N'StoreSurveySchemaCollection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to employees and departments.' , @level0type=N'SCHEMA',@level0name=N'HumanResources'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to names and addresses of customers, vendors, and employees' , @level0type=N'SCHEMA',@level0name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to products, inventory, and manufacturing.' , @level0type=N'SCHEMA',@level0name=N'Production'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to vendors and purchase orders.' , @level0type=N'SCHEMA',@level0name=N'Purchasing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contains objects related to customers, sales orders, and sales territories.' , @level0type=N'SCHEMA',@level0name=N'Sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Person records.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary type of person: SC = Store Contact, IN = Individual (retail) customer, SP = Sales person, EM = Employee (non-sales), VC = Vendor contact, GC = General contact' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'PersonType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = The data in FirstName and LastName are stored in western style (first name, last name) order.  1 = Eastern style (last name, first name) order.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'NameStyle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 0' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'DF_Person_NameStyle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A courtesy title. For example, Mr. or Ms.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of the person.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Middle name or middle initial of the person.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'MiddleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of the person.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Surname suffix. For example, Sr. or Jr.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Suffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Contact does not wish to receive e-mail promotions, 1 = Contact does wish to receive e-mail promotions from AdventureWorks, 2 = Contact does wish to receive e-mail promotions from AdventureWorks and selected partners. ' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'EmailPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 0' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'DF_Person_EmailPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Additional contact information about the person stored in xml format. ' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'AdditionalContactInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Personal information such as hobbies, and income collected from online shoppers. Used for sales analysis.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Demographics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'rowguid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of NEWID()' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'DF_Person_rowguid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'DF_Person_ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'PK_Person_BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [EmailPromotion] >= (0) AND [EmailPromotion] <= (2)' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'CK_Person_EmailPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [PersonType] is one of SC, VC, IN, EM or SP.' , @level0type=N'SCHEMA',@level0name=N'Person', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'CONSTRAINT',@level2name=N'CK_Person_PersonType'
GO
USE [master]
GO
ALTER DATABASE [CW_DataWarehouse] SET  READ_WRITE 
GO
