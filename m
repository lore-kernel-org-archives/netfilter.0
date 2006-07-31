From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: common FTP+NAT problem
Date: Mon, 31 Jul 2006 20:03:50 +0200
Message-ID: <44CE4606.9050805@plouf.fr.eu.org>
References: <44CE313A.4040204@ort.edu.uy> <44CE4193.4050603@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE4193.4050603@plouf.fr.eu.org>
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

Pascal Hambourg a =E9crit :
>=20
> # that's for the first packet of a control connection
> $_fwd -i $INT_IF -s $INT_NET -o $INET_IF -p tcp --sport 1024: \
>   --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT

Copy/paste error : ESTABLISHED is unnecessary - but won't harm.

