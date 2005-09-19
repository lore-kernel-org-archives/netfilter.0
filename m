From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Help creating a RULE
Date: Sun, 18 Sep 2005 23:32:32 -0400
Message-ID: <65aa6af905091820322515a0b0@mail.gmail.com>
References: <CBF2220F040BC54584E69D569377DC4D41698F@smg-mail.summitmedia.com.ph>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <CBF2220F040BC54584E69D569377DC4D41698F@smg-mail.summitmedia.com.ph>
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

There are many things you have to consider (IPs and routing)... but:

iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport http -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport smtp -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p udp --dport smtp -j ACCEPT

# FTP? I'd rather allow ssh and then you can use sftp... what do you
think, rob0?
# one way or another, if you are masquerading, active plain FTP won't work.

iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

On 9/18/05, Jojo Solis <jojo.solis@summitmedia.com.ph> wrote:
> Hi Everyone,
>=20
>=20
> We have firewall with 3 LAN Card, Eth0 is connected to my LAN, eth1 is
> Connected to Internet, and eth2 is connected to our Sister companies
> WAN.
>=20
> Since I am new to IPtables i dont know how to create a Rule to make the
> packet successfully reach its destination. This setup was made by a
> former sysad but left the firewall especially the connection going to
> the Sister Companies WAN un-configured. So that's the reason why Im here
> to seek help creating a rule for this firewall.
>=20
> Basically I want to achive the following.
>=20
> 1. Allow any IN and OUT traffic from eth0 to eth2 and vice versa.
> 2. Allow IN and OUT http traffic from eth0 to eth1.
> 3. Allow IN and OUT SMTP traffic from eth0 to eth1.
> 4. Allow Outgoing FTP traffic from eth0 to Eth1, Plus allow ESTABLISHED
> and RELATED FTP connection.
>=20
>=20
> Thanks,
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>

