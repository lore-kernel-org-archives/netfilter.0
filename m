From: Thomas Nyberg <tomuxiong@gmail.com>
Subject: Using iptables to only allow a specific application to use certain
 ports
Date: Fri, 5 Feb 2016 12:06:08 -0500
Message-ID: <56B4D680.3060302@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=7F7MyXLN3RS12VS7z+CA6GQapyNYcXk+Jj+KWQJN7NE=;
        b=QcRmaZAHU+dLCEy7ikkOCcgrm5P22dg4cOhTBpkl0T+hPcuqz2eTVKrEkrcaXP5+5G
         rOSK37nRAnIHL7HEWri8xfhqMjTnkDX5Yaz1RZ/tkSKEKo3C4mRPfBDYxrp7thuYHNpy
         TsWRs2qiyDUqUmVe3eCVUKMp84me6IxC336fDkNQOcKlh9tcLzH1T3Vc/BaK6qasyNw8
         nClbRSLW8LIso/a0OCHUW7WtUr/QaRO9cUV8N60ot8Scqf5cZ8IMShLtNaby68ePz1RB
         FF6z5t7Usm3fFDec4vkudbvBfj/965aKNSqqzgURFYsuva9/icWguEiBRz0CA8+JaWol
         2A8Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

The mosh program requires ports 60000-61000 for operation (well it can 
get by with less, but it appears it requires an indeterminate number of 
ports). Is it possible to only open these ports for the 
/usr/bin/mosh-server binary?

I've done some searching online and haven't been all that successful at 
figuring this out so I figured I'd ask here. Thanks so much!

Cheers,
Thomas
