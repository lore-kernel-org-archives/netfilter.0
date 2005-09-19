From: "Jojo Solis" <jojo.solis@summitmedia.com.ph>
Subject: Help creating a RULE
Date: Mon, 19 Sep 2005 08:39:48 +0800
Message-ID: <CBF2220F040BC54584E69D569377DC4D41698F@smg-mail.summitmedia.com.ph>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----_=_NextPart_001_01C5BCB2.A353E6B4";
	type="multipart/alternative"
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C5BCB2.A353E6B4
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,
=20
=20
We have firewall with 3 LAN Card, Eth0 is connected to my LAN, eth1 is
Connected to Internet, and eth2 is connected to our Sister companies
WAN.
=20
Since I am new to IPtables i dont know how to create a Rule to make the
packet successfully reach its destination. This setup was made by a
former sysad but left the firewall especially the connection going to
the Sister Companies WAN un-configured. So that's the reason why Im here
to seek help creating a rule for this firewall.
=20
Basically I want to achive the following.
=20
1. Allow any IN and OUT traffic from eth0 to eth2 and vice versa.
2. Allow IN and OUT http traffic from eth0 to eth1.
3. Allow IN and OUT SMTP traffic from eth0 to eth1.
4. Allow Outgoing FTP traffic from eth0 to Eth1, Plus allow ESTABLISHED
and RELATED FTP connection.
=20
=20
Thanks,
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20

------_=_NextPart_001_01C5BCB2.A353E6B4--

