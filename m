From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: use of -m  limit for Syn Flood protection
Date: Sun, 15 Oct 2006 14:24:31 +0200
Message-ID: <4532287F.2040407@plouf.fr.eu.org>
References: <4530E332.4090306@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4530E332.4090306@eccotours.co.za>
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

Brent Clark a =E9crit :
>=20
> # we allow 4 TCP connects per second, no more
> $IPT -N syn-flood
> $IPT -A syn-flood -m limit --limit 1/s --limit-burst 4 -j LOG=20
> --log-level info --log-prefix '#### Syn Flood ####'
> $IPT -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
> $IPT -A syn-flood -j DROP

This accepts only 1 packet per second after an initial 4-packet burst,=20
and it logs *accepted* packets, not dropped ones. I am not sure this is=20
what you want.

You probably want something like this instead, assuming there is an=20
ACCEPT rule later that matches these packets in the calling chain :

$IPT -N syn-flood
$IPT -A syn-flood -m limit --limit 4/s --limit-burst 4 -j RETURN
$IPT -A syn-flood -j LOG --log-level info \
   --log-prefix '#### Syn Flood ####'
$IPT -A syn-flood -j DROP

You may also want to set a rate limit in the LOG rule not to prevent SYN=20
flood but to prevent log flood. ;-)

