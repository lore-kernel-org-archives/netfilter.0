From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: SYNPROXY *NAT/redirects etc.
Date: Wed, 24 Jun 2015 23:57:30 +0200
Message-ID: <558B27CA.20707@plouf.fr.eu.org>
References: <e662686ca44f5edf617a50d78fa4444d@qasl.de> <5589D08C.1000601@plouf.fr.eu.org> <8abd0f5b62a44563cb0de95f9a39ee6c@qasl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8abd0f5b62a44563cb0de95f9a39ee6c@qasl.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christian Ruppert <idl0r@qasl.de>
Cc: netfilter@vger.kernel.org

Christian Ruppert a =E9crit :
>=20
> On 2015-06-23 23:33, Pascal Hambourg wrote:
>> Christian Ruppert a =E9crit :
>>>
>>> iptables -t raw -I PREROUTING -p tcp -m tcp --syn -j CT --notrack
>>
>> This rule disables connection tracking which is required for statefu=
l
>> NAT operation.
>=20
> Thanks! From what I've seen/read, this rule is required or am I wrong=
?=20

AFAIK it's not strictly required for SYNPROXY operation. It just saves
connection tracking resources.
