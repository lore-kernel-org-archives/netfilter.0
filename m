From: fabrizio.gennari@philips.com
Subject: Netfilter and Linux bridge
Date: Wed, 15 May 2002 17:39:20 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <OFBE0CCD08.260F20AC-ONC1256BBA.0055906D@diamond.philips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hello.

I was wondering whether Netfilter can filter away packets handled by Linux 
bridge. If the bridge forwards the packet to another port, the packet 
never goes through IP routing, so Netfilter should handle it inside the 
bridge.

Also, is it possible to apply rules to packets according to the protocol 
type in Ethernet header (h_proto in struct ethhdr)? The man page says it 
is possible to apply rules according to source MAC, but says nothing about 
Ethernet protocol type.

Fabrizio Gennari
Philips Research Monza
via G.Casati 23, 20052 Monza (MI), Italy
tel. +39 039 2037816, fax +39 039 2037800

