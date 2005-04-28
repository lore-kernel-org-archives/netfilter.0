From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: no netfilter debugging?
Date: Wed, 27 Apr 2005 20:38:31 -0400
Message-ID: <200504272038.31964.Alistair@nerdnet.ca>
References: <1114627064.13697.38.camel@plasma.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114627064.13697.38.camel@plasma.starken.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On April 27, 2005 02:37 pm, Daniel Wittenberg wrote:
> I'm still trying to find out why NAT stops working after awhile, so I'm
> again going to see if anyone has a way to debug this.  I'm not asking
> for people to debug it for me, I'll do the leg-work, but how do you
> debug at the kernel-level what netfilter is doing with packets?  The
> firewall/load balancing works for awhile then suddenly stops working,
> could be 5 minutes, could be 5 hours...I am at a loss as to what causes
> it and nothing in dmesg/syslog for errors.  Just flushing the rules and
> routing tables and re-configing fixes the problem so I'm guessing there
> is some limit it is hitting, but with nothing being logged I don't know
> where to start.  I'm not sure if some of the kernel debugging tools can
> be limited to only view netfilter activity, but I think that's what I'll
> need to figure this out.

	y'know -- I've seen this thread a bit and am wondering ... 
	
1) Just an aside to think about:
	You mention load balancing here... I can't recall off the top of my head if 
its inbound LB or inbound LB, but I have to ask, do you have a pppoe link in 
there?  I have to ask, I've a cable modem and a DSL modem.  The DSL is my 
'service' port since the upstream doesn't filter ports, whereas the cable 
link does, so my DNS and mail servers use the DSL side only.  Periodically 
the DSL stream provider has fits, and does weird things to their routing 
which will result in my service side connections hanging.  This makes things 
look like they've stopped dead for a while until the DNS comes back.  You 
would be astonished at the number of processess that need 'gethostbyname' .. 
even in the windows world. 

2) 
	You want to debug? -- LOG is your first step in debugging.  Put a log rule at 
the top and the bottom of each chain.  --log-prefix is your friend here.  Add 
a cron or at process that dumps the state of /proc/net/conntrack and slabinfo
 (you might want to filter that output to be relevant) and perhaps something 
like netstat -an|grep WAIT (my favourite tool when debugging firewalls that 
are pooching out -- if yer being too aggressive on filtering you could well 
end up with sockets in all sorts of bad WAIT states.) all into 
(syslog/messages/iptables/debug) logs.... make sure you get timestamps on 
these.  Make SURE you LOG everything your dropping as well... i.e.
insert a LOG rule before each drop statement  
  You will have HUGE logfiles after a very short period of time, however once 
you get to the point where the firewall is stopping you will have a timestamp 
and a chance to munge through the cruft and find the anomaly

3) 
	Iptables components *can* have debug statements.  Some need only to have the 
DEBUG set in the source file, some need to have the DEBUG macros built. -- I 
leave this to the Developers myself, but I know that several of the optional 
modules to iptables have debug macros already.  Read the source luke.  Turn 
em on and rebuild the kernel and modules.  -- and be prepared to be spammed.

	I could go on, but the above should provide you with a solid starting ground.  
Once you *have* a hang, all those logs could come together to point to the 
problem.  There are those who can quickly review the output of the above and 
give you a solid answer.  You should sanitize the logged data by *ONLY* 
removing data that could indicate your specific host/network and 
usernames/etc ... in this case I STRONGLY reccomend that the post that you 
send at that point have the following data:

	1) kernel version/iptables version, compiler version
	2) a visual layout of the network (inbound connections firewall location, 
outbound connections and where what bits are i.e. firewall here, server a 
there etc etc...)
	3) the results of iptables -L -n -v -x --line-numbers
	                       iptables -L -n -v -x --line-numbers -t nat
	                       iptables -L -n -v -x --line-numbers -t mangle
	ip route (or route -n)
	and the logfiles as indicated above with a good period of time prior to and 
after the halt.  
	Bonus points: *cough* gzip *cough* and a host where you could post the logs 
would be a *really* good idea since you could then remove what might be 
sensitive data from the net.

	Alistair Tonner

	(just my 3 cents worth after a long day explaining what iptables is to a 
manager .....)

>
> Thanks,
> Dan

