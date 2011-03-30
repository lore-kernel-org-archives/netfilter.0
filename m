From: Bruno Deschamps <deepjm@gmail.com>
Subject: Iproute2 SNAT SIP VoIP
Date: Wed, 30 Mar 2011 16:55:53 -0300
Message-ID: <AANLkTinPEik0KQ5EU+noy6Y5RAq97qWwR-oJn51y-P_h@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=uGx/yc/J9bd+lfC8ZMMN3FKtM//r6poeOgdZXbQt4WY=;
        b=Pa3AdWFusDtfXtjDI+fFgf3a704M2B+QJRGqo5SxW06W1jZyYodtn4XvxD0RUPiAMF
         Ch3e9pv0Wdv5kvwbyFk29WiqN2p0JiO23fY+ZBobZ+y1FzdloKcVkazWofki3UKuQhBv
         P/jlx/VLyerZEXXQGn6XH6sqOccOCugZu+b+Q=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello
I'm having some problems using iproute2 and iptables with SNAT to a
SIP server(VoIP)

My network structure is as follows:
eth0 - LAN
eth1 - Link1
eth2 - LINK2

By default the output for the SIP is made by link1. When falls the
first link I do aSNAT for leaving for my destination link2.
What happens is that when it happens I monitor the network interface
eth2 with tcpdump and it still leaving the source as the link1 link2
and not as it should be. Evenas I mark the target 0x2 table mangle and
a SNAT in nat table

The modules are active ip_conntrack_sip and ip_nat_sip

Someone has been there?
