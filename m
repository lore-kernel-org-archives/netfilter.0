From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Mon, 4 Jul 2005 20:13:25 +0900
Message-ID: <NEBBKBPLMLNABNADCIPACEGEBDAB.dleangen@canada.com>
References: <NEBBKBPLMLNABNADCIPAGEDABDAB.dleangen@canada.com>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAGEDABDAB.dleangen@canada.com>
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


Hello!

> > RH/FC and such like to hide information from the user. You can add
> > some shell code to your startup scripts which redirect more verbose
> > output to files. In this case maybe some echo commands to show
> > which file is being fed to iptables-restore.

Well, I did little more digging. Although I see more and more what's going
on, I'm understanding less and less.

I have two machines on which I freshly installed FC3, in the exaclty the
same way, with minimal packages. Since I installed FC3 exactly the same way,
it should behave the same way on both systems, right? Well, not so. That's
the first point I do not understand.

On one machine ("goodhost"), everything works exactly as expected.

On the misbehaving machine, however, ("badhost"), I noticed that contrary to
what I mentioned in my previous posts, /etc/sysconfig/iptables does indeed
appear to get loaded at system startup.

However, IT DOES NOT GET LOADED THE SAME WAY!!

Why is that? Why would the same file not get loaded the same way on startup
as it does when running iptables-restore afterward? And why does it work on
one machine, but not on another with the same installation? I've tried on a
few different firewall rules files, and the same thing always seems to
happen. I even tried with the default RedHat firewall rules. The diff of
'iptables-L' between the two (firewall loaded at startup vs. firewall loaded
afterward with iptables-restore) is below.

Any ideas about this very strange situation? Any help would be most
appreciated!



< RH-Firewall-1-INPUT  all  --  anywhere             anywhere
---
> DROP       tcp  --  anywhere             anywhere            tcp
dpts:0:1023
> DROP       udp  --  anywhere             anywhere            udp
dpts:0:1023
> DROP       tcp  --  anywhere             anywhere            tcp
flags:SYN,RST,ACK/SYN
> DROP       icmp --  anywhere             anywhere            icmp
echo-request
5c8
< Chain FORWARD (policy ACCEPT)
---
> Chain FORWARD (policy DROP)
7d9
< RH-Firewall-1-INPUT  all  --  anywhere             anywhere
12c14
< Chain RH-Firewall-1-INPUT (2 references)
---
> Chain RH-Firewall-1-INPUT (0 references)



