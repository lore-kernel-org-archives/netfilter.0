From: William Stearns <wstearns@pobox.com>
Subject: Re: iptables: troubling identifying  devices
Date: Thu, 12 Feb 2004 12:49:39 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0402121244110.14623-100000@sparrow>
References: <BFEIJHPOPCCMOPEKHHMOOEDOCNAA.giovanni.costagliola@nexusat.it>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BFEIJHPOPCCMOPEKHHMOOEDOCNAA.giovanni.costagliola@nexusat.it>
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
To: giovanni costagliola <giovanni.costagliola@nexusat.it>
Cc: ML-netfilter <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good evening, Giovanni,

On Thu, 12 Feb 2004, giovanni costagliola wrote:

> hello guys,
> 	I'm experiencing a strange problem with iptables nat configuration.
> 
> I've set up a star firewall with 3 physical NIC. I've configured two oh them
> with multi-ip assignement.
> 
> let's go to the core of the problem. it seems that the iface identified by
> eth0_1, eth0_0 are not recognized by iptables. if I change the name using
> the less qualified eth0 (adding some more details to discriminate the
> source) it works.
> 
> where I am wrong?
> 
> I have also noticed that iptable accept any name to identify the NIC.
> 
> my workaround is not so elegant. there's another way to name the iface
> multiIPed?

	My best understanding is that iptables can only identify the 
physical device - eth0.
	Think about the problems of trying to do rules based on "eth0:1".  
If I have 4 IP addresses on a subnet bound to a physical eth0 and I get a
packet to the broadcast address of that subnet, which virtual interface
would that match?
	In short, iptables can only identify the physical device.  To get 
nor granular, you're going to have to use -s or -d to match on ip 
addresses, and then think about what to do with broadcast packets, for 
example.
	Cheers,
	- Bill

---------------------------------------------------------------------------
	"Microsoft's biggest and most dangerous contribution to the 
software industry may be the degree to which it has lowered user 
expectations."
	-- Esther Schindler, OS/2 Magazine
(Courtesy of Bob Tracy - TDS <rct@merkin.csap.af.mil>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
--------------------------------------------------------------------------


