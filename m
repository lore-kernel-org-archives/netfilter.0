From: "T. Horsnell" <tsh@mrc-lmb.cam.ac.uk>
Subject: routing bewteen two networks on the same LAN
Date: Mon, 02 Jun 2003 13:37:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EDB4521.A08859B@mrc-lmb.cam.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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


Should iptables be able to forward between two different ip
address spaces on the same LAN (i.e. using the same ethernet
adapter for both input and output)?

We currently have global ip addresses for hosts on our network
and I'm trying to migrate them to the 10. private address space.
I have a separate iptables box running as a firewall, and have 
added entries like

iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/9 -d 131.111.26.0/24
iptables -A FORWARD -i eth0 -o eth0 -s 131.111.26.0/24 -d 10.0.0.0/9

but I cant get traffic between, say, a host 10.0.0.1 and a 
host 131.111.26.1

If 10.0.0.1 pings 131.111.26.1, tcpdump on the firewall
shows ICMP packets arriving on eth0 from 10.0.0.1 and
apparently going  out to 131.111.26.1, but 131.111.26.1
never sees them.
(I have got IP_FORWARDING turned on..).

Any advice would be welcome.

Cheers,
Terry.

-- 


Terry Horsnell (tsh@mrc-lmb.cam.ac.uk)
I.T. Manager
Medical Research Council
Lab of Molecular Biology
Hills Road
CAMBRIDGE CB2 2QH
U.K.
Phone:	+44 (0)1223 248011
Fax:	+44 (0)1223 213556

