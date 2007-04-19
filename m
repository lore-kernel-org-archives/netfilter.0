From: richard@net-solutions.net.nz
Subject: Re: Where has NAT gone?
Date: Thu, 19 Apr 2007 09:37:00 GMT
Message-ID: <20070419093659.E25F2DBAAD@mail5.inspire.net.nz>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Torsten Luettgert <t.luettgert@pressestimmen.de>, richard@net-solutions.net.nz, netfilter@lists.netfilter.org

> On Tue, 2007-04-17 at 08:12 +0000, richard@net-solutions.net.nz wrote:
> > Today I upgraded my system from Linux
> > Kernel 2.6.16.20 to 2.6.20.7 because I needed an updated NIC driver. Upon
> > running make menuconfig, I noticed that the options for NAT seem to have
> > vanished from the config menu. 
> ....
> > I'm not sure if this is the right place to ask but the kernel mailing list
> > was slow at responding so I thought I'd try here.
> 
> Exactly the right place to ask, don't worry.
> 
> What you're probably missing is conntrack, which moved to
> 
> Networking ->
> Networking options ->
> Network packet filtering framework (Netfilter) ->
> Core Netfilter Configuration
> 
> There, enable "Netfilter connection tracking support"
> (CONFIG_NF_CONNTRACK_ENABLED) and "Netfilter Xtables support"
> (CONFIG_NETFILTER_XTABLES).
> 
> Then, one menu up and into "IP: Netfilter Configuration",
> enable
> 
> IPv4 connection tracking support (CONFIG_NF_CONNTRACK_IPV4)
> IP tables support (CONFIG_IP_NF_IPTABLES)
> Full NAT (CONFIG_NF_NAT)
> 
> and optionally MASQUERADE / REDIRECT.
> 
> I understand those config options were moved because they are
> actually not IPv4 specific ("iptables") but more general,
> IPv4 / IPv6 / ARP ("xtables").
> The binary for setting the rules is still called "iptables", though.
> 
> Hth,
> Torsten
> 

Thanks Torsten, that was very helpful. Glad I found the right place first
time round!

Regards
Richard

------------------------------------------------
This message was sent using InSPire Net Webmail.
http://www.inspire.net.nz



