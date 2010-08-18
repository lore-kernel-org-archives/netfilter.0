From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 00:59:25 +0200
Message-ID: <4C6C65CD.6090707@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C55C8.5000905@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
> On 08/17/10 17:44, Jonathan Tripathy wrote:
>> When using a single Linux host with lots of bridges, would there eve=
r be=20
>> a time, even for a few seconds, where traffic would "jump" bridges?
>=20
> No.  Such should not be possible.

It depends what "traffic" means. Ethernet frames, no. IP packets, yes i=
f
the box also acts as an IP router between the bridges.
