From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: mangle tables.
Date: Tue, 10 Sep 2002 03:41:51 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPCECJCOAA.stewart.thompson@shaw.ca>
References: <3D7DC3EF.6060709@fugmann.dhs.org>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3D7DC3EF.6060709@fugmann.dhs.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Anders Fugmann <afu@fugmann.dhs.org>, Antony Stone <antony@soft-solutions.co.uk>
Cc: netfilter@lists.samba.org

HI:

	Have a look at the traversal diagram in Section 3 of
Oskar Andreasson's Tutorial. It explains it quite well. All incoming
Packets pass through the Prerouting Chain which consists of the Nat
And Mangle tables. The it will either pass through the Forward or Input
Chain depending on the rules it encounters.
		If a Packet is destined for the Firewall Machine, it will
pass through the Input Chain. The input chain has a filter table. If it is
destined for the forward chain, it will also go through the Postrouting
Chain. The forward chain has a filter table.
	All outgoing packets go through the Postrouting Chain. Which
also consists of a Nat table. It will either come from the Forward Chain,
or the Output Chain. The Output Chain has a filter table.
Whether we are talking about an Input or Output depends on the
Individual packet. For example a Packet coming in from  the Internet on
Eth0 bound for an internal machine connected to Eth1. It would pass
through the Prerouting Chain, then the Forward Chain, then trough the
post routing table for Eth1. The return path would be automatic, if your
have
your Nat rules set up properly. Automagically as they say on the list.
However,
I believe it would still have to satisfy the required rules.  Have a look at
Oscar's
description I am sure it is more clear than mine, since he has pictures as
well.
Hope that helps.

Stu..........


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Anders Fugmann
Sent: September 10, 2002 3:06 AM
To: Antony Stone
Cc: netfilter@lists.samba.org
Subject: Re: mangle tables.
HI
Hi Antony

Many thanks for your reply.
I see that I understand most of it.

Antony Stone wrote:
> On Tuesday 10 September 2002 7:49 am, Anders Fugmann wrote:
>
>>Next, if the above is correct, when does packets hit the chains,
>>e.g. what chains are traversed between PREROUTING and FORWARD and
>>POSTROUTING, in the forwarding example?
>
>
> I don't know the answer to this for the latest version of netfilter,
however
> it is very easy to find out for yourself, for the specific version you are
> running (which is usually the important thing).
Is this true - can someone please confirm this. It seems strange that
only the order of chain traversal is specified within a table, but not
across tables (If I understand you correctly, Antony).
This means, for example, that the mark cannot be used to to mark packets
for later processing. (Mark in mangle and match in filter).

>
> Simply set up a series of LOGging rules in the different chains & tables,
> send some packets through the system, and the log file will tell you what
> order the packets went through the different parts of netfilter.
>
> Try this:
>
> for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
> do
>   for table in filter mangle nat
>   do
>     iptables -I $chain -t $table -j LOG --log-prefix="$chain $table "
>   done
> done
Yes, but I was hoping to avoid it :-)

--
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.



