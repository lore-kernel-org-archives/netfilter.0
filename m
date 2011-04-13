From: "Greg Scott" <GregScott@Infrasupport.com>
Subject: Very strange ftp mget problem
Date: Wed, 13 Apr 2011 07:06:29 -0500
Message-ID: <925A849792280C4E80C5461017A4B8A27D88F5@mail733.InfraSupportEtc.com>
References: <925A849792280C4E80C5461017A4B8A27D88F4@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I'm posting here because maybe ip_conntrack_ftp might have a problem.=A0=
 Or it could be hardware...

I have a scenario with 2 firewalls in an active/standby pair, creativel=
y named fw1 and fw2.=A0=A0 We recently failed over to fw1 and the probl=
em started about that time.=A0 Failing back over to fw2, the problem we=
nt away.=A0 Sort of.

Here's the problem -=20

An AS/400 behind the firewall starts up a batch job running a script th=
at does an ftp mget of several dozen or more files from an ftp site.=A0=
 The mget hangs at random times, sometimes almost immediately, other ti=
mes after copying =A0as many as a few hundred files.=A0 =A0=A0We could =
reproduce this problem at will when fw1 was the active firewall. Failin=
g over to fw2, mgets on the AS/400 work as expected and have not genera=
ted any errors.=A0 The problem seems unique to this particular ftp site=
 and fw1.

When doing ftp mgets directly on fw1 or fw2, both hang, but only with m=
gets from the one remote site in question.=A0 I can do mgets from sever=
al other test sites without error, both with fw1 or fw2 as a destinatio=
n and routing through fw1 and/or fw2. =20

Both fw1 and fw2 are HP minitowers, about 4 years old by now.=A0 I forg=
et the exact hardware models. Fw1 is running kernel 2.6.18 and fw2 uses=
 kernel 2.6.25 or so.  Both have identical copies of iptables rules and=
 other config info.  I found nothing interesting in /var/log/messages.

How do I troubleshoot this?=A0 What causes an ftp mget to hang? =20

Thanks

- Greg Scott
