From: ph4ke <deff@sadomain.co.za>
Subject: Re: How to make a computer invisible
Date: Mon, 1 Dec 2003 09:59:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312010959.17547.deff@sadomain.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,=20

maybe i should add my two cents asswell=20

i would say that if you wanna make a node invisible, then just get iptabl=
es=20
to reject everything that tries to initiate a connection.=20

if the host is going to be a firewall, i like to make a bridge, put my=20
iptables rules on it, then take of the IP address of the bridge.

This will make the host invisible, in the sense that no-one will be able =
to=20
connect, but some clever ppl might figure out that something sits between=
=20
them and other hosts.=20


maybe this can help you


--=20
ph4ke

