From: Robert White <rwhite@pobox.com>
Subject: Re: Hairpin NAT - possible without packet marking?
Date: Wed, 5 Jul 2017 05:28:53 +0000
Message-ID: <950b3507-aa58-d4de-517b-392b03c2b90f@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
 <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
 <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
 <1402388a-fb32-d7af-bc3a-6f25b8a2f47a@pobox.com>
 <2a775b43-8c1d-6b48-cecf-9796b82ec753@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2a775b43-8c1d-6b48-cecf-9796b82ec753@plouf.fr.eu.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 07/04/2017 08:53 PM, Pascal Hambourg wrote:
> Le 04/07/2017 =E0 03:14, Robert White a =E9crit :
>>
>> I've honestly go no clue why you cant use --in-interface in a
>> POSTROUTING chain.
>=20
> Because the POSTROUTING chains also see packets that are generated
> locally and have no input interface.

Wouldn't that just be a mismatch then? Equivalent to a NULL (in the
database usage of the term) where all tests against a missing interface
simply fail.

In the alternate, locally generated packets would seem to come from the
loop/local interface.

I suppose the mismatch logic could be expensive though, I don't know
where this code base's relative efficiencies lie.

Of course this idea may be well-travelled and settled ground.
