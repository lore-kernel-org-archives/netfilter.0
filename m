From: Michael Hakimi <yalakvar@gmail.com>
Subject: libNetfilterQueue - Capturing all traffic
Date: Wed, 5 May 2010 17:09:06 +0300
Message-ID: <h2of874118a1005050709h63a29eabi760a67add177db22@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=zYIqBcusk9SQJt6uIEie6ehgeogwX2U9Clw64gASsK0=;
        b=biZtAkZOJ9+A1RFIaPmhTVaZePeyHG+IW9xrz6mcY85G41dt7jwhYaclq/81WAmRZo
         NZP5CRDDdjPetWxH+2sFKTkECPpUo3/0t0zEmDXElXB3pCp8zHCqRqlNI1wOFf6F3TTh
         kQIy21J+L5c+TIb0SGIpGP21vWIYCnHj+5ijk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I am a new user to the Netfilter project.

I am trying to build an application that captures=C2=A0ALL the incoming
traffic using libNetfilterQueue. In the function nfq_bind_pf I need to
supply the protocol family. If I set it to AF_INET I get only IP
packets, if I set it to AF_PACKET the function fails.
I have also tried AF_UNSPEC but that didn't help.

Is there any way to to this?
Thank you for your help.

Regards,
Mickey
