From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fw: DROP All MACs
Date: Mon, 17 Nov 2003 17:32:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171732.hAHHWkj22319@agate.rockstone.co.uk>
References: <002901c3ad2d$9229c390$0d1ea8c0@win2000adv>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002901c3ad2d$9229c390$0d1ea8c0@win2000adv>
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

On Monday 17 November 2003 5:09 pm, curlybraces wrote:

> i will explain , but i need good solution for this matter today itself
> ...............pls
>
> let me to explain ,
>
> in my lan has 5 windpows 2000 pcs. and one Red Hat Linux 8 box .This
> linux box has 2 ethernet - eth0 , eth1 .
> DHCP , Firewall ( iptables ) running in the Linux box .Normally without
> implemention g firewall dhcp server works fine . why i'm try to install a
> firewall for the dhcp server  is i want block some machines which r
> strainge to the network .

I think the solution you require is probably ebtables, not IPtables, if you 
are trying to stop machines acquiring IP addresses by DHCP in the first place.

See my earlier response to this list in the thread "Re: MAC Block for the 
DHCP via iptables" Mon, 17 Nov 2003 17:02:46

Hope this helps,

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.

