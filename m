From: Peter Renzland <peter@dancing.org>
Subject: Re: CONNLIMIT Questions
Date: Wed, 21 Jan 2009 12:54:52 -0500
Message-ID: <080C17B3-CF53-45FD-AC6D-C3F7C545C8A5@dancing.org>
References: <55F56AFD-736E-4FBB-9F08-B4A6A3393140@dancing.org> <slrngn97bo.dts.sitaramc@sitaramc.homelinux.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrngn97bo.dts.sitaramc@sitaramc.homelinux.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: Sitaram Chamarty <sitaramc@gmail.com>
Cc: netfilter@vger.kernel.org

[Netfilter v1.3.7, Linux 2.4.20, Tomato 1.23, Busybox v1.12.3,  
embedded in a WRT54GL router]

On 09  Jan 19, at 10:34 , Sitaram Chamarty wrote:

> On 2009-01-18, Peter Renzland <peter@dancing.org> wrote:
>> 1. Is REJECT any better than DROP?  (Will anything or anyone actually
>> get the reject message and learn anything from it?)
>
> REJECT is better than DROP in the sense that the application
> making the connection will get (and be able to pass back to
> the user, presumably) a proper error message.  A DROP looks
> like the packet didn't make it, and the program will not
> report back to the user until some timeout or retry limit
> finishes.

If (and that is the question) the reject-reason is indeed seen, then  
perhaps --reject-with icmp-admin-prohibited would be a clearer message  
to send than the default icmp-host-unreachable.

This raises some new questions, expanding the original (yet unresolved  
one) to:

1.1 will anyone or anything actually *get* and *use* the reject  
reason? (Especially PC users and their software, and especially  
BitTorrent users and BitTorrent clients.)

-- the iptables manual states that "Using icmp-admin-prohibited with  
kernels that do not support it will result in a plain DROP instead of  
REJECT".  -- 

1.2 why does a message text need kernel support?

1.3 why "drop" instead "reject with reason unavailable"?

1.4 how does an iptables user determine whether such kernel support  
exists?




>>     But that is not at all what I want to do.   I want to restrict
>> the number of greatly *divergent* connections to many, many different
>> servers.
>
>> Perhaps there is a better (effective) way to limit connection  
>> attempts
>> by LAN IP?
>> In any direction and for any protocol.
>
> You could take a look at the hashlimit and the limit
> modules; one of those should do what you want.  I have no
> used the hashlimit one so far, and the limit one only for
> incoming connections, but they seem more general than
> connlimit.

The central question that was never addressed was:

* The iptables manual page states that connlimit limits *incoming*  
*tcp* connections.  I want to limit what overwhelmingly are outgoing  
UDP connections.

Thanks,
Peter Renzland

[Netfilter v1.3.7, Linux 2.4.20, Tomato 1.23, Busybox v1.12.3,  
embedded in a WRT54GL router]


