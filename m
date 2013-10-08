From: Anand Raj Manickam <anandrm@gmail.com>
Subject: nat ftp helper bypass
Date: Tue, 8 Oct 2013 11:16:43 +0530
Message-ID: <CAEyr1FSRd7d2_kcPEY7DP4JfAdDaYj5TogeVj+90LrVVxqP-6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ScYqng+KJMo3/loFFcjTA1V+/Fcy48PDnjkyyLY7VNk=;
        b=JlVKjEf41Wv0jKLo6337vVDjSu6TwYncy16HCtI7U0r7nnUHV5W35jp1rOcRYEeaG8
         4t6HV/98jM01aNonOKgLVcQ3VhN2NlyrD25OFLd5wKi/SBFXtbpYqF3yDEzbN0B7nskF
         GWTcSJUA0A1WHHo/X9gHASpxfwiGVArr3KOXvM2+5VDMp7Ey78xiJskTOJGr5QLD/BXW
         DWgtFhsL7h+Q6Ku8XD0KBR0ypmQ7yASdqjDCcCbHG+DSzRHxtEASfG1I65CWB8fpv2PC
         yj1nBGMkeHBWNMTMXYKfG7e8QiuUANlGRfIIxq2F/79fQJ84JK28S9YpXy+tZO0+NZRU
         /w0w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there a way to bypass nat ftp helper for a few connections and
allow the rest of the FTP connections to NAT with the FTP helper
module ?
The need is to NAT the FTP control and data connections without
conntrack-helpers .
