From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: VPN over netfilter NAT
Date: Fri, 12 Nov 2004 09:09:55 -0400
Message-ID: <025601c4c8b8$e81b2fd0$49caa8c0@caris.priv>
References: <200409161436.26695.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Alexandros Papadopoulos <apapadop@alumni.carnegiemellon.edu>, netfilter@lists.netfilter.org

I know this was an old post .. but I just thought I would add my two sense
....

When choosing your vpn you need to consider what type of servers the vpn
server's will be ... For instance ... if you are using two different types
of servers for endpoints .. say rh and bsd .. you will be limited in
options. (I only bring this aside up as allot of the posts mentioned
specific vpn solutions .. but not all work on all platforms).

As for the Nat question .... This is dependant on what you are doing.  Are
you setting up a perminant vpn between two offices  or are you trying to set
up a road warrior configuration.  If the first is what you are doing, then
you can either put the vpn server on your firewall .... or, if you have a
dmz, put it on a box in your dmz.  Personally I would and have chosen the
dmz route as I don't like running anything on my firewall box and also, when
you mess up configureing your vpn ... (this is likely for first time
vpn'ers), your firewall will be down and out.

What most of the docs are refering to with "No NAT" is that for most vpn
servers, you can not have the VPN server on an internal IP address .... it
has to have a public address.

Hope this helps ... I realize my post is probably way too late for you.

Peter



----- Original Message ----- 
From: "Alexandros Papadopoulos" <apapadop@alumni.carnegiemellon.edu>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, September 16, 2004 7:36 AM
Subject: VPN over netfilter NAT


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


