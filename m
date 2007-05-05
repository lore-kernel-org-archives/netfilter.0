From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: [OT] iptables and 802.1x authenticator
Date: Fri, 04 May 2007 21:22:21 -0400
Message-ID: <1178328141.7512.7.camel@localhost>
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
To: netfilter@lists.netfilter.org

Hello, all. Does anyone know of an open source linux 802.1x
authenticator? I see XSupplicant for the supplicant and FreeRADIUS for
the authentication server but I can't seem to find an authenticator.

We've been toying with combining iptables with the ISCS network
management project (http://iscs.sourceforge.net) and 802.1x.  If we can
do what we think we can do, the results should be quite stunning.  We
should be able to create true, perimeterless network security.  That
means we can stop LAN based worms dead in their tracks, foil ARP
poisoning attacks and other nefarious activities -- all without end
point clients (not that we have anything against end point clients).

I'm in the prototype building stage and hence the need for a testbed
802.1x implementation.  So, if you can kindly point me in the right
direction, I'd greatly appreciate it.  Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


