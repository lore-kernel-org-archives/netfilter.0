From: "Vik Heyndrickx" <vik.heyndrickx@pandora.be>
Subject: RE: iptables on Red Hat Linux 8.0 installation requires frequent iptables restart
Date: Sat, 21 Dec 2002 12:24:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GNEJLJFCHGLBHGLBHFMPEEPLCAAA.vik.heyndrickx@pandora.be>
References: <F635E25A78F69C41B85DC6CB18972A9A4746FA@kepler.blueshiftinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F635E25A78F69C41B85DC6CB18972A9A4746FA@kepler.blueshiftinc.com>
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
To: netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of John A. Novak
> Sent: Friday, December 20, 2002 10:13 PM
> To: netfilter@lists.netfilter.org
> Subject: iptables on Red Hat Linux 8.0 installation requires frequent
> iptables restart
>
>
> Greetings,
>
> I am running iptables on a Red Hat Linux 8.0 system that I
> received from Red Hat about a month ago.  I am using iptables
> straight off the distribution CD.
>
> The system iptables is running on is used only as a firewall, has
> 512MB of RAM and three network adapters.  The symptom I'm seeing
> is that every day or so I need to restart the iptables service to
> get packets moving through the firewall again.  The system
> appears to have plenty of available RAM and plenty of free disk
> space when the firewall is dysfunctional.
>
> I am using NAT and have it configured to remap internal addresses
> to two ranges of external ip addresses, one for each of the two
> internal networks.
>
> The periodic failure and resurrection after restart is suggestive
> of a resource leak, but I'm at a loss as to how to proceed to
> further debug this problem.
>
> Any suggestions are appreciated.

I have running a couple of RH8.0 routers/firewalls; some with distro
packages, others upgraded with newer kernels from RH, or my own rebuilds;
they have between 1 and 5 100mbit Ethernet interfaces. The ones which have
all fixed IP addresses keep running for weeks now. The ones with dynamically
assigned IP addresses (through DHCP) need a restart once in a while because
the firewall rules are very strict, and don't allow packets in with a
different destination IP address (that changes sometimes when the DHCP lease
expires). That could be a reason.

Until now I haven't had any situation that couldn't be explained, so I don't
think that there is any bug, like a resource leak in the netfilter code (no,
I don't even believe myself here).

What I suggest is to replace ANY DROP or REJECT line (don't forget the chain
policies), with a LOG + DROP/REJECT. And then sit and wait until no packets
are moving again. Then look in kernel syslog (usually in file
/var/log/messages), and see if packets are being dropped. Use tcpdump -n -i
any to see if the packets are coming in, and are going out.

--
Vik


