From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Disabling packet fragmentetion
Date: Mon, 30 Jan 2006 19:51:04 +0100
Message-ID: <1138647064.4596.18.camel@anduril.intranet.cartel-securite.net>
References: <082801c625ca$70847bf0$0200a8c0@kari>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <082801c625ca$70847bf0$0200a8c0@kari>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>
Cc: "Netfilter (lista)" <netfilter@lists.netfilter.org>

Le lundi 30 janvier 2006 =E0 15:24 -0300, Alejandro Cabrera Obed a =E9crit =
:
> Where do I have to discard the packet fragmentation in my firewall, using=
 a
> specific iptables rule or in the kernel settings (maybe at
> /proc/sys/net/ipv4) ???

AFAIK, if you use Netfilter conntrack, all IP traffic is defragmented so
your backend network won't see any fragmented packets.

If you really want to drop fragmented packets, you can use proper
iptables switch, as described in manpage:

       [!]  -f, --fragment
              This means that the rule only refers to second and further
              fragments  of fragmented packets. Since there is no way to
              tell the source or destination ports of such a packet (or
              ICMP type), such a packet will not match any rules which
              specify them.  When the "!" argument precedes the "-f"=20
              flag, the rule will only match head fragments, or
              unfragmented packets.

But you don't filter first packet fragment out.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

