From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Rate my rules. Take a look ICMP only
Date: Fri, 7 Feb 2003 19:17:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030208031705.6754.qmail@web40202.mail.yahoo.com>
References: <200302071825.49278.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302071825.49278.netfilter@newkirk.us>
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


--- Joel Newkirk <netfilter@newkirk.us> wrote:
> On Friday 07 February 2003 06:11 pm, SBlaze wrote:
> > Recently I created what I think are some pretty decent ICMP rules to
> > allow me to trace and ping outside of my network but not allow the
> > same kind of activities in...I think I did a pretty good job after
> > reading the tutorial
> >
> > You guys be the judge and let me know if there was better way for this
> > to be done.
> >
> > iptables -A INPUT -p ICMP -i eth0 -m state --state NEW  -j DROP
> > iptables -A INPUT -p ICMP -i eth0 -m state --state ESTABLISHED,RELATED
> > -j ACCEPT
> > iptables -A OUTPUT -p ICMP -o eth0 -m state --state
> > NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> If you have DROP policy for INPUT you don't need the first rule, and the 
> third should work just as well without any state matching at all. (The 
> only additional state allowed through that ways is 'INVALID' which you 
> should explicitly DROP if you are concerned about it)  
> 
> Regardless, you seem to have grasped how the state matches work, and how 
> to use them to allow only desired connections.  These rules WILL impose 
> the limitations you desire, so that rates as a success.
> 
> j
> 

I thought of creating a rule that will drop invalid requests.... but I somewhat
worry about the "logability" of a single rule that would handle so much. If
something is invalid I would like to somewhat isolate as much information about
it as possible.

These rules do that for me...

# NMAP and Incoming connection Killer(SYN/RST)
# NMAP Xmas Tree scan Killer ( God bless Google )
# NMAP Null scan killer (got from a IPTABLES tutorial..confirmed via the web)
# NMAP Stealth FIN scan killer (this one was a hard one to figure out)

iptables -A INPUT -p tcp --syn -m state --state NEW -i eth0 -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -i eth0 -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -i eth0 -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -i eth0  -j DROP

The SYN/RST also stops all incoming connecctions that are not already related
or  established.

I also have limited logs for these rules. If say I just set up an ALL protocol
INVALID drop line.... could I just comment out the above rules and have the
INVALID drop the scans... and the others still log? Is there anything that
slips through the INVALID targets these might catch? I guess I worry about can
one line stop ALL the baddies coming in so to speak.. especially since i have
grown to trust the above rules.

Thanks to all out there reading and posting up




=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

