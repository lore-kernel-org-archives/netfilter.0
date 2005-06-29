From: Vlad Janicek <vladjanicek@gmail.com>
Subject: Re: whats wrong???
Date: Tue, 28 Jun 2005 21:09:49 -0400
Message-ID: <96bc76cf0506281809239e7d3c@mail.gmail.com>
References: <42C17D6F.70709@adinet.com.uy>
	<96bc76cf05062810322e6ffcbd@mail.gmail.com>
	<42C1913F.1000806@adinet.com.uy>
Reply-To: Vlad Janicek <vladjanicek@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C1913F.1000806@adinet.com.uy>
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
To: netfilter@lists.netfilter.org

2005/6/28, Juan Manuel Tato <madness@adinet.com.uy>:=20
>=20
> # Policies.
> #
> $IPT -P INPUT ACCEPT
> $IPT -P OUTPUT ACCEPT
> $IPT -P FORWARD ACCEPT


You usually drop everything first, then you open each port and service one=
=20
by one
Normalmente cierras todo primero, despues es que abres cada puerto y=20
servicio=20

echo 1 > /proc/sys/net/ipv4/ip_forward
>=20
> $IPT -t nat -A POSTROUTING -o $INT -j SNAT --to pub.lic.ip.addr
>=20
> # This rule protects your fowarding rule.
> $IPT -A FORWARD -i $INT -m state --state NEW,INVALID -j DROP


remove this for testing
quita esto para probar

# defino la ip de mi servidor interno
> SRV=3D" 192.168.100.1 <http://192.168.100.1/>"
>=20
> $IPT -t nat -A PREROUTING -i $INT -p tcp --dport 25 -j DNAT --to
> 192.168.100.1:25 <http://192.168.100.1:25/>
> $IPT -t nat -A PREROUTING -i $INT -p tcp --dport 53 -j DNAT --to $SRV=20
> $IPT -t nat -A PREROUTING -i $INT -p udp --dport 53 -j DNAT --to $SRV
> $IPT -t nat -A PREROUTING -i $INT -p tcp --dport 110 -j DNAT --to $SRV
> $IPT -t nat -A PREROUTING -i $INT -p udp --dport 110 -j DNAT --to $SRV=20
> $IPT -t nat -A PREROUTING -i $INT -p tcp --dport 80 -j DNAT --to
> 192.168.100.1:80 <http://192.168.100.1/>
> $IPT -t nat -A PREROUTING -i $INT -p udp --dport 80 -j DNAT --to
> 192.168.100.1:80 <http://192.168.100.1/>
> $IPT -t nat -A PREROUTING -i $INT -p tcp --dport 143 -j DNAT --to $SRV
> $IPT -t nat -A PREROUTING -i $INT -p udp --dport 143 -j DNAT --to $SRV


 what if you tried something like this for external packets looking for a=
=20
system inside:
que si intentas algo como esto para el ruteo interno de paquetes externos:

iptables -A FORWARD -d your_lans_server_ip -p tcp --dport 110 -j ACCEPT
iptables -t nat -A PREROUTING -d your_external_nic -p tcp --dport 110 \
-j DNAT --to-destination your_lans_server_ip:110

--=20
Vlad
