From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: NetFilter rules break when freeswan is enabled
Date: Sun, 24 Aug 2003 20:26:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPIEKBCHAA.markee@bandwidthco.com>
References: <Pine.SOL.4.30.0308231003440.27161-100000@ericps.crc.uiuc.edu>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.30.0308231003440.27161-100000@ericps.crc.uiuc.edu>
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
To: Marcelo Medici <gaucho@ericps.crc.uiuc.edu>, netfilter@lists.netfilter.org

Are you are using SNAT?  If so, this may be your problem.  Depending on
whether or not you are using ESP vs. AH, you may be encrypting the IP header
and this will break your system.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Marcelo Medici
Sent: Saturday, August 23, 2003 8:08 AM
To: netfilter@lists.netfilter.org
Subject: NetFilter rules break when freeswan is enabled


Hello,
I am currently seeing a problem on a machine running iptables 1.2.6.
The machine acts as a masquerade gateway for a group of rfc1918 addresses.
When I enable ipsec0 via the freeswan project, all forwarding using nat
ceases. The gateway server itself still has reachability outward, as well
as inward to the private network. It is only the masquerading that stops.

Has anyone seen this type of behavior before? My iptables config is quite
large, but I can post it if a response requires it.

Thank you.




