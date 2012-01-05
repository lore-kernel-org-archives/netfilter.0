From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 14:17:36 +0100
Message-ID: <1325769456.2910.42.camel@ns014530.dcyb.net>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
	 <1325753945.2910.11.camel@ns014530.dcyb.net>
	 <CAKywjPpBW-KMfS72n_fpLk10gTvZm=iDV5PjGJgPvja6sQN6NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPpBW-KMfS72n_fpLk10gTvZm=iDV5PjGJgPvja6sQN6NQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

On Thu, 2012-01-05 at 12:59 +0100, Anton Melser wrote:
> > So, I think I understand that you want to SNAT a complete private subnet
> > to a corresponding public subnet. Is the NETMAP target usable for you,
> > or am I misunderstanding you completely?
> > Something like:
> >
> > iptables -t nat -A POSTROUTING -s ${private_subnet} -j NETMAP --to
> > ${public_subnet}
> 
> Thanks for the suggestion. It appears that NETMAP does 1:1 and both
> SNAT and DNAT. I need to do many:1 lots of times (so (many:1)*n), and
> I don't need (or want actually) DNAT. Is it possible to use NETMAP to
> do this?

According to this article, NETMAP does SNAT when used in POSTROUTING and
DNAT in PREROUTING, which sounds logical to me.
https://capcorne.wordpress.com/2009/03/24/natting-a-network-range-with-netmapiptables/

If you want to do many:1 NAT then that's SNAT, and when reading your
original email again that seems to be what you want (on a large scale).

>> So, I have around 1600 public IPs in 4 blocks (3 x /23 + /25 on
>> different ISPs).

>> So say for each external IP I would have a /24,
>> giving me up to 250-odd potential internal machines

So, each public IP services a /24 subnet and you have 1600 public IP's.
That would be a lot of rules to create because for each public IP you'd
need an SNAT rule, each matching a private subnet. Sorry, I don't know
of an easier solution for what you want.


--
Rob


