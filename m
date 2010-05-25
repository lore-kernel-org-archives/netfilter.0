From: Ashok Rao <greatarbor@gmail.com>
Subject: openwrt Atheros ar71xxx based router reboots with RAWDNAT, RAWSNAT
Date: Mon, 24 May 2010 21:09:00 -0400
Message-ID: <AANLkTimCBl0ADwbcVsW1wVSeDuXMF0Rd2lNLeTks-DxC@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:content-type;
        bh=p7aI+pqv3qG3Q0Y6pOceFN023VPA/1YGK3OsnwMWEqA=;
        b=qgGy93o24BzFDdcvAovcwtq6NQMyuRWDTtkoC9kr8HzKHloE99IETLHIW5risgKl5f
         76NKfZVSbTueeV/rIwmCwBqA3iYtP3qnQDGR5CvII6uavmpX4DzMCYwn96cyOdUJL3c3
         EL8QwGBwhS8mIiEwbkahq40ZR9c87AK2wotVc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Am running the latest openwrt snapshot: kernel 2.6.32.12, iptables
v1.4.7,  xtables-addons v 1.22  on an Atheror ar71xxx based router
which has mips core

The router reboots when it receives any packets which need to be
RAWDNATed or RAWSNATed.  I have also tried xtables-addons v1.26 with
the
same result.

The RAWNAT modules were working fine on a brcm47xx platform (Broadcom
5352 chips which has the mipsel CPU-core)

Here is the iptables rule:
iptables -t rawpost -A POSTROUTING -p icmp -j RAWSNAT --to-source
192.168.100.100

Any ping packets sent to the router cause an instant reboot and
connectivity is lost

I have to open up the router and break the warranty  to install a
serial console cable and haven't done that yet. In the meantime, if
anyone has a clue please  post

Ashok
