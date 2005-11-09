From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: iptables on DLink DSL-502T Modem/Router
Date: Wed, 9 Nov 2005 12:04:06 +1100
Message-ID: <46985.8382981785$1131539100@news.gmane.org>
References: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
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
To: 'Paul Goodyear' <pgudge@gmail.com>, netfilter@lists.netfilter.org

I would personally filter either in the PREROUTING table:
iptables -t nat -I PREROUTING -p tcp -s SOURCEIP -d EXT_INTERFACE =
--dport PORT -j DNAT --to INTERNALIP:PORT
Or on the FORWARD table:
iptables -I FORWARD -p $PROTO -s $SOURCEIP -d $INTERNALIP --dport =
$PORTINT -j ACCEPT

This is assuming you have a default rule of drop or deny on your FORWARD =
table.

Anthony Sadler
Far Edge Technology
w: (02) 8425 1400
=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Paul =
Goodyear
Sent: Tuesday, 8 November 2005 12:47=20
To: netfilter@lists.netfilter.org
Subject: iptables on DLink DSL-502T Modem/Router

Hi all,

Does iptables version v1.2.6a support forwarding from a source IP?

The reason I ask, is I have a DLink DSL-502T modem router, the router
has linux on and running iptables.

The webadmin for the router does not allow you to create ip filters,
port forwarding is there but not filtering.

I want to allow access to port 3389 from only 1 internet IP address.
Should this work? (81.81.81.81 being an example)

iptables -A INPUT -s 81.81.81.81 -d 192.168.1.2 -p tcp --dport 3389 -j =
ACCEPT

The router does no allow me to connect in once this rule is in iptables.

Thanks.

Paul.



