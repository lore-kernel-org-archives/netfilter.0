From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: conntrack GRE behaves differently in 3.17 / 3.18
Date: Thu, 22 Jan 2015 21:33:26 +0100
Message-ID: <54C15E96.9060708@plouf.fr.eu.org>
References: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de> <54BF086E.5080906@ngtech.co.il> <20150121141907.Horde.Z6MfNa3HaQNYCcKYODI4iQ1@htjn.suhail.uberspace.de> <54BFB8A3.7090504@chello.at> <20150121200324.Horde.ukdDqFj6DTInNSIVwG4VzA1@htjn.suhail.uberspace.de> <54C03496.30504@plouf.fr.eu.org> <20150122085533.Horde.1veF0V8pZQJDW8PLl5XdsA9@htjn.suhail.uberspace.de> <54C0CC79.3010001@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54C0CC79.3010001@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Niggemann <jn@hz6.de>
Cc: mart.frauenlob@chello.at, netfilter@vger.kernel.org

Mart Frauenlob a =E9crit :
> On 22.01.2015 08:55, Jan Niggemann wrote:
>> Zitat von Pascal Hambourg <pascal@plouf.fr.eu.org>:
>>
>>> I do not see nf_conntrack_pptp here. It is required so that the fir=
st
>>> GRE packet has the RELATED state.
>>
>> I had forgotten about that one.
>>
>> OK, so do I get this right:
>>  From kernel 3.18 onwards I have to take care to first load the
>> extension modules and only then create the pptp vpn connection?

I just compared the conntrack states of GRE packets with a pre-3.18
kernel (3.2.x) and a 3.18.3 kernel to check the effect of the change
pointed to by Mart.

As expected, with the 3.2.x kernel :
- if neither nf_conntrack_proto_gre nor nf_conntrack_pptp are loaded,
the first GRE packet of a plain GRE tunnel (as set by ip tunnel) or a
PPTP connection is NEW ;
- if only nf_conntrack_proto_gre is loaded, the first GRE packet of a
plain GRE tunnel or a PPTP connection is NEW ;
- if both nf_conntrack_proto_gre and nf_conntrack_pptp are loaded, the
first GRE packet of a plain GRE tunnel is NEW and the first GRE packet
of a PPTP connection is RELATED ;
- in all cases, the first GRE reply packet (opposite direction to the
first GRE packet) and all subsequent packets in either direction are
ESTABLISHED.

What has changed with the 3.18.x kernel : if neither nf_conntrack_pptp
nor nf_conntrack_proto_gre are loaded, any GRE packet is INVALID.

When nf_conntrack_proto_gre or nf_conntrack_pptp are loaded, there is n=
o
difference with 3.2.x.

The bottom line is : if you use PPTP and conntrack with any kernel
version, load nf_conntrack_pptp (it will load nf_conntrack_proto_gre
automatically) and accept GRE packets in the ESTABLISHED,RELATED states=
=2E

>> Is there some kind of mechanism to automatically load the extension
>> modules before initiating the connection and unloading them after th=
e
>> connection has finished?

None that I know of.

> the way I understand the change is:
> you need to add an according iptables rule for the first state NEW=20
> packet, which will then load the according conntrack helper=20
> automatically. So further packets are classified as ESTABLISHED or RE=
LATED.

Huh ?
The NEW state is not needed if the required modules are loaded. Also, I
don't think that a packet can trigger a module to be loaded.
