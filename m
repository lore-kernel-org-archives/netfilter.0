From: =?ISO-8859-15?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: krn 2.4.30, iptables 1.3.1, last pom and condition extension
 problem
Date: Wed, 20 Apr 2005 13:43:55 +0200
Message-ID: <4266407B.7060909@arcoscom.com>
References: <4263FD5D.4050205@arcoscom.com>
Reply-To: samueldg@arcoscom.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040304020900070701030106"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4263FD5D.4050205@arcoscom.com>
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
--------------040304020900070701030106
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

=BFAny suggestion?

Samuel D=EDaz Garc=EDa wrote:

> I had trying to use -m condition iptables extension module, but when I=20
> see /proc/net I cant see ipt_condition directory and I can't make it.
>=20
> I try to put in --condition parameter an absolut path, the iptables=20
> command had no problem running, but seems it allways assume "1" when I=20
> put "1" or "0" into it.
>=20
> I use lines as these:
>=20
> #> echo "0" > /my_conditions/ipp2p_on
> #> iptables -A FORWARD -m condition ! --condition=20
> /my_conditionss/ipp2p_on -m ipp2p --ipp2p -j DROP
>=20
> And, the idea is, to enable or disable ipp2p software transfers is only=20
> put "1" or "0" into the condition.
>=20
> =BFSome helps about this problem?
>=20
> How can I make the /proc/net/ipt_condition directory?
>=20
> Thanks
>=20

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

mailto:samueldg@arcoscom.com
http://www.arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

--------------040304020900070701030106--

