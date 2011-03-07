From: benjamin fernandis <benjo11111@gmail.com>
Subject: connlimit
Date: Mon, 7 Mar 2011 17:23:09 +0530
Message-ID: <AANLkTimvu4CSZqsrbMgJHLXB5L8asRpZ+Aq7UM18MWhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=luNfQ7jp8iWdYCbOom8l1Ak9xSoaFvQ/5H7q1Kytpxs=;
        b=Xfz1T2kTJnPRt7fJoKRtAA+SpDcLGeVC67w7A6QRdPSy9TqtPPsZaMXDlDE9sWdIQY
         fKLfq1IJzQVesM+XbhfqovbUgBD9nSMfiGrVOVoo8nVv7M3pOd91XWkxPjAsDYhS7eOy
         VgcnKN9Bsq0xUBK2OWYVdzQy1CuXz82aunoq4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a mail server with web server which have 500 customers site and
mail account.Since couple of days i m suffering with so many
connections.

So please guide me to configure ratelimit for that.I need to confiugre
connlimit for http , imap , imaps, pop, smtp.

and also suggest me connlimit value which is ideal for my setup.

OS REDHAT 5.5

Thanks,
Benjo
