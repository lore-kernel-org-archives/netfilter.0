From: Marek Zachara <marek.zachara@conexe.pl>
Subject: UDP SNAT problems (SOLVED by workaround)
Date: Sat, 8 Oct 2005 16:32:54 +0200
Message-ID: <200510081632.54427.marek.zachara@conexe.pl>
References: <20051007220642.4C94B3C65565@mailgate.informatik.haw-hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051007220642.4C94B3C65565@mailgate.informatik.haw-hamburg.de>
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

On Saturday 08 of October 2005 00:06, you wrote:
> > On Friday 07 of October 2005 21:44, Marek Zachara wrote:
> >
> > As a workaround, is there a way to manually clean up conntrack table -
> > i'd put it in the boot scripts to assure such problems doesn't happen
> > again. I know i can put a iptable rule to block all incoming UDP traffic
> > for 3 minutes after boot-up (so the entries get cleaned), but this makes
> > the router useless for these 3 minutes ...
>
> Do i understand this correctly, the problem why the packets don't get
> masqueraded/natted properly is that they already have a conntrack entry
> before the nat rules are in place ??
>
Yes, it seems to be the cause. Actually, even blocking packets UDP for 5 
minutes at mangle/PREROUTING doesn't help as they are still somehow 
'sustained' in the conntrack anyway.
If you are booting from local HD, the easiest solution will be not to bring up 
any interface before the iptables rules are configured. Since this was not an 
option for me (as i have to keep eth0 up) i had found the 'conntrack' 
userspace tool and added this at the end of the script setting up iptables:
conntrack -F
and voila! it works now :)
unfortunatelly i havn't been able to compile the conntrack tool against 
anything but the latest 2.6.14-rc3 kernel (couldn't find out correct 
kernel/pom/libnfnetlink/conntrack version set) so i have to live with the 
bleeding-edge for the time being.

still, i get some not-nated packets (udp, p2p) which somehow manage to bypass 
all rules and arrive at external interface with local net source ip - but 
there are just a few of them per minute so i guess i can live with that...

Marek



