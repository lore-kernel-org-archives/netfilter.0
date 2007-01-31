From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connect to localhost bound port from outside?
Date: Wed, 31 Jan 2007 11:13:59 +0100
Message-ID: <45C06BE7.2080208@plouf.fr.eu.org>
References: <eppgne$mc1$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <eppgne$mc1$1@sea.gmane.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

jan_bar a =E9crit :
>=20
> I want to connect from my VPN interface to the port that is bound to
> (listening on) localhost. The server listens only on localhost, so it i=
s not
> visible to outside world and it seems that I cannot use iptables to for=
ward
> outside traffice from VPN to that port.

Iptables will happily redirect anything you like to localhost, but the=20
kernel IP routing prohibits communications with a loopback address on a=20
non loopback interface and thus will drop the packets. This is similar=20
to the problem in the above thread "port forwarding through localhost",=20
and the same workaround is applicable.

