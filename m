From: "Eric Plikuhn" <ericgate@imagestream-is.com>
Subject: Need to NAT incomming packets
Date: Wed, 12 Jun 2002 15:31:57 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <011e01c21250$32829ee0$cd64a8c0@imagestream.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I trying to determine if the following can be done.  I've searched for a
solution but can not find it... because most people are not forced to
attempt this.

Here is the scenario:

Site A  10.0.0.0/8
   ||
   ||
Core Router==========Internet
   ||
   ||
Site B  10.0.0.0/8

My problem is that the Site A and B router don't/can't do NAT.  The second
problem is that they MAY be using the same IP addresses at both sites.  Each
site was giving the 10.0.0.0/8 private network to do work with and they have
IP address all over it.

I was hoping have a SNAT rule for each incoming interface in the prerouting
chain on the Core router....  but you can't do SNAT in prerouting with
iptables.

I'm thought of a few possibilities, but so far they all fall short.
Assuming that I can't get new routers at the Site locations and they may be
using the same IP's what can I do?

Eric



