From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 02 Nov 2009 16:51:31 +0100
Message-ID: <4AEF0003.5060404@plouf.fr.eu.org>
References: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

paddy joesoap a =E9crit :
>=20
> Normally I think of firewalls as controlling packet flows that pass
> through it (for example:Internet to Intranet).
>=20
> Can netfilter also control traffic on the same subnet?

Yes, if the traffic passes through it. This can be done by setting up a
filtering bridge using bridge-nf : the IP packets in bridged ethernet
frames will be filtered by iptables rules.

> Suppose I had the following set up:
> Internal Machines 1,2 and 3 are on the same subnet governed by the
> netfilter firewall.
>=20
>                                    ---------- Machine1
> Internet ------ Netfilter Firewall ---------- Machine2
>                                    ---------- Machine3

Does the Firewall bridge Machine1-3 together (and thus have a separate
ethernet interface for each one) or is there an ethernet switch between
them ? A switch won't pass the traffic between Machine1-3 to the Firewa=
ll.
