From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Iptabels string module
Date: Mon, 17 Mar 2003 16:24:44 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030318002444.63333.qmail@web40208.mail.yahoo.com>
References: <3E70B46C.5030506@brandid.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E70B46C.5030506@brandid.co.uk>
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
To: Steve Cherry <steve.cherry@brandid.co.uk>, netfilter@lists.netfilter.org


--- Steve Cherry <steve.cherry@brandid.co.uk> wrote:
> Hello,
> 
>         I'm new to the list & this is my first post, thanks for any help 
> in advance.
> 
> Kernel version       2.4.7 (Linux RedHat)
> Iptables version    1.2.5
> 
> I'm having some problems with the 'string module'
> 
> I managed to download Patch-o-matic and patch the kernel source with the 
> string module, compile it, boot using the fresh kernel, compile & 
> reinstall iptables with the new libiptb_striong.so library and then load 
> the ipt_string module.
> 
> However when I use the ............-m string "text string 
> here"............... in my rule set the config is accepted/loaded but 
> has no effect at all, it's as if the rule never existed.
> 
> 
> 
> Background
> 
> I have transparent web proxy setup on DMZ, when any internal web traffic 
> (Port 80) destined for the outside world hits the firewall the packet's 
> destination IP gets translated to the web proxy's IP on the DMZ which 
> inturn proxy's the request & serves the client. This all works fine, 
> however I would like some destinations to not be proxied, for example 
> 'hotmail.com'. This is where the 'string' module would come in handy, 
> below is the rule with IP's removed
> 
> -t nat -A PREROUTING -s (internal IP subnet) -i (internal firewall 
> interface) -p tcp -m tcp --dport 80 -m stat --state ESTABLISHED,NEW -m 
> string --string "hotmail.com" -j ACCEPT
> 
> this rule appears before the rule that translates the destination IP 
> address to the proxy's IP for all externally bound HTTP traffic. However 
> the rule simply has no effect, all web traffic destined to 
> http://www.hotmail.com still gets proxied?????
> 
> 
> Any ideas anyone????
> 
> 
> thanks
> 
> 
> 
> steve
> 
> 

I don't know if you typed this rule in or copy and pasted from a shell..but it
could be that if you copied from a shell your -m stat --state should be -m
state --state etc etc.


=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com

