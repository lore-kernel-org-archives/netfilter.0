From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: XMAS and NMAP scanning.... With default rules dropping all packets
Date: Thu, 14 Nov 2002 13:58:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211141358.12938.netfilter@newkirk.us>
References: <39778BFB9C25BA429794B15B50AEC78104EAA0@server-dcms>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39778BFB9C25BA429794B15B50AEC78104EAA0@server-dcms>
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
To: Didier Hung Wan Luk <DidierH@frci.net>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Saturday 14 December 2002 04:09 am, Didier Hung Wan Luk wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi people,
>
> I was wondering whether I really need to include these rules if I am
> already using a default rule of DROP for INPUT, OUTPUT and FORWARD
> chains.
>
> Default rule:-
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>
> Do I really need these rules? To protect me from these scans..
>
> iptables -I FORWARD -p tcp --tcp-flags ALL ALL -j DROP
> iptables -I INPUT -p tcp --tcp-flags ALL ALL -j DROP
>
> #nmap NULL-Packets drop
> iptables -I FORWARD -p tcp --tcp-flags ALL NONE -j DROP
> iptables -I INPUT -p tcp --tcp-flags ALL NONE -j DROP

It depends on the construction of your ACCEPT rules, but probably yes. =20
If a packet arrives that matches one of these, and it would also match=20
an ACCEPT rule in the same chain, then removal of these rules will allow=20
it through.  These drops would need to be first, or at least very early,=20
in your chain as well.

j

