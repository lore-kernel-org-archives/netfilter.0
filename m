From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: CISCO VPN clients behind firewall
Date: Wed, 05 May 2004 11:20:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083770411.9146.33.camel@localhost>
References: <00f101c43236$e54f0380$0300a8c0@indoakses2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f101c43236$e54f0380$0300a8c0@indoakses2>
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
To: bino_oetomo <bino@indoakses-online.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-04 at 20:21, bino_oetomo wrote:
> Hi All
> 
> Is there any clue/docs on hoe to let multiple clients behind firewall =
> connecting to CISCO vpn concentrator ?
> 
> Sincerely
> -bino-
> 
> 
I've not worked with the Cisco VPN gear yet but I can give some general
guidelines.  Assuming the Cisco client is a basic IPSec client, you have
four options that I can think of immediately.

The easiest has already been suggested - if the clients support
NAT-Traversal, use that and just be sure that whatever ports are needed
for the initial key exchange (e.g., 500/udp for IKE) and for the
encrypted traffic (e.g., 500/udp or 4500/udp depending the on version of
NAT-Traversal) are open on the firewall.  You will obviously need them
open outbound.  I'm not sure what happens if the remote tunnel
termination point attempts to initiate the rekeying sequence and you do
allow inbound traffic.  Perhaps someone with more experience in actually
doing this can comment.  Does one just ensure that the client rekeying
times are shorter than the gateway rekeying times?

If the client does not support NAT traversal, you might assign each user
who needs VPN access a static IP address and do a one-to-one mapping of
their private address to a public address.  This was the only client
oriented choice (and an ugly one at that) before NAT-T.  In this case
one must be sure that the client can initiate outbound traffic for both
the key exchange and the IPSec packets - typically ESP - IP protocol 50.

Both of the client oriented solutions assume that you either trust all
traffic that could possible enter the tunnel from the other side (and
all traffic being generate from the client for that matter) or you have
some kind of access control either on the client or on the remote
gateway.  If this is not true, you may wish to attempt either or both of
two possible gateway oriented solutions.

Sometimes, when we have a large number of clients needing access, we
find it easier to create a gateway to gateway connection between the
sites.  Either a Cisco VPN concentrator can be brought on site and be
the route to the remote network or one can implement an IPSec stack on
the firewall and attempt to get the firewall and VPN concentrator
talking to each other.  In this way, access controls can be placed on
both the inbound and outbound traffic with access control maintained in
one place instead of every desktop.  One will need to allow the
necessary ports for both the client to pass traffic through firewall and
to establish and maintain the tunnel with the remote VPN concentrator
and be able to identify the traffic flowing in and out of the tunnel.

If one desires to encrypt the local traffic or wants stronger local user
authentication than IP address, one can establish a VPN connection
between the local client and the local firewall and then a separate
tunnel between the local firewall and the remote VPN concentrator.  This
maintains the possibility of centralized access control on the tunnel. 
One will need to allow the traffic necessary to establish the client
connection with the firewall, identify the traffic flowing in and out of
the tunnel and allow the traffic to establish and maintain the tunnel
with the remote VPN concentrator.

Hope this helps - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


