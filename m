From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip/snat + port/dnat
Date: Sat, 8 May 2004 10:06:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405081006.35368.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0405072300190.16707-100000@dns.media-lab.com.pl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0405072300190.16707-100000@dns.media-lab.com.pl>
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

On Friday 07 May 2004 10:09 pm, R=F3=BFa=F1ski Sergiusz wrote:

> I need dissable routing to smtp servers, and enable smtp on non-standar=
d
> port. Like this:
>
> -p tcp -s 192.168/16 -dport 25 -j DENY

iptables -A FORWARD -p tcp -s 192.168.0.0/16 --dport 25 -j DROP

> -p tcp -s 192.168/16 --dport 2525 -j TARGET_LIKE_SNAT --to $ext_if --to=
-port
> 25

iptables -A POSTROUTING -t nat -p tcp --dport 2525 -j SNAT --to $extIF:25

> don't change destination ip.
> possible?

Is that what you wanted?

Antony.

--=20
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


