From: "Bryan McAninch" <BMcAninch@PENSON.COM>
Subject: RE: Linux firewall and high availability
Date: Wed, 14 Jan 2004 09:06:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E709DF33395B2A40A33101C5236C60DF0175C945@exchange02.penson.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Drag0n <dragon@atlantacon.org>, netfilter@lists.netfilter.org

I recently setup a HA firewall/vpn gateway cluster using netfilter,
freeswan, and keepalived. Keepalived uses VRRP to sync interfaces for
failover and provides load balancing with LVS - very easy to install and
configure. The problem of load balancing the firewalls is state
synchronization between the firewall nodes. Unfortunately, I don't think
Iptables/Netfilter has that functionality yet, but Iptables2 might...
(?) Nonetheless, you should be able to load balance _stateless_ firewall
nodes.

Cheers,

Bryan

>I have a situation that i need to have firewall fail over=20
>capability. 2 separate systems with identical rules with 3=20
>interfaces, (internet, DMZ, and LAN)=20
>
>Has anyone set up this situation and have any recommendations=20
>on how it should be approached? I have looked into the linux=20
>HA system (http://www.linux-ha.org/). is it possible to load=20
>ballance between the two and shift on failure of the primary?=20
>
>Any info or direction would be appreciated.
>
>Drag0n
>dragon@atlantacon.org

