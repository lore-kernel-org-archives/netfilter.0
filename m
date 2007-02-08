From: =?ISO-8859-1?Q?Pedro_Gon=E7alves?= <pedro.pandre@gmail.com>
Subject: Fwd: IPTables and different types of NAT
Date: Thu, 08 Feb 2007 14:47:56 +0000
Message-ID: <45CB381C.3030301@gmail.com>
References: <45C9F509.8010309@gmail.com> <45C9FBFB.9090607@riverviewtech.net>	
	<45CA160E.90102@plouf.fr.eu.org>
	<45CA2201.7040205@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CA2201.7040205@riverviewtech.net>
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
To: netfilter@lists.netfilter.org

I still don't have a clear answer whether it is possible or not to 
implement all types of NAT.

So, has anyone implemented *any* kind of NAT?
If so, how have you done?

Best Regards
Pedro


---------- Forwarded message ----------
From: *Grant Taylor* <gtaylor@riverviewtech.net 
<mailto:gtaylor@riverviewtech.net>>
Date: Feb 7, 2007 7:01 PM
Subject: Re: IPTables and different types of NAT
To: Mail List - Netfilter <netfilter@lists.netfilter.org 
<mailto:netfilter@lists.netfilter.org>>

Pascal Hambourg wrote:
 > No. Please read more carefully the definitions of "restricted cone NAT"
 > and "port restricted cone NAT". Neither can be implemented with iptables
 > because they do not fit in the per-connection model.

"""With restricted cone NAT, all requests from the same internal IP
address and port are mapped to the same external IP address and port.
Unlike a full cone NAT, an external host can send a packet to the
internal host only if the internal host had previously sent a packet to
it."""

"""Port restricted cone NAT or symmetric NAT is like a restricted cone
NAT, but the restriction includes port numbers. Specifically, an
external host can send a packet to a particular port on the internal
host only if the internal host had previously sent a packet from that
port to the external host."""

The only other thing that comes to mind is that IPTables by its self
does not by default filter based on connection(s) and / or state.
However, there are match extensions that can be used to augment a basic
IPTables rule to do just that.  I.e.  CONNMARK in conjunction with MARK.

 > "Symmetric NAT" works on a per-connection basis and is the NAT form that
 > is the easiest to implement with iptables using SNAT or MASQUERADE.

I understood Symetric NAT to be a form of "one to many" or "many to
many" NATing.  The key part being the "... to many" in where multiple
external IPs would be used.  I know that it is possible (though I have
not done it) to specify a range to SNAT traffic with IPTables to a range
of IP addresses.  I was not aware that MASQUERADE would do the same
thing.  I was under the impression that MASQUERADE used the single IP on
an interface as the IP to SNAT traffic to.



Grant. . . .


