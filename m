From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Help with Iptables Tutorial and Port Forwarding/NAT
Date: Thu, 11 Mar 2004 17:33:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56791EF@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: arif <djreef@yahoo.com>, netfilter@lists.netfilter.org

arif wrote:
> Hi, I am having a hard time trying to figure out why
> any packets I am trying to forward to my internal
> network are being dropped. I am using the
> 'rc.firewall' file that is included in the 'Iptables
> Tutorial'
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html=20
>=20
>=20
> Everything is fine, except I can't get any packets to
> forward to an internal webserver here. I am using this
> line:
>=20
>=20
> /sbin/iptables -t nat -A PREROUTING --dst 1.2.3.4 -p
> tcp --dport 80 -j DNAT --to-destination 10.0.0.3:80
>=20
> When I look at the packet count doing iptables -t nat
> -L -v I can see the packet count go up on that rule,
> every time i try and connect to port 80. But in my
> logs, I see that it matched a logging rule, and shows
> up as 'IPT FORWARD packet died", so i guess it is
> ending prematurely in the forward chain? Any help
> would be greatly appreciated!!! THANKS!!!

NATing does not bypass the filter rules. So, insert this:

iptables -A FORWARD --destination 10.0.0.3 -p tcp --dport 80 -j ACCEPT
=20
>=20
> __________________________________
> Do you Yahoo!?
> Yahoo! Search - Find what you're looking for faster
> http://search.yahoo.com=20

