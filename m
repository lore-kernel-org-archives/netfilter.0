From: kay <kay.diam@gmail.com>
Subject: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 11:22:03 +0400
Message-ID: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=lUCXN4mZopfd1gKQwKjoCkornYfSuc/hkh12GhTFdOk=;
        b=cpdS/rzGIEuK1H1xSrrbli/8XSOM47FPI5JPcomCthdNxeyzgj7Kbusk4uzsjeCY+C
         E9i2GBL5RNzKNwWBxdNWoCkPPh4A5vxdMr3868+cUUxxvBFv+ziJZJ59RZjRj0yAbZiF
         0LgFax6tdfBICM9aRn52iNLFCUeXNcRyyYfXtRQbTB1XuByr81rOYXy2tkNqD492Qs20
         C3aVyjcazbYjmbR085Qrqa7kfxfxnv1sle/yaveBB2sztFS5m81hhoUl9nIVtApI6H9b
         OEVekHS4aD2aQ0rZwVplc/d20ZW0ilELqlUIwpf6hTuQcDo4Z017bBe4qjPFxDjbDuB4
         4Ueg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello guys,

I have very strange requirement. I need to DNAT (using RAWDNAT) the
already established connection (simple HTTP keepalive) to another
server without TCP session reestablishment.

For example I have web0 (input gateway), web1 (primary server), web2
(slave server). SYN/ACK should be processed by web1, but "GET
HTTP/1.1" request should be passed to web2. For this purposes, I
guess, I need to establish fake connections on web2 which should be
the same as on web1. I've already implemented RAWDNAT + RAWSNAT and
SYN/ACK packet goes to web1 and all subsequent packets goes to web2,
but web2 ignores them as it doesn't know about them. Is it possible to
implement my requirement using conntrackd?

Thanks in advance.
