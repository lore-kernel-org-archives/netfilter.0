From: <webman@manfbraun.de>
Subject: RE: Routing LAN to external IP from behind NAT
Date: Fri, 13 Jan 2017 11:15:03 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAAOxsTw+OCwlDkP7laLs0tugBAAAAAA==@manfbraun.de>
References: <F7FF15A4-8565-43D9-985B-5F66DCC224B6@skidrow.la>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F7FF15A4-8565-43D9-985B-5F66DCC224B6@skidrow.la>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 'Jeremy Hansen' <jeremy@skidrow.la>, netfilter@vger.kernel.org

Hello !

I do not understand iptables too deep, ... but some
day, I had the same problem and used this advice:

>Accessing a DNAT sever from the local LAN using the public IP address<
http://www.rigacci.org/wiki/doku.php/doc/appunti/linux/sa/iptables=20

This is in use for my private home LAN, which is not
tooo solid. In case of failure, the dns resolution
fails and my internal nodes are no longer reachable.
I am on rewrite and will use a separate DNS for
internal access.

May be, that helps.
Regards,
Manfred


> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Jeremy Hansen
> Sent: Friday, January 13, 2017 10:15 AM
> To: netfilter@vger.kernel.org
> Subject: Routing LAN to external IP from behind NAT
>=20
> I have a Linux firewall/NAT host on my network port forwarding specific
> ports such as port 80 to a host within the LAN.  This works fine when I=
=E2=80=99m
> connecting from outside of the LAN.  What do I have to do with iptables so
> I can access these things from within the LAN without having to do
> something like fake dns so it uses internal IPs to access these hosts and
> ports?
>=20
> Current ruleset looks like this:
>=20
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> LOG_AND_DROP  all  --  43.229.53.68         0.0.0.0/0
> LOG_AND_DROP  all  --  46.148.18.162        0.0.0.0/0
> LOG_AND_DROP  all  --  159.226.35.207       0.0.0.0/0
> LOG_AND_DROP  all  --  111.224.46.7         0.0.0.0/0
>=20
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:80
> state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:443
> state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:25
> state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:587
> state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:143
> state NEW,RELATED,ESTABLISHED
> ACCEPT     tcp  --  0.0.0.0/0            192.168.10.10       tcp dpt:993
> state NEW,RELATED,ESTABLISHED
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>=20
> Chain LOG_AND_DROP (4 references)
> target     prot opt source               destination
> LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0
> level 4 prefix `HOST DENIED: '
> DROP       all  --  0.0.0.0/0            0.0.0.0/0
>=20
>=20
> Trying to connect to port 80 on the external IP from within the lan
> results in this:
>=20
> telnet www.blah.com 80
> Trying 111.114.34.128...
> telnet: connect to address 111.114.34.128.: Connection refused
> telnet: Unable to connect to remote host
>=20
> Thank you for any help.
>=20
> -jeremy
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


