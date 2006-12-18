From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Mon, 18 Dec 2006 23:50:25 +0100
Message-ID: <45871B31.90700@plouf.fr.eu.org>
References: <45860240.2040102@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45860240.2040102@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Grant Taylor a =E9crit :
>=20
> I personally have known that using "-m state --state=20
> ESTABLISHED,RELATED" was not the most secure thing to use for returning=
=20
> traffic.  Namely this will allow you to make a valid connection to a we=
b=20
> server, say to retrieve a picture.  Then said web server could send=20
> malicious traffic back to your computer and pass through your firewall.=
=20
>  This is because the traffic coming from the web server to your compute=
r=20
> is now deemed as RELATED.

I do not agree with this. AFAIK the only traffic that can be labelled=20
RELATED to an HTTP connection or any "simple" TCP or UDP or whatever=20
connection (not special protocols such as FTP) is some ICMP signalling=20
messages. This said, I do filter out some RELATED ICMP types I do not lik=
e.

"Hole punching" is a completely different thing and requires active=20
cooperation from the inside.

