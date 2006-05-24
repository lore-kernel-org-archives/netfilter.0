From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: precedence and redundancy questions re ACCEPT vs NEW
Date: Wed, 24 May 2006 10:03:56 +1000
Message-ID: <003801c67ec5$8ccead90$bf20a8c0@snow>
References: <4473a1a6.109.4e72.1299307770@lowell.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4473a1a6.109.4e72.1299307770@lowell.edu>
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
To: pjh@lowell.edu, netfilter@lists.netfilter.org

IPTables is just that: A table. A packet is said to traverse the table, =
ie it starts at the first rule and checks for a match. If the rule's =
conditions do not match the packet, then that rule is ignored and the =
packet is compared against the second rule, so on and so forth until it =
finds a match. If it doesn't find a match, that is where the default =
rule comes in the play.

In your case, whichever rule is first is the rule that will pick the =
packet. So in what you have provided, the very top rule will be used and =
the other two ignored.=20

HTH

Anthony Sadler
Far Edge Technology
w: (02) 8425 1400
=20
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Padraig =
Houlahan
Sent: Wednesday, 24 May 2006 09:59=20
To: netfilter@lists.netfilter.org
Subject: precedence and redundancy questions re ACCEPT vs NEW

Greetings:

If my firewall receives a packet from 1.2.3.4, which rule
accepts it?

-A INPUT -s 1.2.3.4                       -j ACCEPT
-A INPUT -s 1.2.3.4 -m state --state NEW  -j ACCEPT
-A INPUT -s 1.2.3.4 -p TCP   --syn        -j ACCEPT     =20

Does it matter if the packet is the first of a new
connection?

Are these lines redundant in the sense they will all allow a
first connection packet through?

Are rules #2 and #3 the same?

Regards,

PH

++++++++++++
Padraig Houlahan
IT Manager
Lowell Observatory
Flagstaff, AZ
928-774-3358 x 214



