From: tahmeed <qs.tahmeed@gmail.com>
Subject: Re: A replacement for rp_filter with iptables (config help needed)
Date: Fri, 1 Jul 2005 11:47:17 +0600
Message-ID: <ab5428f705063022474352682b@mail.gmail.com>
References: <42C37413.3010504@networker.co.nz>
Reply-To: tahmeed <qs.tahmeed@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C37413.3010504@networker.co.nz>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Simon <dev@networker.co.nz>
Cc: netfilter@lists.netfilter.org

hi,

i am not an expert in iptables - actually am studying it -=20

one thing - what rules did u set for the new chain MYSQL & SPOOF -
unless & untill u set up rules for any NEW chains u create - its not
going to work.



On 6/30/05, Simon <dev@networker.co.nz> wrote:
> Hi There,
>=20
> We are debian sarge with two ethernet cards.. To get eth1 (on a seperate=
=20
> subnet) working correctly, ive had to change=20
> /proc/sys/net/ipv4/conf/eth1/rp_filter to 0. Now i need a simple=20
> solution to protect against spoofing attacks on this interface... I have=
=20
> an example setup, but i want to make sure i have it correct.. can=20
> someone confirm for me?...
>=20
> Note, this was a small script to block the mysql port on the server, but=
=20
> then enable for certain time/ip dynamically by adding/removing chains.
>=20
> iptables -F
> iptables -A INPUT -i lo -j ACCEPT
> iptables -N MYSQL
> iptables -N SPOOF
> iptables -A INPUT -p tcp --dport 3306 -j MYSQL
> iptables -A SPOOF -i eth1 -j SPOOF
> iptables -A INPUT -p tcp --dport 3306 -j REJECT --reject-with tcp-reset
>=20
> Is this correct - or have i got it ALL wrong.
>=20
> Thanks
>=20
> Simon
>=20
>=20


--=20
Happy! If not now never

