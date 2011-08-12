From: "J. Zeidler" <jonatan_zeidler@gmx.de>
Subject: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Fri, 12 Aug 2011 11:26:52 +0200
Message-ID: <4E44F1DC.3090605@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

English:

Hello,

I use a SSH-tunnel with Putty on Ubuntu 11.04. I want to achieve, that=20
the network traffic over a specific port is redirected over the tunnel.=
=20
I need this because of a strict firewall, which i can not configure. th=
e=20
tunnel runs on localhost:9999. i can use this as proxy with firefox, so=
=20
the tunnel works. i tried this without success:

iptables -A OUTPUT -t nat -p udp -d 65.18.193.12 -j DNAT --to 127.0.0.1=
:9999

Can anybody help?

Thanks,
Jonius


German/Deutsch:

Ich nutze einen SSH-Tunnel mithilfe von Putty auf Ubuntu 11.04. Ich=20
m=F6chte mit iptables erreichen, dass der ausgehende Netzwerkverkehr au=
f=20
bestimmten Ports =FCber diesen Tunnel umgeleitet wird, um eine strenge=20
=46irewall zu umgehen, die ich nicht konfigurieren darf. Der Tunnel l=E4=
uft=20
auf localhost:9999. Mit Firefox kann ich diesen als Proxy nutzen, er=20
funktioniert also. Ich habe es beispielsweise damit erfolglos versucht:

iptables -A OUTPUT -t nat -p udp -d 65.18.193.12 -j DNAT --to 127.0.0.1=
:9999

Kann mir jemand dabei helfen?

Danke im Voraus,
Jonius
