From: =?iso-8859-1?q?Jo?= <jo0oj63@yahoo.com>
Subject: bootp problems
Date: Tue, 6 Apr 2004 16:11:59 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040406141159.752.qmail@web13121.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

hi,

i have the following problem

[DialIn]2.2.2.2----2.2.2.1[FW]1.1.1.1---1.1.1.2[DHCP]

the DialIn tries to get an IP from the DHCP Server.
the firewall opened for 67/udp with logging

with tcpdump on 2.1 i can see 0.0.0.0:68 > 1.1.1.2:67
in the firewall log i can see nothing
with tcpdump on 1.1 i can see nothing

thx for help
jo


=09
	=09
Mit sch=F6nen Gr=FC=DFen von Yahoo! Mail - http://mail.yahoo.de

