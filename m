From: Les Mikesell <les@futuresource.com>
Subject: Re: the impossible "iptables -C" option
Date: Sun, 25 Jul 2004 12:50:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090777811.31169.40.camel@les-home.futuresource.com>
References: <01be01c4710c$440a79e0$5100a8c0@egp>
	 <1090664200.2012.21.camel@grendel>
	 <1090694781.17721.43.camel@les-home.futuresource.com>
	 <200407242113.48128.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407242113.48128.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-07-24 at 15:13, Antony Stone wrote:
> On Saturday 24 July 2004 7:46 pm, Les Mikesell wrote:
> 
> > I have a situation where I can see strange results with tcpdump and would
> > like to know what combination of rules is causing it.
> 
> I suggest you take some of the features you can see from the tcpdump output 
> and create some logging rules to find out how far through your ruleset the 
> packets are getting.

The problem is that in this case the rules are built by a perl
script that writes a shell script that lives in /etc/rc.d/init.d
and both contain variables and conditionals interpreted at
runtime.  The point of using this particular system is that
you normally don't have to understand how it all works because
the configuration is all scripted.  So it isn't 'my' rules
I want to see - I just want to know which of the existing
rules I have to work around.

I suppose I can build another one on an isolated network
where I can send only the packet types that are going wrong
and look at the counters on the rules, but it would be a
lot easier if iptables took a command that would simulate
a packet and at every point the counters on a rule would
increment it would log or display the match instead.

I think there might be a hint about what is happening in
/proc/net/ip_conntrack:
unknown  47 598 src=192.168.254.3 dst=192.168.254.1 [UNREPLIED]
src=192.168.254.1 dst=167.90.78.10 use=1

What is supposed to happen is that the cisco on eth1 sends
GRE packets from 192.168.254.3 (a loopback interface) to
192.168.254.1 (a loopback on the remote router) and these
are sent through the CIPE vpn interface by a static route.
Howver, it looks like it has somehow associated with the
address of eth0 (the 167.90.78.10 address).  Could this
make it source-nat subsequent packets incorrectly as they
go through the CIPE interface?

---
  Les Mikesell
   les@futuresource.com



