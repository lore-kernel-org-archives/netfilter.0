From: =?iso-8859-1?q?Cilli=E8=20Burger?= <c_burger@sadomain.co.za>
Subject: RE: masquerading
Date: Fri, 12 Sep 2003 13:24:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309121324.50647.c_burger@sadomain.co.za>
Reply-To: c_burger@sadomain.co.za
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
To: wenmoore@yahoo.com
Cc: netfilter@lists.netfilter.org

Hi Wendy,=20

Sounds like you need the following in the FORWARD chain inside=20
the filter table:=20

iptables --append FORWARD -proto tcp -m state --state ESTABLISHED,RELATED=
=20
--jump ACCEPT

and=20

iptables --append FORWARD -proto udp -m state --state ESTABLISHED,RELATED=
=20
--jump ACCEPT


that should solve your problem, if i understood your question correctly=20


--=20
Regards,=20

Cilli=E8 Burger=20
SA-DOMAIN Internet Services=20


