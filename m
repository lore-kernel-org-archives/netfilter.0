From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: -m string
Date: Fri, 8 Aug 2003 10:03:36 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030808170336.48448.qmail@web40210.mail.yahoo.com>
References: <3F330577.6020202@belfordhk.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F330577.6020202@belfordhk.com>
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
To: Edmund <cc@belfordhk.com>, Netfilter <netfilter@lists.netfilter.org>

Hello Edmund,

   It is a very bad idea to use iptables to DROP packets in this manner. I too
experiemented with exactly what others tried to do with the INPUT line. Trust
me when I tell you it's a bad idea. It can and eventually will cause a kernel
panic. I even tried "nicely" to reset the packet instead of dropping it. No
good I still suffered a kernel panic after some time. However with that being
said...

The error you are getting about no Target... I'm not a guru here so I may be
wrong... BUT You don't generally FORWARD packets to a JUMP... you have to have
a target.... a destination... usually a PHYSICAL IP. This could very well be
the source of your error.

Also to tell if your patch is applied... if the patch was not applied correctly
you would never be able to select the STRING MATCHING and I believe also the
UNCLEAN MATH from a menuconfig or an xconfig.. or whatever be your flavor of
kern. config. tool. In an odd or extreme case the kernel fails to compile or
what not..then of course you would also know it might not have made it in...
but then you wouldn't have a working system running on that kernel then.

With all of that being said you have given me an interesting idea on a
possibility of using IPTABLES for the kind of filtration both of us would like.
I run Debian and as such have a connection that listens on port 9 for TCP/UDP.
It's a discard service.. basically anything sent to that port is simply
discarded. Rather than fowarding it to a jump (which doesn't seem to work)
forward it to 127.0.0.1:9 where in theory at least it will be saftely moved out
of the kernel's ip stack and forgotton by the discard service.

I've got to test this! heh Good luck Hope I helped out

SBlaze

  


--- Edmund <cc@belfordhk.com> wrote:
> Hi,
> 
> George Viera recently mentioned about using
> -m string to filter 'bad' packets.
> 
> Is there supposed to be a pre-requisite to
> the following command?
> 
> iptables -A INPUT -m string --string 'cmd.exe' -j DROP
> 
> (actually, I'm attempting this:)
> 
> iptables -A FORWARD -m string --string 'cmd.exe' -j DROP
> 
> I get a "iptables: No Chain/target/match by that name"
> error.  I sense that it's complaining about '-m string'.
> I applied the string.patch and recompiled the kernel
> already.  (btw, I'm using Slackware w/ 2.4.21 kernel).
> 
> Btw, how do I tell if the kernel contains the said
> patch?
> 
> Any help appreciated
> 
> 
> 
> 
> 
> I realize this will slow the system down a bit,
> but at this point I'm just testing out the option.
> 
> 
> 
> 


=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

