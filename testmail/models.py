from django.db import models
from django.core.mail import send_mail


class Mail(models.Model):
    subject = models.CharField(max_length=50)
    message = models.TextField()
    from_email = models.CharField(max_length=50)
    recipient_list = models.CharField(max_length=50)

    def send(self):
        send_mail(subject=self.subject, message=self.message, from_email=self.from_email, recipient_list=[self.recipient_list, ])

    def save(self, *args, **kwargs):
        self.send()
        return super().save(*args, **kwargs)
