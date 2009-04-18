From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: Learning iptables
Date: Sat, 18 Apr 2009 09:32:58 -0300
Message-ID: <49E9C87A.1030509@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi everyone,

I'm have a avarage-to-good linux knowlegde, but i'm quite noob when it=20
comes about iptables, so i decided to study about.
I'm reading a lot of articles and blogs, and testing some rules, so far=
=20
it's all going well.
Right now i'm running a server with tons of rules written by the admin=20
that worked here before me, and in the policies session of the script=20
i've found theses rules:

    $IPTABLES -P INPUT ACCEPT
    $IPTABLES -P OUTPUT ACCEPT
    $IPTABLES -P FORWARD ACCEPT
    $IPTABLES -F
    $IPTABLES -t nat -F
    $IPTABLES -t mangle -F
    $IPTABLES -X

    $IPTABLES -A INPUT -s $LO_IP -j ACCEPT
    $IPTABLES -A OUTPUT -d $LO_IP -j ACCEPT
    $IPTABLES -A INPUT -s $LAN_IP -j ACCEPT
    $IPTABLES -A OUTPUT -d $LAN_IP -j ACCEPT
    $IPTABLES -A INPUT -s $INET_IP_DIN -j ACCEPT
    $IPTABLES -A OUTPUT -d $INET_IP_DIN -j ACCEPT

    $IPTABLES -P INPUT DROP
    $IPTABLES -P OUTPUT ACCEPT
    $IPTABLES -P FORWARD DROP

Is there any good reason why someone would set an ACCEPT policy for all=
=20
chains first to withdraw some later? What the benefit of doing this?

Sorry about my poor english.

Tks in advance
--=20

*Leonardo de Souza Carneiro*
*Veltrac - Tecnologia em Log=EDstica.*
lscarneiro@veltrac.com.br <mailto:lscarneiro@veltrac.com.br>
http://www.veltrac.com.br <http://www.veltrac.com.br/>
/Fone Com.: (43)2105-5600/
/Av. Higien=F3polis 1601 Ed. Eurocenter Sl. 803/
/Londrina- PR/
/Cep: 86015-010/

=09

