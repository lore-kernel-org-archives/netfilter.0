From: Martijn Lievaart <m@rtij.nl>
Subject: Re: 2 basic iptables questions
Date: Wed, 26 Jul 2006 21:03:38 +0200
Message-ID: <44C7BC8A.6060101@rtij.nl>
References: <20060725212039.59780.qmail@web60024.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060725212039.59780.qmail@web60024.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter <petermatulis@yahoo.ca>
Cc: netfilter <netfilter@lists.netfilter.org>

Peter wrote:

>Hi,
>
>Two questions:
>
>1) I understand the basics of the iptables command but I am having
>trouble grasping how the various "scripts" go together.  I have a
>CentOS (Red Hat) box set up and there is an init script
>/etc/init.d/iptables.  There is also a support script
>/etc/sysconfig/iptables-config.  I know also that 'service iptables
>save' saves a ruleset file of the current ruleset inside
>/etc/sysconfig/iptables.  My question is therefore "Where do I place my
>main (and documented) ruleset file?".  I envision a file solely
>containing a multitude of iptables commands but many files I find on
>the net contain other commands as well.
>  
>

Either write a shell script that contains the iptables commands, or 
create an input script for iptables-restore. The last is much quicker, 
but looses you the ability to do substitutions. I combine the two, 
having a perl loader the processes my rules and the calls 
iptables-restore to load the rules.

After that just call service iptables save to make the changes 
permanent. (Shutdown also calls service iptables save, but better safe 
than sorry).


>2) I have inherited an iptables firewall and I'm trying to grok its
>ruleset.  Here are the beginning lines of the output of 'cat
>/etc/sysconfig/iptables':
>
>*filter
>:INPUT ACCEPT [0:0]
>:FORWARD ACCEPT [0:0]
>:OUTPUT ACCEPT [0:0]
>:log_and_drop - [0:0]
>:service_chain - [0:0]
>[0:0] -A INPUT -d 127.0.0.1 -j ACCEPT 
>[0:0] -A INPUT -s 127.0.0.1 -j ACCEPT 
>[0:0] -A INPUT -i lo -j ACCEPT 
>[0:0] -A INPUT -j service_chain 
>[0:0] -A log_and_drop -j LOG --log-prefix "FWSERVER (Blocked
>Connection)" 
>[0:0] -A log_and_drop -j REJECT --reject-with icmp-port-unreachable 
>[0:0] -A service_chain -p icmp -j ACCEPT 
>[0:0] -A service_chain -p icmp -j log_and_drop
>.
>.
>.
>{ many more '[0:0] -A service_chain' lines }
>COMMIT
>
>My question here is how is the last rule ever matched?  If ICMP is seen
>it will be accepted and the evaluation stops.  What is the meaning of
>this line?  My guess is that it is there to log and then block unwanted
>traffic (via the log_and_drop chain) but I do not see how it works. 
>The ruleset is full of these line patterns.
>  
>

ACCEPT is a terminal target, so the second line is nonsense.

HTH,
M4

