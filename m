From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: (no subject)
Date: Fri, 21 Nov 2003 12:52:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019D11@hslex01.hslbz.local>
References: <1069413363.3fbdf3f35886d@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069413363.3fbdf3f35886d@paris-hme1>
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
To: 'skydive' <skydive@megamail.pt>, netfilter@lists.netfilter.org

> now i happen to have a proxy server running on the=20
> same machine as the web server, and i would like to=20
> block incoming traffic to my web server from addresses
> wich are not portuguese. i already got a list of the=20
>=20
> ip ranges and net masks of all autonomous systems=20
> located in portugal. i first tried to accept all those=20
> ip ranges, and then droped all other incoming. what=20
> happens is that proxy will accept connections only=20
> from those ip ranges i accepted initialy ( the=20
> postuguese ones). Let=B4s say i'm trying to connect to=20
> hotmail.com. i won't work since that ip range is not=20
> being accepted.

If I understand this correctly... :

If you don't want to accept IP's that are not from Portugal then you
should put the block in the INPUT chain only.
iptables -P INPUT DROP
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -s <ip/mask> -j ACCEPT
...
iptables -A INPUT -s <ip/mask> -j ACCEPT
Accept everything that has a rule ; drop the rest.
The RELATED,ESTABLISHED rule catches everything you need in addition to
the initial connection.


If you want Squid to connect to hotmail.com for you, it generates
outgoing traffic -> it needs an OUTPUT rule to let it do that.
When you set the default policy of the OUTPUT chain to DROP, it can
cause unexpected results if you don't accept packets coming back from
the server. If set to ACCEPT, you shouldn't need a rule for the OUTPUT
chain to accept.
iptables -P OUTPUT DROP
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 3128 -j ACCEPT

> is there a way to accept connections related with=20
> previous conections made to this machine to por 3128=20
> (squid default port)?

See above.

> i want to accept conections that even if they do not=20
> match with ipranges i'm accepting, they're related=20
> with a previous connection made to the proxy server,=20
> related with proxy port whatever it'll be ;))

The connections are 2 way :
1. from webbrowser to proxy and vv (initital conn. is INPUT)
2. from proxy to webserver and vv (initial conn. is OUTPUT)
You have to write rules for the initial connection, and catch the rest
with "RELATED,ESTABLISHED".

> i'm aware this can not be this easy... but still=20
> believe there is a way out :))

Of course ;-)


Gr,
Rob


