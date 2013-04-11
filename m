From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: [ipset] Match both on source AND destination
Date: Thu, 11 Apr 2013 16:52:06 +0200
Message-ID: <1365691926.25705.48.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:date:content-type:x-mailer
         :mime-version:content-transfer-encoding;
        bh=RyqY8NtfvaZOMsdmEEfSDn1yySa956D2T6+3IyQtxxg=;
        b=rV2bnUZpo/qtb8HG9a+Dz7h/iSdTLsNpcM193URBR24AkyyC+kByuoFBw/3kjIL96E
         CPCHhGVBKoaPJFXaNiv1lWs0G4Q+E4k3DHz/MlJTEsrIlEUsIBeLsnvFVUC0kHM1ZmwZ
         3/hZBCQPEcTXDiDcaVzK/8DjFATgNqRsM8ogALiUpBy6tBssttiWn2BY4Gok2nxDsjAy
         tYkvU2ad+RmmL8UcfNn1nf7KltvQojvs3deNVKJdnBrVnAWovAXLBIsDJSPPPw3bUbe8
         OXEbFKOQ/KhwwlWMarg7ZW+gyLVzgXC9gASjKqeIcVzNske6n6DMpKeeB6I3L09je+Cl
         vCxA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Is it possible to match both source and destination from the same set.

I have two networks:

- 192.168.1.0/24
- 192.168.2.0/24

And I'd like to match packets going from one to another (the set can be
bigger of course).

Without ipset it would be:

-A FORWARD -s 192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT

However this won't work using ipset:

-A FORWARD -m set --match-set mynets src,dst -j ACCEPT

However, as stated in the man page match is done only on src and
therefore this is not the behavior I was expecting.

A part from listing each networks one by one, do you see any solution
for that?

--
Jimmy


