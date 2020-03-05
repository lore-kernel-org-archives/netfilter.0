From: Franz Schneider <Franz.Schneider@dbi-gruppe.de>
Subject: LXD Container can't access trough host address
Date: Thu, 5 Mar 2020 10:05:15 +0000
Message-ID: <da76e7bbb1ee4a078bffd4eca8d18b17@EXC-APU.DBI.local>
References: <f162312f48aa46788de6ab6de8e1b305@EXC-APU.DBI.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f162312f48aa46788de6ab6de8e1b305@EXC-APU.DBI.local>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everyone,

we are trying to implement a server with various lxd container.

Nftables seems to stop packets from container to container, over the host I=
P:Port.
It is crucial that the container can contact each other over the main IP.


table ip my_nat {
=A0 chain my_prerouting {
=A0=A0=A0 type nat hook prerouting priority -100;
=A0=A0=A0 tcp dport{ http, https } dnat 192.168.22.3
=A0=A0=A0 tcp dport{ 8888} dnat 192.168.22.6:80
=A0=A0=A0 tcp dport{ 8889} dnat 192.168.22.6:443
=A0 }

=A0 chain my_postrouting {
=A0=A0=A0=A0=A0=A0=A0 type nat hook postrouting priority 0; policy accept;
=A0=A0=A0=A0=A0=A0=A0 oifname "eno1" masquerade
}
}

eno1 is the host port.
lxdbr0 is the bridge port to all container - 192.168.22.0/24
ping works from all sites to another - curl doesn't.

Thank you in advance.

With best regards

Franz Schneider
