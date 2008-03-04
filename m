From: Christian Lerrahn <lists@penpal4u.net>
Subject: Re: New connlimit: how to use?
Date: Tue, 4 Mar 2008 13:52:01 +1100
Message-ID: <20080304135201.7df21ed1@penpal4u.net>
References: <20071207105645.586a0f23@penpal4u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071207105645.586a0f23@penpal4u.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I know that my original post (included in full above) is about 3 months
old. However, the problem remains unresolved. See below quoted bit for
some new information.

> I've seen that this question has been asked before but without reply.
> I'll therefore make another attempt to rephrase it.
> 
> I need connlimit on one of my boxes. For that I first tried kernel
> 2.6.22 with patch-o-matic which failed. The kernel dropped everything
> on a given port as soon as any rule was set for that port.
> 
> So, I decided to go to 2.6.23 and was delighted to see that connlimit
> is now included in the vanilla kernel. However, I realised that the
> structure is not the same as the patch produced. So I assumed that you
> would need the latest version of iptables. I therefore got iptables
> 1.4.0rc1 and compiled it. Generally speaking iptables works fine now.
> However, if I try to set a rule using connlimit, I get an error
> 
> "iptables: Invalid argument"
> 
> If I run e.g.
> 
> iptables -vv -A INPUT -p tcp --dport 80 -m connlimit
> --connlimit-above 32 -j DROP
> 
> I see the output
> 
> DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:80
> #conn/32 > 32 libiptc v1.4.0rc1. 620 bytes.
> Table `filter'
> Hooks: pre/in/fwd/out/post = 0/0/148/296/0
> Underflows: pre/in/fwd/out/post = 0/0/148/296/0
> Entry 0 (0):
> SRC IP: 0.0.0.0/0.0.0.0
> DST IP: 0.0.0.0/0.0.0.0
> Interface: `'/................to `'/................
> Protocol: 0
> Flags: 00
> Invflags: 00
> Counters: 4598391 packets, 695123203 bytes
> Cache: 00000000
> Target name: `' [36]
> verdict=NF_ACCEPT
> 
> Entry 1 (148):
> SRC IP: 0.0.0.0/0.0.0.0
> DST IP: 0.0.0.0/0.0.0.0
> Interface: `'/................to `'/................
> Protocol: 0
> Flags: 00
> Invflags: 00
> Counters: 0 packets, 0 bytes
> Cache: 00000000
> Target name: `' [36]
> verdict=NF_ACCEPT
> 
> Entry 2 (296):
> SRC IP: 0.0.0.0/0.0.0.0
> DST IP: 0.0.0.0/0.0.0.0
> Interface: `'/................to `'/................
> Protocol: 0
> Flags: 00
> Invflags: 00
> Counters: 5476812 packets, 2506858579 bytes
> Cache: 00000000
> Target name: `' [36]
> verdict=NF_ACCEPT
> 
> Entry 3 (444):
> SRC IP: 0.0.0.0/0.0.0.0
> DST IP: 0.0.0.0/0.0.0.0
> Interface: `'/................to `'/................
> Protocol: 0
> Flags: 00
> Invflags: 00
> Counters: 0 packets, 0 bytes
> Cache: 00000000
> Target name: `ERROR' [64]
> error=`ERROR'
> 
> iptables: Invalid argument
> 
> Now, being a total n00b (at least when it comes to these things),
> that doesn't tell me anything. :(

One thing that I have found out in the meantime, however, is that I do
see something in my kernel logs which is

cannot load conntrack support for address family 2

and does help me just as much as the errors above because conntrack
seems to be in the kernel. I could only find an entry at Experts
Exchange about that but I don't have an account there and other than
that I couldn't find anything.

Does anybody know, what could cause the above error message?

Cheers,
Christian
