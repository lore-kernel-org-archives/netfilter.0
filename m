From: Alexandros Papadopoulos <apapadop@alumni.carnegiemellon.edu>
Subject: VPN over netfilter NAT
Date: Thu, 16 Sep 2004 14:36:26 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I stumbled across 
http://www.linuxhomenetworking.com/linux-adv/vpn-linux.htm today, which 
states that "NAT breaks VPNs".

Is this just an over-simplifying statement that really means "if you're 
reading this, then don't even try setting up a NAT-traversing VPN"?

This is exactly what I'm planning to do; I've got my mind set on having 
the two VPN endpoints inside two NATed networks, both managed by 
respective dedicated linux boxes running only netfilter.

If that is indeed possible (and doable for a first timer), could anyone 
provide some relevant pointers to documentation?

Cheers

-A

