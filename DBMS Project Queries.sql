select proprietary_name from medication, patient, prescription,prescription_item where patientMRN = mrn and prescription.prescriptionID = prescription_item.prescriptionID and NDC = ndcCode and scriptDATETIME LIKE "2015-09-10%" order by proprietary_name;

select distinct proprietary_name, sum(billing_charge) as total_charge from prescription_item, medication where prescriptionDATETIME > '2015-09-01' AND prescriptionDATETIME < '2016-12-30' group by (proprietary_name);

select distinct dispenseID, nonproprietary_name, dosage as prescribed_dosage, quantity as dispensed_dosage from dispense_note, prescription_item, medication where quantity != dosage and medNDC = NDC and dispense_note.prescriptionID = item_id;

select distinct lname, fname, item_id as prescriptionItem_ID, refills from prescription_item, dispense_note, patient,prescription where patientMRN = mrn and prescription_item.prescriptionID = prescription.prescriptionID and item_id = dispense_note.prescriptionID;

select distinct dispenseID, nonproprietary_name, lname as PatientLastName, fname as PatientFirstName, gender, address, contact_information, insurance_company, insuranceID from medication, dispense_note, patient, prescription,prescription_item where dispense_note.prescriptionID = prescription_item.item_id and prescription_item.prescriptionID = prescription.prescriptionID  and patientMRN = mrn and medNDC = NDC order by lname;

select count(pharmacistID), fname as PharmacistFirstName, lname PharmacistLastName from dispense_note, pharmacist where pharmacistID = id group by pharmacistID;

select item_id from prescription_item a where a.item_id NOT IN (select prescriptionID from dispense_note);

select noteID, pharmacist.id as Pharmacist_ID, pharmacist.fname as Pharmacist_FirstName, pharmacist.lname as Pharmacist_LastName, NPI as Provider_NPI, provider.fname as Provider_FirstName, provider.lname as Provider_LastName from pharmacy_note, pharmacist, provider, prescription, prescription_item where pharmacy_note.pharmacistID = pharmacist.id and pharmacy_note.prescriptionID = prescription_item.item_id and prescription_item.prescriptionID = prescription.prescriptionID and providerNPI = NPI;