From: "Arnst, Rainer" <Rainer.Arnst@ee-consultants.de>
Subject: Re: IPSec Transport Mode
Date: Wed, 07 Jul 2004 16:21:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de>
	 <200407071453.49223.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407071453.49223.Antony@Soft-Solutions.co.uk>
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
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

Hello,

thank you Antony for your quick and very helpful answer!!

On Mi, 2004-07-07 at 15:53, Antony Stone wrote:
> > With this Setup, is there anything that can be done with IPTables to
> > make the transport mode work w/o NAT-T?
> 
> I can think of two ways:
> 1. Put a genuine public IP address on the destination Security Gateway 
> machine, routed through the firewall without nat.

This sounds really good. How do I tell iptables not to perform NAT for
IPSec?

Currently the firewall is a Test-Setup with IPCop. Since the
IpCop-Interface does not support ESP I added these iptables rules to the
zillions of rules put in place by ipcop to make it work, probably a bit
to open anyway :-) :

iptables -A INPUT -p 50 -j ACCEPT
iptables -A OUTPUT -p 50 -j ACCEPT
iptables -A FORWARD -p 50 -j ACCEPT

How would I modify these to pass on the packets without NAT?

Thanks a lot,
Rainer Arnst

