From: bernin_a@informatik.haw-hamburg.de
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Tue, 4 Oct 2005 07:09:26 GMT
Message-ID: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

> Hi,
>=20
Hi all!

> I have been having problems with this for some time now. Some packets are=
 not=20
> processed correctly by iptables. This applies only to POSTROUTING chain i=
n=20
> NAT table.=20
>=20

I have almost the same problem here. Some packets don't seem to traverse the
POSTROUTING chain of the nat table and don't get Snatted, but i can see the=
m in
the mangle table (POSTROUTING) chain. It is also UDP traffic, and i am sure=
 that
the nat does not work cause cause i can see the not-natted traffic on anoth=
er
machine (where the packets get dropped by the firewall).
I am also able to log this traffic in the POSTROUTING chain of table mangle=
, if
i try to log them in POSTROUTING of the nat table, they don't get there.
But, this does not occur with all connections, some are natted correctly.

--arne



_________________________________________________
Versendet =FCber Webmail der HAW Hamburg
http://www.haw-hamburg.de/webmail



