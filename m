From: Marcelo Medici <gaucho@ericps.crc.uiuc.edu>
Subject: NetFilter rules break when freeswan is enabled
Date: Sat, 23 Aug 2003 10:08:19 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.30.0308231003440.27161-100000@ericps.crc.uiuc.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,
I am currently seeing a problem on a machine running iptables 1.2.6.
The machine acts as a masquerade gateway for a group of rfc1918 addresses.
When I enable ipsec0 via the freeswan project, all forwarding using nat
ceases. The gateway server itself still has reachability outward, as well
as inward to the private network. It is only the masquerading that stops.

Has anyone seen this type of behavior before? My iptables config is quite
large, but I can post it if a response requires it.

Thank you.


