From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: Re: ftp port forwarding
Date: Wed, 20 May 2009 17:30:06 -0300
Message-ID: <4A14684E.3000009@veltrac.com.br>
References: <4A145057.7040900@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A145057.7040900@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

and by the way, the script also load the follwing modules:

    /sbin/modprobe ip_conntrack_ftp
    /sbin/modprobe ip_nat_ftp

ip_nat_ftp i assume it's a module that allow doing nat on ftp, but i'm=20
too noob in iptables and still don't now what conntrack is, so, i'm not=
=20
sure if this is have some meaning on this problem or don't.

Leonardo Carneiro escreveu:
> Hi fellows,
>
> i'm having a (very basic and noob) problem.
>
> i have a server on a internal network running a ftp server=20
> authenticating on a ldap backend. the ftp setup is running fine and i=
=20
> can access when i'm on the internal network or over the openvpn link=20
> that links my network with the server network (btw, the openvpn serve=
r=20
> runs on the same machine).
>
> but i need to my users to have access to this service over the=20
> internet. the gateway of that network is a linux box with 2 internet=20
> links. i've put the following rules on the iptables script:
>
>    $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE --dport 2=
1
>    -j ACCEPT
>    $IPTABLES -A FORWARD -p TCP -i $INET_IFACE_DIN -o $LAN_IFACE --dpo=
rt
>    21 -j ACCEPT
>    $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE --dport 2=
0
>    -j ACCEPT
>    $IPTABLES -A FORWARD -p TCP -i $INET_IFACE_DIN -o $LAN_IFACE --dpo=
rt
>    20 -j ACCEPT
>
>
> (INET_IFACE is the interface with the static ip and low bandwitch,=20
> INET_IFACE_DIN is the interface with dynamic ip (and a dynamic dns=20
> running on it) and higher bandwitch.)
>
>    $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $INET_IP
>    --dport 21 -j DNAT --to-destination $FTPSERVER
>    $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE_DIN -d
>    $INET_IP_DIN --dport 21 -j DNAT --to-destination $FTPSERVER
>    $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $INET_IP
>    --dport 20 -j DNAT --to-destination $FTPSERVER
>    $IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE_DIN -d
>    $INET_IP_DIN --dport 20 -j DNAT --to-destination $FTPSERVER
>
>    $IPTABLES -t mangle -A PREROUTING -p TCP -i $LAN_IFACE -s
>    $FTPSERVER/32 --sport 21 -d 0/0 -j MARK --set-mark 1
>    $IPTABLES -t mangle -A PREROUTING -p TCP -i $LAN_IFACE -s
>    $FTPSERVER/32 --sport 20 -d 0/0 -j MARK --set-mark 1
>
>
> (mark 1 send the ftp traffic through the higher bandwitch interface=20
> INET_IFACE_DIN)
>
> i tried to connect over the internet, while running tcpdump on the=20
> ftpserver. the server exchange packets with the client, but do not=20
> stabilish a connection. is there something wrong with the rules?
>
>
>

--=20

*Leonardo de Souza Carneiro*
*Veltrac - Tecnologia em Log=EDstica.*
lscarneiro@veltrac.com.br <mailto:lscarneiro@veltrac.com.br>
http://www.veltrac.com.br <http://www.veltrac.com.br/>
/Fone Com.: (43)2105-5601/
/Av. Higien=F3polis 1601 Ed. Eurocenter Sl. 803/
/Londrina- PR/
/Cep: 86015-010/

=09

