From: "Roman Medina-Heigl Hernandez" <roman@rs-labs.com>
Subject: Info about iptables performance / stress test tools
Date: Mon, 31 Jan 2005 11:09:13 +0100 (CET)
Message-ID: <11803.194.224.100.28.1107166153.squirrel@www.hosting-seguridad.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello,

I'm looking for documentation about iptables performance. In particular,
I've created some kind of "SNMP/TACACS+ proxy", which is basically an
iptables doing NAT for 161/162-udp and 49/tcp ports, and I need to make
measures of the number of destination "SNMP/TACACS+ hosts" it could
support and the latency penalties involved  when the number of these host=
s
grow. Basically, the (summarized) rules would be:

    # SNMP-Trap
    iptables -A PREROUTING -t nat -p udp -s $cpe -d $proxy --dport 162 -j
DNAT --to $prov
    # SNMP-Get y similares
    iptables -A POSTROUTING -t nat -p udp -s $prov -d $cpe --dport 161 -j
SNAT --to $proxy
    # TACACS+
    iptables -A PREROUTING -t nat -p tcp --dport 49 -s $cpe -d $proxy -j
DNAT --to ${tacacs}:$tacacs_port
    iptables -A POSTROUTING -t nat -p tcp --sport $tacacs_port -s $tacacs
-d $cpe -j SNAT --to ${proxy}:49

These 4 basic rules compose the body of a "for" structure, so the total
number of rules are indeed 4 * <number of CPEs> (CPE=3DHost being accesse=
d
by snmp). Basically I'd need to know the maximum number of CPEs permited
in my machine (1 CPU: Intel(R) Pentium(R) III CPU family 1133MHz ; Memory=
:
512 MB)

Any ideas on how to measure it? Are there any tools (or scripts) to
perform these kind of tests? Based on your experience could you guess som=
e
aproximation (at least the order of the limit: 100, 1000, 10000, etc) of
the number of CPEs that could be supported?

Is there any documents (apart from netfilter source) describing internal
iptables behaviour regarding performance? For instance, when doing NAT,
what's a typical limit for the number of permited entries in NAT internal
tables, etc...

Thanks in advance. Your help will be appreciated.

Regards,
-Roman



