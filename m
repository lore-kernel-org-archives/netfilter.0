From: Eric Leblond <eleblond@init-sys.com>
Subject: Re: making services invisible
Date: 10 Oct 2002 15:46:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034257577.1589.2.camel@tech004>
References: <3DA57D10.8040904@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DA57D10.8040904@bol.com.br>
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

On Thu, 2002-10-10 at 15:13, Julio Cesar Ody wrote:
> Hello. I'm using Slackware 8.1, kernel 2.4.18 and iptables v1.2.7a. I=20
> blocked external acess to some services using the following rule:
>=20
> iptables -A INPUT -i ! eth0 -p tcp -m multiport --destination-port=20
> <port1>,<port2>,<blablabla> -j REJECT

Use DROP not REJECT, with REJECT you send an ICMP message, so it's
filtered, not close

--=20
=C9ric Leblond
courriel : eleblond@init-sys.com


