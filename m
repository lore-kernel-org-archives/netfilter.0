From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Multiple IPSEC VPNs through a firewall based on 2.4.2X kernel
Date: Thu, 26 Aug 2004 06:39:25 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093516765.2021.8.camel@localhost>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au>
	<1093339912.2050.208.camel@localhost>
	<20040826091328.GD18545@arkena.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040826091328.GD18545@arkena.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Thomas Kirk <thomas@arkena.com>
Cc: netfilter@lists.netfilter.org, Roksana Boreli <Roksana.Boreli@nicta.com.au>

On Thu, 2004-08-26 at 05:13, Thomas Kirk wrote:
<snip>
> Excusing me for interrupting the discussion but in a situation where i
> would like to make a LAN-to-LAN IPsec VPN between to offices both
> running iptables on the gateways. Ive been lurking on the liste for
> some time but i have a few questions regarding this. First each site
> have a link to internet howto specify which protocols that should go
> over VPN and which should go to internet? Which IPsec implementation
> would be the most stable and secure solution to use. Currently im
> using a couple of retired pcworkstations running debian woody so i
> would prefer something that is supported by debian but its not
> absolutly neccessary :)
> 
> Thanks in advance
I have been using either strongswan (http://www.strongswan.org) or
openswan (http://www.openswan.org) for an IPSec implementation.  The
Linux 2.6 kernel and I believe some of the later 2.4 kernels support
IPSec natively.  I have yet to experiment with the kernel IPSec.  My
guess is that its code is somewhat cleaner than *swan.

I do like the way in which *swan uses a separate interface for IPSec
traffic.  This makes it simple to identify the VPN traffic in iptables
although it is not impossible to do so with the kernel IPSec.

I have traditionally determined which traffic goes in the clear and
which goes in the tunnel based upon destination network, e.g., traffic
between 192.168.1.0/24 and 10.1.1.0/24 go through the tunnel while the
rest goes in the clear.  I have been away from configuring *swan for
quite a while and I believe there have been significant advances since
then.  It used to be that one could specify which sockets could be used
to initiate the tunnel but then any traffic could use the tunnel once
established.  I believe one can now restrict a tunnel based upon socket
but I'm not sure.  I would suggest going to either of the sites
mentioned above and perusing the documentation.  Good luck - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


