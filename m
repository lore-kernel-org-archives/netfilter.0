From: Jason Opperisano <opie@817west.com>
Subject: Re: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 08:30:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095337850.2045.11.camel@wolfpack.ljm.dom>
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
To: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 07:36, Alexandros Papadopoulos wrote:
> I stumbled across 
> http://www.linuxhomenetworking.com/linux-adv/vpn-linux.htm today, which 
> states that "NAT breaks VPNs".

yes it does.  not that you can't put a cast on it, though...

> Is this just an over-simplifying statement that really means "if you're 
> reading this, then don't even try setting up a NAT-traversing VPN"?
> 

it is an over-simplifying statement--but it's generally good advice.

> This is exactly what I'm planning to do; I've got my mind set on having 
> the two VPN endpoints inside two NATed networks, both managed by 
> respective dedicated linux boxes running only netfilter.

move the endpoints of the VPN tunnel to be the linux boxes running
netfilter, unless you have "i helped write the RFC's" level of
familiarity with IPSec.

> If that is indeed possible (and doable for a first timer), could anyone 
> provide some relevant pointers to documentation?

http://www.openswan.org/ has the latest version of the freeswan
implementation, but their docs are still catching up.

the old freeswan docs are still
available--http://www.freeswan.org/freeswan_trees/freeswan-1.99/doc/toc.html might be a good place to start.

having both ends of a site-to-site VPN behind NAT is an awfully painful
situation.  especially if you have the netfilter gateways available to
do the job.

there's the common statement of "don't run any services on your
firewall, period" which i generally agree with.  when it comes to
IPSec--i do not.  i think the firewall is a fine place to terminate VPN
tunnels (decrypt->filter->NEXT)...

-j

-- 
Jason Opperisano <opie@817west.com>


