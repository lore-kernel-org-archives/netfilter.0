From: Lopsch <lopsch@lopsch.com>
Subject: Re: valid INPUT/OUTPUT rule piece?--> '-p tcp --tcp-flags ACK, FIN
 FIN -j DROP', etc.
Date: Wed, 26 Jan 2005 01:37:57 +0100
Message-ID: <41F6E665.6010000@lopsch.com>
References: <20050126001855.GC15359@spawar.navy.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig20F133BCE50BE6E5E6D4670C"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050126001855.GC15359@spawar.navy.mil>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig20F133BCE50BE6E5E6D4670C
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

seberino@spawar.navy.mil schrieb:
> Please explain these:
>
> $IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,FIN FIN   -j DROP
> $IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,PSH PSH   -j DROP
> $IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,URG URG   -j DROP
> $IPTABLES -t filter -A INPUT -p tcp --tcp-flags ALL     NONE  -j DROP
>
> Do first 3 imply you must send ACK when you send a FIN, PSH or URG?
>
> And does last mean you must set *some* TCP flag always?
>
> CS
>
>
Exactly. The first 3 rules are used for dropping packets which have set
FIN, PSH and URG but without a set ACK-flag. The last one prevents empty
packets (none flag set) to enter your network.
As often such packets are used by portscans it is useful to drop them.
Jason posted a link some time ago with a list of rules to perform tcp
checks http://www.stearns.org/modwall/sample/tcpchk-sample

--

PGP-ID 0xF8EAF138

--------------enig20F133BCE50BE6E5E6D4670C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1-nr1 (Windows XP)

iQIVAwUBQfbmZSXe0Lt4Z4FpAQLF1hAAxGEYGasXyI9FWClldllivYwd9N4gGLbq
N/TsCsagWWseWq2BJNg0+i2Lvy5hes9KJMHhV6tn/O4EGgJzlvJcKvvxwmloutRc
5Yf7GVP2VIsGWUCQE6kKtsyqD5RlHDR3ibKddPOG43GnCI+H3CbGawIAfKMQqbtt
BWFeRwi7awJymynjtKdLhxiUJLAObDyo/pM1S5qk0dAA8EISnDH4SVXsYffgTliB
0ty5hwB+ys9HKdfz/9HOKF1YZdSeJIVFbhX+7LTI2GzT21Evg6A8iirdtjcbkfiG
ArMH16xCQDeHF/WVuD14+6400c2eX3J3czfCeGUFoYWSOZUWjRjBgBj4V51ru2Eb
Zg5pZbp4CO/z8Ko7wSurss2qgZntOKTkPi2DwZIZga5cG3HAGlfKBGZHEetRnqOy
hzlTu/W0nC8OUzcxfY85yWf4/WXMg81yINo0rzBTgCeIs3XW5rFKdyQ9ua0n7XQr
1WYX3TEcX0OoanCqpkcA2ROVHb5OsbRDebTuy+9/MtFYjOc2FCi0NvrimaBoiawp
KQx5K8FENvbWEWbsX1v6faSZ/UP4imx+EDzxzMRU81FUwzbv+1dWJHZIbp0WT7Z8
xRUKm+MmuUA6V9KFQdqJByHpaMZCzEEU2N8YxpCaFRqOdmsIvwaBp3/L6EIog5Zq
OxCSCA+7Loc=
=zAlc
-----END PGP SIGNATURE-----

--------------enig20F133BCE50BE6E5E6D4670C--

