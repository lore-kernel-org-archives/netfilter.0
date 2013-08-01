From: Kevin Wilson <wkevils@gmail.com>
Subject: question about DNAT/SNAT
Date: Thu, 1 Aug 2013 17:29:08 +0300
Message-ID: <CAGXs5wUcwiHKbZ1fNydvVV5ZiOK4e4tU-4BhYoRcjw0muFi5vQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=q3vO7lACCf/fbggeSM8pfszhUuEOPiNd/hRdG/pcKxg=;
        b=J2j1m0H2xwP4KO9qFNYI34znd4Gqoo66DqOuZkbPpBM2/gZe0KnOlKl0IDb22U2Phl
         Bso8TKrTogI6JyRoa9WUUHP3wZnblBw4SxsvOwAYhXrEO01eW5q3iHL4/4zzNC/v4m3A
         01wT8t5Fvu3hzAsNCo38JxgJHeGlO4lHKCwFI+LsjVikK7UYqLOX3UbPyZ3NW+eZiZXK
         6zvb/lbhHZyH36p9kOw3qa8dmmUrPtXYz2f1dsw3cSJlGT3H56T594z7tj2pXWwM2bcM
         tDxysQErJN5Nbnyi9hwFmmJLYuNKrNQUtFuTj/S+GsHiyrV6puLCW4a99mp+E3wzF/RO
         ZUPg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
In the kernel DNAT/SNAT module,
net/netfilter/xt_nat.c,
we have two xt_target objects to DNAT and two for SNAT.
The revision field of them  is "0" or "1".

And for DNAT we have
xt_dnat_target_v0() and as the target() callback for the object of
revision 0, and
xt_dnat_target_v1() for the object of revision 1.

AFAIK, when adding a simple DNAT rule like:
iptables -t nat -A PREROUTING -p udp --dport 9999 -j DNAT
  --to-destination 192.168.1.7-192.168.1.20  -i eth0
we use the xt_dnat_target_v0()

My question is: in which occasion is the xt_target  object of revision
1, xt_dnat_target_v1(), called ?

can someone tell some iptables rule which will use xt_dnat_target_v1()?


regards,
Kevin
