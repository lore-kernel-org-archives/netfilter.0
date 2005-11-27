From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: dual/triple adsl router natting problem
Date: Sun, 27 Nov 2005 12:58:18 +0100
Message-ID: <000001c5f349$db5b40c0$0101000a@sterenborg.info>
References: <4387B351.00000C.03940@OFICINA>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4387B351.00000C.03940@OFICINA>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org scribbled on :

> Hi, sorry for my bad english, i=B4m trying to share 2 adsl line in a =
lan
> conected to one AP with 15 clients, but i can=B4t. I=B4m using
> Fedora Core 3 with a few lines scripts with one adsl line:
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
> iptables --flush
> iptables --table nat --flush
> iptables --table nat --append POSTROUTING --out-interface
> ppp0 -j MASQUERADE
> iptables --append FORWARD --in-interface eth0 -j ACCEPT
>=20
> service named start

So you're starting the DNS server. What about the firewall script ?

> I need to include in this script the other adsl because the
> clients are webing very slow.

It's not quite as simple as what you have above (having never done it
before I can't tell you exactly how difficult it will be).

Please look here (Google is your friend) :
http://www.ssi.bg/~ja/nano.txt
http://lartc.org/howto/lartc.rpdb.multiple-links.html
http://linux-ip.net/html/adv-multi-internet.html
http://lists.suse.com/archive/suse-linux-e/2003-Jul/1136.html

It seems you need to patch the kernel for some solutions :
http://www.ssi.bg/~ja/#routes


Gr,
Rob


