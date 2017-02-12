From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Match packet address against addresses on interface
Date: Sun, 12 Feb 2017 14:15:49 +0100
Message-ID: <e5f7689a-6c5f-1f28-5680-4fcca061b3f9@plouf.fr.eu.org>
References: <20170211171321.GC31183@weiser.dinsnail.net>
 <568f0d90-e6e6-f1ac-4d9b-27b3b21438da@plouf.fr.eu.org>
 <20170212124332.GE2935@weiser.dinsnail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170212124332.GE2935@weiser.dinsnail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Michael Weiser <michael@weiser.dinsnail.net>
Cc: netfilter@vger.kernel.org

Le 12/02/2017 =E0 13:43, Michael Weiser a =E9crit :
> Hi Pascal,
>
> On Sun, Feb 12, 2017 at 09:59:14AM +0100, Pascal Hambourg wrote:
>
>>> is there an elegant way in either ip{,6}tables or nftables to match
>>> addresses in packets against all the addresses set on a specific local
>>> interface?
>>
>> For the interface the packet is coming in or going out, maybe with the
>> iptables 'addrtype' match.
>
> A first test with a rule like
>
> iptables -I OUTPUT 1 -p tcp --dport 22 -m addrtype --src-type LOCAL -j AC=
CEPT
>
> looks very promising: Allowing out only packets with source addresses
> actually assigned to a local interface (tested with hping3 -u -p 22 -a
> 7.7.7.7 192.168.2.1).

I thought you wanted to match only against local addresses attached to a=20
specific interface, not all interfaces. If that specific interface is=20
the output interface, then you can add --limit-iface-out.

Otherwise, may I ask why do you need this ?
Only a process with special privileges can send packets with a non local=20
address.

> The thing for dummies like me to note about this is that addrtype
> doesn't deal with predefined classes of addresses but the actual state
> of things on the interfaces present in the system. Consequently LOCAL
> doesn't mean RFC1918 addresses or somesuch but addresses actually
> assigned to local interfaces.

local !=3D private

There is no need for a specific extension to match any given address=20
prefix such as those defined in RFC1918 : -d/-s already do the job.
