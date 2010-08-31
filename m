From: Giacomo Bernardi <mino@minux.it>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same ip/subnet.
Date: Tue, 31 Aug 2010 16:33:08 +0100
Message-ID: <AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
 <4C7D11F5.1010105@riverviewtech.net> <AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
 <4C7D1F05.4050704@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7D1F05.4050704@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

>> Doesn't seem to work, despite I created the arp entry with:
>> =A0arp -s 10.2.0.1 00:11:22:33:44:55
>
> The bogus IP will need to be in the same subnet to work. =A0I.e. 10.0=
=2E0.11.

Doesn't work:
I'm now trying with a single interface:
- eth0: down
- eth1: 10.0.0.100
- eth2: down

There's connected a device with IP 10.0.0.1 and mac 00:11:22:33:44:55.
If I do:
arp -s 10.0.0.11 00:11:22:33:44:55

I can reach 10.0.0.1, but not 10.0.0.11.


--=20
Giacomo "mino" Bernardi
