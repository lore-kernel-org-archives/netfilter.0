From: "Jason Sigurdur" <Jason.Sigurdur@aspenview.org>
Subject: routing question
Date: Wed, 12 Apr 2006 14:51:29 -0600
Message-ID: <648A21EA469E3848922D9860785CD5EF23D496@aspen-mail01.aspenview.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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


I have the following scenario:

Two subnets, two ipsec vpn servers using openswan.
Vpn server 1 192.168.10.1,10.10.1.1
Vpn Server 2 192.168.30.1, 10.30.1.1

I can ping 192.168.10.1 -> 30.1, but cannot ping 10.10.1.1 -> 10.30/16 ,
but can ping from 10.30.1.10 {any system not the vpn box} to 10.10.1.1}

Is this how the SA dictates the vpn or is it a routing thing.

I noticed that if I ping from 10.10.1.1 to an 10.30/16 address, the
packets are sent over the ipsecX but with an 192.168.10.1 as a source
address.

I should I see this, I thought the SA would only tunnel 10.10/16 <->
10.30/16 traffic?

Is there a way I can allow for the vpn systems to use its internal
source address?

Thx jason


conn S1toS16
        left=3D192.168.10.1
        leftnexthop=3D192.168.10.254
        leftsubnet=3D10.10.0.0/16
        right=3D192.168.30.1
        rightnexthop=3D192.168.30.254
        rightsubnet=3D10.30.0.0/16
        auto =3D start

