From: Alok Shukla <alokshukla@yahoo.com>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Fri, 20 Sep 2002 05:43:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920124303.17644.qmail@web40209.mail.yahoo.com>
References: <20020919193311.UPJU287.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020919193311.UPJU287.mta02-svc.ntlworld.com@there>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>

HI,

THANKS A LOT..!

I have understood a lot of things. Now just for the
sake..tell me if the following are valid

iptables -t nat -A POSTROUTING -s 192.168.0.10/27 -d
any/0 -J MASQUERADE 

for allowing all the machines starting from 11 to 41

and in the similar way...

if the above is a correct way then it might be a
shortcut but it is still better to design properely
rather than to take shortcuts...

Thanks in Advance

Alok Shukla


--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Thursday 19 September 2002 7:00 pm, Alok Shukla
> wrote:
> 
> > Let me say if i am able to sort out the lab in the
> > accordance that i start my ip settings of lab2
> >  like 192.168.9.1-63 for lab 1
> >
> > and next 64 for lab 2 , would that help and how ?
> 
> I think it would help a lot, yes.   I would
> recommend putting machines into 
> three groups:
> 1. User machines in Lab1
> 2. User machines in Lab2
> 3. System machines such as servers, routers, etc.
> 
> Separate the IP addresses for each of these three
> groups so that you can 
> specify a single group with an easy netmask.
> 
> I'll explain this slowly - apologies if some is too
> obvious...
> 
> 192.168.0.0/24 specifies 256 addresses, ranging from
> 192.168.0.0 to 
> 192.168.0.255
> 
> 192.168.0.0/25 specifies 128 addresses, ranging from
> 192.168.0.0 to 
> 192.168.0.127.
> 
> Similarly 192.168.0.128/25 specifies the other 128
> addresses from the 
> original range of 256: 192.168.0.128 to
> 192.168.0.255
> 
> Every time you increase the netmask value by one,
> you are talking about half 
> the number of machines (because you are specifying
> one more bit for the 
> network address and one less bit for the host
> address).
> 
> Therefore you can specify groups of the following
> numbers of addresses:
> 
> /24 = 256
> /25 = 128
> /26 = 64
> /27 = 32
> /28 = 16
> /29 = 8
> /30 = 4
> /31 = 2
> /32 = 1
> 
> Hence it is common for ISPs to provide you with a
> network range such as 
> 213.121.241.128/27, which means you have 32
> addresses.   In the older dotted 
> quad netmask notation this would be specified as a
> netmask of 255.255.255.224
> 
> Suppose you rearranged the addresses on your
> network, so that all the Lab1 
> machines had addresses between 192.168.0.0 and
> 192.168.0.63, all the Lab2 
> machines had addresses between 192.168.0.64 and
> 192.168.0.127, and all the 
> routers, servers etc which are not really part of
> either Lab had addresses 
> above 192.168.0.128.
> 
> Then you could refer in a netfilter rule to a source
> address coming from any 
> machine in Lab1 by the notation "-s 192.168.0.0/26".
> 
> Similarly you could refer to a source address of any
> machine in Lab2 with the 
> notation "-s 192.168.0.64/26", and if you wanted a
> rule to apply to the other 
> machines (routers & servers etc) you could specify
> "-s 192.168.0.128/26" if 
> there were less than 64 of them (or
> "-s192.168.0.128/27" if there were more 
> than 64... unlikely...)
> 
> This is the reason I think you would benefit from
> assigning the machines to 
> different address ranges, one smaller subnet per
> category of machines.
> 
> > But i would request you to explain in detail as
> you said
> 
> Okay - here are the rules I suggested earlier, with
> comments to show why they 
> match your current address ranges.
> 
> > > # add rules to match machines *not* in LAB1 and


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com

