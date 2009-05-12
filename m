From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to use mark and connmark in one rule
Date: Tue, 12 May 2009 15:13:51 +0200
Message-ID: <4A09760F.1070507@plouf.fr.eu.org>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C0B4.8010809@standarduniversal.com.au> <49F1C120.8090802@standarduniversal.com.au> <20090512130028.GA19645@tkeitel002.bln.innominate.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090512130028.GA19645@tkeitel002.bln.innominate.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Tino Keitel a =E9crit :
> On Fri, Apr 24, 2009 at 23:39:44 +1000, Brian Austin - Standard Unive=
rsal wrote:
>>
>> iptables -A INPUT -m mark --mark 1
>> iptables -A INPUT -m connmark --mark 2
>=20
> I want to match packets with both a specific nfmark _and_ a specific
> connmark, so I need both matches in one rule.

Not necessarily. For example with user-defined chains :

iptables -A INPUT -m mark --mark 1 -j mark1
iptables -A mark1 -m connmark --mark 2
