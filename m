From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Thu, 19 Sep 2002 20:33:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020919193311.UPJU287.mta02-svc.ntlworld.com@there>
References: <20020919180021.80821.qmail@web40206.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020919180021.80821.qmail@web40206.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Thursday 19 September 2002 7:00 pm, Alok Shukla wrote:

> Let me say if i am able to sort out the lab in the
> accordance that i start my ip settings of lab2
>  like 192.168.9.1-63 for lab 1
>
> and next 64 for lab 2 , would that help and how ?

I think it would help a lot, yes.   I would recommend putting machines into 
three groups:
1. User machines in Lab1
2. User machines in Lab2
3. System machines such as servers, routers, etc.

Separate the IP addresses for each of these three groups so that you can 
specify a single group with an easy netmask.

I'll explain this slowly - apologies if some is too obvious...

192.168.0.0/24 specifies 256 addresses, ranging from 192.168.0.0 to 
192.168.0.255

192.168.0.0/25 specifies 128 addresses, ranging from 192.168.0.0 to 
192.168.0.127.

Similarly 192.168.0.128/25 specifies the other 128 addresses from the 
original range of 256: 192.168.0.128 to 192.168.0.255

Every time you increase the netmask value by one, you are talking about half 
the number of machines (because you are specifying one more bit for the 
network address and one less bit for the host address).

Therefore you can specify groups of the following numbers of addresses:

/24 = 256
/25 = 128
/26 = 64
/27 = 32
/28 = 16
/29 = 8
/30 = 4
/31 = 2
/32 = 1

Hence it is common for ISPs to provide you with a network range such as 
213.121.241.128/27, which means you have 32 addresses.   In the older dotted 
quad netmask notation this would be specified as a netmask of 255.255.255.224

Suppose you rearranged the addresses on your network, so that all the Lab1 
machines had addresses between 192.168.0.0 and 192.168.0.63, all the Lab2 
machines had addresses between 192.168.0.64 and 192.168.0.127, and all the 
routers, servers etc which are not really part of either Lab had addresses 
above 192.168.0.128.

Then you could refer in a netfilter rule to a source address coming from any 
machine in Lab1 by the notation "-s 192.168.0.0/26".

Similarly you could refer to a source address of any machine in Lab2 with the 
notation "-s 192.168.0.64/26", and if you wanted a rule to apply to the other 
machines (routers & servers etc) you could specify "-s 192.168.0.128/26" if 
there were less than 64 of them (or "-s192.168.0.128/27" if there were more 
than 64... unlikely...)

This is the reason I think you would benefit from assigning the machines to 
different address ranges, one smaller subnet per category of machines.

> But i would request you to explain in detail as you said

Okay - here are the rules I suggested earlier, with comments to show why they 
match your current address ranges.

> > # add rules to match machines *not* in LAB1 and
> > return immediately
> > iptables -A LAB1 -s 192.168.0.64/26 -j RETURN

/26 means a group of 64 addresses (see the list above) therefore this rule 
matches the 64 addresses from 192.168.0.64 to 192.168.0.127 and exits the 
chain immediately (returns to the calling chain) if it matches.

> > iptables -A LAB1 -s 192.168.0.56/29 -j RETURN

/29 means a group of 8 addresses, so this rule matches the 8 addresses from 
192.168.0.56 to 192.168.0.63.

When combined with the first rule, we've now matched all machines from 
192.168.0.56 to 192.168.0.127 and exited this chain if the address matches.

> > iptables -A LAB1 -s 192.168.0.52/30 -j RETURN

/30 means a group of 4 addresses, so this rule matches the 4 addresses from 
192.168.0.52 to 192.168.0.55

> > iptables -A LAB1 -s 192.168.0.50/31 -j RETURN

/31 means a group of 2 addresses, so this rule matches the 2 addresses 
192.168.0.50 and 192.168.0.51.

Putting all these four rules together means we have matched any address from 
192.168.0.50 to 192.168.0.127 inclusive, and exited the chain if the source 
address falls into this range.   Only a source address outside that range (ie 
192.168.0.0 to 192.168.0.49, or 192.168.0.128 to 192.168.0.255, and you don't 
have any of the latter range) will continue to get processed by this chain.

> > # now any further rules we put in chain LAB1 will
> > only apply to those machines

And similarly for Lab2:

> > # create user-defined LAB2 chain
> > iptables -N LAB2
> > # add some rules to eliminate non-LAB2 machines
> > iptables -A LAB2 -s 192.168.0.0/27 -j RETURN

/27 matches 32 addresses, here from 192.168.0.0 to 192.168.0.31

> > iptables -A LAB2 -s 192.168.0.32/28 -j RETURN

/28 matches 16 addresses, here from 192.168.0.32 to 192.168.0.47

> > iptables -A LAB2 -s 192.168.0.48/31 -j RETURN

/31 matches two addresses, here from 192.168.0.48 to 192.168.0.49

Hence this combination of three rules will exit for any machine in the range 
192.168.0.0 to 192.168.0.49, further processing in this chain will only 
happen if the source address is 192.168.0.50 or above.

I hope this explains how my two user-defined chains would allow you to create 
rules which would apply only to source addresses from Lab1 or Lab2 ?

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

