From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT, SNAT, Portforward
Date: Fri, 1 Nov 2002 01:08:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211010108.18555.netfilter@newkirk.us>
References: <34BE59D9.590F1486.03240133@netscape.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34BE59D9.590F1486.03240133@netscape.net>
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
To: Thomas Meindl <methodaut@netscape.net>, netfilter@lists.netfilter.org

On Thursday 31 October 2002 08:33 pm, Thomas Meindl wrote:
> okey, let's start again for the correct guys out there
> here's my original script which i have testet since two days
> doing all kinds of variations and combinations anyone could think of
> my problem is situated at the PREROUTING chain with DNAT
> I simply want a portforward

{Snip a few dozen lines :^}

> echo "forwarding port 1234 to 192.168.0.2:80.."
> $IPTABLES -t nat -A PREROUTING -p tcp -i $EXTIF -d www.xxx.yyy.zzz  \
> --dport 1234 -j DNAT --to 192.168.0.2:80=20
> $IPTABLES -A FORWARD -p tcp -i $EXTIF -o $INTIF -d 192.168.0.2     \
> --dport 80 -j ACCEPT=20
> $IPTABLES -t nat -A POSTROUTING -p tcp -o $EXTIF -s 192.168.0.2  \
>  --sport 80 -j SNAT --to www.xxx.yyy.zzz:1234

umm.  Have you tried this with "-j DNAT --to-destination"? =20
Also, I think the third rule should go.  In the situation you've outlined=
,=20
Netfilter should handle the reversal of your DNAT operation automatically=
=2E
Wouldn't "$IPTABLES -A FORWARD -p tcp -d 192.168.0.2 --dport 80 -j ACCEPT=
" be=20
sufficient for forwarding?

> echo "allow all connections out and only existing and related ones in..=
"
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state  \
> --state ESTABLISHED,RELATED -j ACCEPT=20
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG --log-prefix "FIREWALL (FORWARD Chain): "
>
> echo "enabling snat (masquerade) functionality on $EXTIF.."
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Question to list:  At what point in its own travels does the returning pa=
cket=20
get automatically un-DNATed?  Prerouting again?

j

