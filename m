From: Matthew Bellizzi <matthew.bellizzi@joby.aero>
Subject: Both SNAT MAC and DNAT MAC on packet
Date: Thu, 23 Mar 2023 13:48:14 -0700
Message-ID: <CAJkJqoQMmF1-oYv9uX9t2C=yyjkHN0Qv7-+aG65oo7_2+dg8tw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joby.aero; s=aero; t=1679604505;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUkYvSZ+cPmh91ipXivBhScjPRPWeziL+nNixOISh84=;
        b=pnEGXEhKUG2kuaQMgYKpEaOXm96R3xdER+j6USi0cABxzWFuxioaKKOskg5NXt+hIT
         U1MTyP0K5g9B5DFSAIER52kmtmF3LokSnWaOMI+CzTg++Bm2VtVDI2IxgwmOiqz7CT21
         ZRTXqciox7ylYNhsOeX8gBmbyfvh0gquYnJvKtIK+DU9OsBjRLaefCHVEmI3d7f/0lbI
         CHhY7/cjaq0VqXKnFp51WSdMNepqcBKCPOfhRrqDcC7JIYQ0gM9t1unbndPpdqYPOhd8
         ohRKf+uGiW2O0KMXqPeQFO8X1hpA0agR2dbaXn8k8srOCk83jbL9Q+3nsD8ccR6MHN3e
         7YbA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello.

I'm new here and new to nftables. Although familiar with iptables and
networking.   Anyways, what I'm trying to do is take a stream of
traffic and send it to another mac on a linux bridge.   The stream of
traffic is the output from a switch mirror port coming into the linux
bridge via one interface.   I'd need to keep the IP's unchanged.    I
also need to SNAT the source mac....because the switch generating
these mirrored packets is also plumbed into the linux bridge via
another interface.

I know. I know I sound like a crazy person.   I believe or not have
valid reasons for doing this and can't really talk about those.   I'm
going to try a ascii topo


switch-----------------eno1-----br0
switchmirrorport----eno0-----br0

TL;DR I need to completely change the MACs on duplicate packets
entering the same linux bridge on a different interface.   Destination
MAC is specific.  Source MAC could be anything.

Yes I know I'm insane

Sorry forgot to mention I tried this with ebtables and could get the
DNAT working but, could never seem to get the SNAT to work on those
DNAT'd packets

--=20
This email and any relevant attachments may include confidential and/or=20
proprietary information.=C2=A0 Any distribution or use by anyone other than=
 the=20
intended recipient(s) or other than for the intended purpose(s) is=20
prohibited and may be unlawful.=C2=A0 If you are not the intended recipient=
 of=20
this message, please notify the sender by replying to this message and then=
=20
delete it from your system.
