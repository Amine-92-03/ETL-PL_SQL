GRANT execute ON utl_mail TO PUBLIC

ALTER SYSTEM SET SMTP_OUT_SERVER = 'smtp.gmail.com:587';

BEGIN
    UTL_MAIL.send(
    sender => 'mefti.amine92@gmail.com',
    recipients => 'mefti.amine92@gmail.com',
    subject => 'Testing ..',
    message => 'Test Message!');
END;