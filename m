From: Jason Opperisano <opie@817west.com>
Subject: Re: open https port outbound
Date: Fri, 21 Jan 2005 08:29:53 -0500
Message-ID: <1106314193.5024.86.camel@hubcap.ljm.dom>
References: <41F0E562.2080801@inteli.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41F0E562.2080801@inteli.com.br>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

On Fri, 2005-01-21 at 06:20, Jose Horacio Mello de Jesus wrote:
>     I need open a https connection for internet external access in=20
> specific port.
>=20
>     For example https://host:1234.
>=20
>     Tank's...
>=20
>     Hor=C3=A1cio.

it would be defined just like any other outbound rule:

  iptables -A OUTPUT|FORWARD -p tcp --dport 1234 -j ACCEPT

if you trying to enforce that the traffic over port 1234 is actually
HTTP over SSL; then you would need to proxy port 1234 to an SSL-aware
HTTP proxy; such as squid, and add port 1234 as an SSL port.  in squid
this would be:

  acl SSL_ports port 443 563 1234

-j

--
"Fame was like a drug. But what was even more like a drug were
 the drugs."
	--The Simpsons


