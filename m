From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: what is the '-m' flag?
Date: Tue, 02 Jun 2009 17:23:22 -0300
Message-ID: <4A258A3A.8080200@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

what the '-m' flag does in iptables? i'd search google and read the=20
manual, but did not found anything.

a old script running in a firewall of my network have some rules like t=
hese:
iptables -A PREROUTING -p udp -m udp -d $inet_ip -i eth0 --dport 8282 -=
j=20
DNAT --to-destination 192.168.1.102

tks in
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

