From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 13:09:12 +0200
Message-ID: <1240225752.27336.25.camel@enterprise.ims-firmen.de>
References: <op.uskfabufx1lyi3@localhost>
	 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
	 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
	 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de>  <op.usn740lix1lyi3@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.usn740lix1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sun, 2009-04-19 at 23:56 -0600, Lloyd Standish wrote:

> I'm sorry, I don't understand.   According to what you are saying, I should not get any load balancing, 
> since all my testing up until now has been with connections (to the Internet) originating on the router box.  
> (I haven't even tried connecting from the LAN.)
>
> However, the packets originating on the router box *are* showing up in the conntrack table with the fwmark, 
> put there by my prerouting rules.  Is there a reason why they should not be pushed out the interface specified by the rt_link1/2 tables? 
>  (As far as I can tell, my user-defined routing tables are ignored, and the default route in the "main" table is always used.)

Take a look at the packet traversal graph, outgoing packets from local
processes do not pass thru PREROUTING, but incoming packets do, that's
where your markings come from. But in your case, I'm sure you want to
select a link when the outgoing connection is first established and then
stay with that link. Selecting a different link with the second packet
doesn't work with NATed connections, right?

So you if you want to load balance local packets correctly as well,
you need to put some rules into OUTPUT. Possibly that's really your
basic problem here, but I don't have time to think about that at the
moment.

> I was trying to masquerade any LAN-connected machine so it could connect to the Internet through the router box, 
> but I mistakenly specified "-o eth0" instead of Internet connected interface.

OK

> The lines:
> iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
> iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
> should do the masquerading I suppose, although the idea was not that, but rather to fix the source address of 
> outgoing packets to coincide with the IP of the interface (ppp0 or ppp1).

You definitely need the masquerading, else your local LAN IPs will show
up at your providers door, and they won't know what do with them. 

> That's good advice, although I can't use kernel 2.6.27 I'm afraid.  
> At some point after 2.6.21 the code for a USB serial driver changed.  
> I have to patch that driver to make my USB-connected GPRS (ppp over GSM cell phone) modem work.  

Figured something like ;)

> (I already hacked the patch once, after the driver code changed between kernel 2.4 and 2.6, and I don't want to have to do it again.)  
> GPRS is my only Internet option in my remote area of Costa Rica.

Nice one. The address in your whois record is kinda cool as well ...

> My idea was to download the 2.6.18.8 kernel and use it with iptables v1.3.6, which as you pointed out previously ought to have the functionality I need. 
>  (It is a drag to be tied to an old kernel version due to hardware dependency.)

I don't really believe that 2.6.20.3 misses something basic like that,
which is nevertheless contained in an older kernel. Unless maybe the
patched Debian kernel has it (Debian's 2.6.18 contains lots of
extra security and bug patches from later kernels). And the iptables
user space is most likely irrelevant anyway, if you can get the rules
you want to load already.

