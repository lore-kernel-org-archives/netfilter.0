From: Mekabe Ramein <mrmrmrmr@gmail.com>
Subject: connection tracking problem ?
Date: Tue, 14 Apr 2009 20:36:29 +0300
Message-ID: <5c0c5c050904141036i77ffac22i6786df1361b2fd48@mail.gmail.com>
References: <5c0c5c050904141033w1f66c6d6waa068b937861a20@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=gfVwEWk5U859sI9Pb0p/gpo4MMdEnHMLg5EfQxqvLE8=;
        b=uuCMKDbKvczfQrrxDlQHqPrVqAxfrnf5dZRbXM0NjGQ3rVxkz+qUIX+rA21GWCn/8n
         0CvVvcgKRqSiHZSIGXimrWhwPLDtl/g/zkZ1n/Qim6m5marRHhLf+m8Buk9N0mqNIS7x
         Kl7euR/VG5rtgRNYuCGJL3aR+fpKJU3h2H6Rg=
In-Reply-To: <5c0c5c050904141033w1f66c6d6waa068b937861a20@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I am not sure if this is the right list to ask my question. Please
don't ignore me and try to forward me to the right place to ask.
I am a user of Shorewall firewall which uses iptables and netfilter
features. When I asked this question on the Shorewall list they
couldn't help me and forwarded to here.

I am using Shorewall on CentOS with kernel=A02.6.18-92.1.13.el5.
The box has 3 ethernet interfaces and 1 wifi interface.
On one of the ethernet interfaces (eth1) pppoe is running and ppp0 is
the resulting wan interface.
The wifi interface (ath0) and another ethernet (eth2) is member of a
bridge interface (br0).
So we can say that there are two important interfaces. br0 for LAN ,
ppp0 for WAN.
All clients accessing internet, go through ppp0 and they are being
masquarared to ppp0's IP.
On the same box, Asterisk (SIP server) is running (listenning on all
interfaces on udp 5060), and there are 2 SIP clients on br0 interface
which register to Asterisk.

I hope this is clear enough; now the problem:

When the box is fresh (new booted), all sip clients on br0 interface
can register to Asterisk (they send register messgae on udp 5060 and
Asterisk responds)
They re-register every 10 minutes.
After some time, I notice that one or two of the clients are not
registered. When I trace packets from the client with tcpdump, I see
that the client is sending the register packet and the CentOS box is
receiving the packets on br0 however, these packets are not delivered
to application (Asterisk).
I understand that the packets is not delivered to Asterisk from
Asterisk SIP message debugs. Normally, when the server is fresh, I can
see the register messages on Asterisk SIP debugs.

This is a very disturbing problem for me.
I found out that when in this condition, if I reset the connection
tracking table with "conntrack -F" the clients can get registered
because their packets reach Asterisk application.
But it is not a matter of connection tracking table being full,
because my=A0ip_conntrack_max value shows 16384 and the box never
reaches that number.
It is around 400-500 if I check when the problem occurs.

I am looking for a solution for this issue desperately. If anyone can
help me, I'd be very glad.

Have a nice time...
