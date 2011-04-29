From: Mahmood Naderan <nt_mahmood@yahoo.com>
Subject: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 03:45:20 -0700 (PDT)
Message-ID: <642302.28729.qm@web111719.mail.gq1.yahoo.com>
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1304073920; bh=bsyW1Sb6jpy0jrPwerOAgBjxYgeFVOVtdbBP7/JqjRM=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=DUBvNks4el8VoidPdlbXbNuuGYQwVmSEjwtgHU4+LDp3GYX2uI0JoPnoGdmAYQ0wjjbovBnTZ/2TSF99P/XMinOL01LAAa9+IVM4Rk2ekxXNUJS2LleZFwhHuJlDtridZSRjfBQJ7/40f/8+gcnHApncN+L2CqNSscczfgAS1qA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
I have setup a diskless cluster where there is a head node (server) and=
 a computing node (client).=20
While settingup, I installed an image of linux using debootstrap. There=
 is no problem with that and=20
the node can boot and I can login to that.
=A0
The problem is when I want to open a port in the client using iptables,=
 I get some errors and have no
idea about them.
=A0
root@client:/home/mahmood# iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dpo=
rt 4949=A0 -j ACCEPT

=46ATAL: Could not load /lib/modules/2.6.32-24-server/modules.dep: No s=
uch file or directory
iptables v1.4.4: can't initialize iptables table `filter': iptables who=
? (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

Any suggestion is welcomed.

// Naderan *Mahmood;
