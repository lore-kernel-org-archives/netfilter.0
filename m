From: robee <mlody@elpec.com>
Subject: Re: private to public IP
Date: Sun, 02 Jul 2006 18:03:02 +0200
Message-ID: <1151856182.5609.2.camel@robee.mars.cyberbajt.pl>
References: <006801c69dcb$9fccd140$7819a8c0@MYNOTEBOOK>
Reply-To: mlody@elpec.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006801c69dcb$9fccd140$7819a8c0@MYNOTEBOOK>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dnia 02-07-2006, nie o godzinie 14:35 +0300, Wennie V. Lagmay
napisa=B3(a):
> Hi all,
> I want to create a log on Iptables wherein to store and to identify which=
=20
> private Ip is connected on public Ip on a certain date and time. Can you=20
> help me on this
>=20
> Thanks,
>=20
> Wennie=20
>=20
>=20

the easiest way:

iptables -I FORWARD -s PRIVATE_IP -m state --state NEW \
-j LOG --log-level info



robee


