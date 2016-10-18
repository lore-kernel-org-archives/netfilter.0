From: Thomas Bach <t.bach@ilexius.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Tue, 18 Oct 2016 11:39:38 +0200
Message-ID: <87k2d6ro6d.fsf@ilexius.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ilexius.de; s=mail;
        t=1476783579; bh=r65wrx/+1rPCroaxld/uXY+KI14mYrKFMRMZqSQexHA=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=NTjUaQyc1LJMBwZJvSzHYydTBDXBbxYWKY0CaHovzeZ3qSzofGb65fueOnUC3NSUx
         14ECnQdujA/r94lQCYrD03Z5NPy9i3S2t4zgYISKqdq9Et4EsbI/68yebbEHdzSbsk
         qk+45VzabrF8AQOt9hp9f+/dkYhx8i4FBAtB+XPQ=
In-Reply-To: <20161017194405.GH24375@salvia> (Pablo Neira Ayuso's message of
        "Mon, 17 Oct 2016 21:44:05 +0200")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi there,

Pablo Neira Ayuso <pablo@netfilter.org> writes:

> On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach wrote:
>> Hi,
>>=20
>> I have two hosts with public ip addresses running Ubuntu 16.04 with
>> Kernel version 4.4.0.
>>=20
>> I want to interconnect two containers (systemd-nspawn) with veth
>> interfaces running on these hosts in a server client setup.
>>
>> [=E2=80=A6]
>>=20
>> This works as expected and without any problems at all. Now IPSec
>> enters the picture. As soon as I setup a policy to encrypt everyting
>> between the two hosts the following happens:
>> + I can still connect from the second host to the server in the
>>   container without problems,
>> + I can still /connect/ (i.e. establish a connection) from the
>>   container on the second host to the server on the first host, but
>> + in tcpdump listening on the interface of the container (on the
>>   second host) I see lots of TCP Retransmissions and the TCP connection
>>   is effectively broken.
>>=20
>> Can someone give me a hint what is going on here?
>
> Did you find the root cause for this problem?

Actually not. I worked around the issue by switching from the
"ipsec-tools" package (i.e. static rules and keying done by hand) to
strongswan. Now the whole setup works as intended with the rules being
more or less the ones cited in my original post.

It would be nice to know what the differences are on the package level
between strongswan configured ipsec and the ones configured via
ipsec-tools.

Regards

        Thomas.
--=20
ilexius GmbH
Thomas Bach
Unter den Eichen 5
Haus i
65195 Wiesbaden
Fon: +49-(0)611 - 180 33 49
Fax: +49-(0)611 - 236 80 84 29
----------------------------------------
ilexius GmbH
vertreten durch die Gesch=C3=A4ftsleitung:
Thomas Schl=C3=BCter und Sebastian Koch
Registergericht: Wiesbaden
Handelsregister: HRB 21723
Steuernummer: 040 236 22640
Ust-IdNr.: DE240822836
----------------------------------------
