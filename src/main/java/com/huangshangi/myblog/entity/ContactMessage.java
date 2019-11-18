package com.huangshangi.myblog.entity;

public class ContactMessage {

    private  int contactId;//留言id

    private String contactEmail;//留言者email

    private String contactName;//留言者昵称

    private String contactMessage;//留言信息

    private String contactTime;//留言时间

    public ContactMessage() {
    }

    public ContactMessage(int contactId, String contactEmail, String contactName, String contactMessage, String contactTime) {
        this.contactId = contactId;
        this.contactEmail = contactEmail;
        this.contactName = contactName;
        this.contactMessage = contactMessage;
        this.contactTime = contactTime;
    }

    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactMessage() {
        return contactMessage;
    }

    public void setContactMessage(String contactMessage) {
        this.contactMessage = contactMessage;
    }

    public String getContactTime() {
        return contactTime;
    }

    public void setContactTime(String contactTime) {
        this.contactTime = contactTime;
    }
}
