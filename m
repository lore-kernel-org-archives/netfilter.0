From: Marco Colombo <netfilter@esiway.net>
Subject: Re: how to automate ip_forward
Date: Thu, 8 Jul 2004 14:54:10 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407081443070.3962-100000@Megathlon.ESI>
References: <16ac01c464e3$1af42c20$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16ac01c464e3$1af42c20$49caa8c0@caris.priv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 8 Jul 2004, Peter Marshall wrote:

> Hey guys, I know this sounds stupid, but I can not seem to get the value of
> /proc/sys/net/ipv4/ip_forward to be 1 after boot.  I tried putting the echo
> 1 > /pro...../ip_forward in my iptables script .... (BTW, I have a bash
> script with my rules in it and a startup script in rc2.d that calls it)
> 
> I also tried making a separate starup script just for the ip_forward and set
> it to run in as the last thing in rc2,d .....
> 
> If anyone has any suggestions, I would greatly appreciate it.
> 
> Thanks.
> Peter

That depends on the distro you're running. On Red Hat / Fedora distros,
add (or change) the following line to /etc/sysctl.conf:

net.ipv4.ip_forward = 1

The echo you're using should work, just make sure nothing else
(i.e. sysctl) resets it to 0 later at boot time (but on RH and
Fedora, sysctl -p occurs in rc.sysinit, so before any rc.[2345]
script).

As an alternative to the echo approach, you can use the sysctl
command directly in your script. My iptables scripts start with:

  sysctl -w net.ipv4.ip_forward=0

and end with:

  sysctl -w net.ipv4.ip_forward=1

so that forwarding is disabled while the scripts are messing with rules:
I tend to use the scripts at runtime now and then, disabling forwarding
is just safer.

.TM.
-- 
      ____/  ____/   /
     /      /       /			Marco Colombo
    ___/  ___  /   /		      Technical Manager
   /          /   /			 ESI s.r.l.
 _____/ _____/  _/		       Colombo@ESI.it


