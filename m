From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: Single IP firewall help...
Date: Fri, 13 Sep 2002 11:05:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209131105.55867.roy@karlsbakk.net>
References: <NABBJOOEOFODEALNMJAJGEFMGLAA.B-Morgan@concentric.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NABBJOOEOFODEALNMJAJGEFMGLAA.B-Morgan@concentric.net>
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
To: Brad Morgan <B-Morgan@concentric.net>, Steve Mickeler <steve@neptune.ca>, Chris Poupart <cpoupart@canada.com>
Cc: netfilter@lists.netfilter.org

ok.

I beleive this should look like this.

                +--------+
         off.ip |        | priv.ip
INTERNET -------+ fw+web +--------- LAN
           eth1 |        | eth0
                +--------+

given your internal IP is 192.168.0.0/16, I'd do it like this


iptables -A INPUT -i eth0 -s 192.168.144.0/16 -j ACCEPT
iptables -A INPUT -i eth1 -d ! 192.168.144.0/16 -p tcp -m multiport --dpo=
rts \
=0922,80,443 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
(some -j DROP/REJECT lines here to filter out what you don't want to log)
iptables -A INPUT -j LOG
iptables -P INPUT DROP

then

iptables -A POSTROUTING -t nat -s 192.168.0.0/16 \
=09-d ! 192.168.0.0/16 -o eth1 -j MASQUERADE


perhaps add some logging in case someone tries to forward through it...

any comments?

roy
--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


