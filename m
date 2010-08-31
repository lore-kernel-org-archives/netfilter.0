From: Giacomo Bernardi <mino@minux.it>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Tue, 31 Aug 2010 15:49:38 +0100
Message-ID: <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com> <4C7D11F5.1010105@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7D11F5.1010105@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

> Try adding static ARP entries to each device's MAC address using diff=
erent
> (bogus) IPs. =A0Then try communicating with the bogus IPs. =A0You mig=
ht get
> lucky and be able to communicate. =A0It really depends on what is inc=
luded in
> the higher layer protocol. =A0(I've not dealt with enough SNMP to kno=
w if this
> is possible.)

Doesn't seem to work, despite I created the arp entry with:
 arp -s 10.2.0.1 00:11:22:33:44:55

To be honest I'm not surprised: how is the receiver of those datagram
supposed to know they are for itself, since the dstip doesn't match
the IP of the local incoming interface?

> Check why replies do not get translated back. Use -j TRACE for them.

Good idea.
I've added a:
iptables -t raw -A PREROUTING -s 10.0.0.1 -j TRACE
which I can see getting matches. However nothing is logging in
kern.log nor anywhere else (even configuring syslog with a "*.*"). Am
I forgetting something about the TRACE target?


--=20
Giacomo "mino" Bernardi
