From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 07:49:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095335345.2065.18.camel@localhost>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
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
To: Alexandros Papadopoulos <apapadop@alumni.carnegiemellon.edu>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 07:36, Alexandros Papadopoulos wrote:
> I stumbled across 
> http://www.linuxhomenetworking.com/linux-adv/vpn-linux.htm today, which 
> states that "NAT breaks VPNs".
> 
> Is this just an over-simplifying statement that really means "if you're 
> reading this, then don't even try setting up a NAT-traversing VPN"?
> 
> This is exactly what I'm planning to do; I've got my mind set on having 
> the two VPN endpoints inside two NATed networks, both managed by 
> respective dedicated linux boxes running only netfilter.
> 
> If that is indeed possible (and doable for a first timer), could anyone 
> provide some relevant pointers to documentation?
> 
> Cheers
> 
> -A
There is quite a bit of (somewhat dated) information about using these
technologies together in the training section at
http://iscs.sourceforge.net 

One can use IPSec and NAT but with some caveats.  The simplest way is if
you can arrange for a one-to-one NAT so that the public address is fixed
and unique.

If you must do NAPT, i.e., many-to-one - port address translation, then
you can use NAT Traversal.  However, this will work for outbound
initiated connections only.  The initiating point needs to find the
other end point.  So, for example, one can use NAT-T for ones mobile
users but it would be near impossible to do so for the gateway to which
they connect.  I have never tried port-mapping a VPN gateway and have no
idea if that would work.

Good luck with it - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


