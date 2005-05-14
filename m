From: Jason Opperisano <opie@817west.com>
Subject: Re: Natting IPs hanging
Date: Sat, 14 May 2005 11:26:13 -0400
Message-ID: <20050514152613.GA24427@bender.817west.com>
References: <4285084F.1020500@tlcdelivers.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4285084F.1020500@tlcdelivers.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 13, 2005 at 01:04:31PM -0700, Brian Atkins wrote:
> Greetings:
> 
> I'm in the process of building my first dedicated firewall using 
> iptables/netfilter (v 1.2.11) on Gentoo Linux (2.6.11 kernel).  I want 
> to enable the natting of IPs, but I am having trouble getting the rules 
> to take.  Essentially, I would like to take a specific group of IPs 
> (servers) and nat them specifically to an internal ip address.  The 
> remainder of the internal IPs (workstations - dhcp) should be natted 
> outbound within a range of IPs.
> 
> Based on the docs on Netfilter.org and the man pages, I decided to start 
> off with the following:
> 
> iptables -t nat -A PREROUTING -i eth0 -d 141.xxx.xxx.xxx -j DNAT 
> --to-destination 10.xxx.xxx.xxx
> 
> But, when I try to run the command, it just hangs. After a while, I can 
> break out of it with CTL-C.
> 
> What gives?  Am I missing something?

the syntax of that rule looks fine to me.  i'm going to go out on a limb
and say there is something rotten in your kernel config.

out of curiosity, how did you compile the kernel for this machine, by
hand, or by using genkernel?

also, what does:

  $ cat /proc/net/ip_tables_names
and
  $ cat /proc/net/ip_tables_targets

have to say?

-j

--
"Tom Tucker: Now let's go to Greg The Weather Mime. OK... it's going
 to be cold...lots of wind... and it looks like parents are going to
 throw human fecal matter from the rooftops onto their children... oh,
 GOD. That's awful. No wait, it looks like rain. Yes, rain."
        --Family Guy

