From: "Lewis Shobbrook" <lshobbrook@fasttrack.net.au>
Subject: RES=0x00 ACK FIN URGP=0
Date: Mon, 20 Oct 2003 11:38:08 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C8098CA7F09CE419F0C2B68EB8358765F29@exchange.fasttrack.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hi All,

Following the FAQ, I'm looking to find some help in the mail list in
regard to the RES=3D0x00 ACK FIN URGP=3D0 entries in the system log.  =
I'm
using a 2.4.20 kernel from debian source, with most modules including
contrack/s compiled in.  The entries are arising in relation to web
traffic that always sourced from the web server outbound on the forward
chain.

I have the follwing entries in the iptables start script....

iptables -A INPUT -i $ext_ethernet -p tcp --dport 80 -d $web_server -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $ext_ethernet -o $dmz_ethernet -p tcp --dport 80
-d $web_server -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o $dmz_ethernet -p tcp --dport 80 -d $web_server -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i $dmz_ethernet -p tcp --sport 80 -s $web_server -m
state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -o $ext_ethernet -i $dmz_ethernet -p tcp --sport 80
-s $web_server -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o $ext_ethernet -p tcp --sport 80 -s $web_server -m
state --state ESTABLISHED,RELATED -j ACCEPT

In the past I had a 2.4.18 kernel in a transparent bridged set-up, with
an external router doing the port translations and NAT and had no issues
what so ever with persistent RES=3D0x00 ACK FIN URGP=3D0 entries.

I'm now using a std netfilter configuration to firewall, NAT and mangle.


iptables -t nat -A PREROUTING -i $ext_ethernet -p tcp -d $external_ip
--dport 80 -j DNAT --to $web_server

I have additional rules to restrict port scans and LOG.

iptables -A INPUT -i $ext_ethernet -p tcp --tcp-flags SYN,ACK,FIN,RST
RST -m limit --limit 10/h -j LOG --log-prefix 'PORT SCAN!: '

iptables -A INPUT -i $ext_ethernet -p tcp --tcp-flags SYN,ACK,FIN,RST
RST -m limit --limit 1/s --limit-burst 5 -j ACCEPT

I'm concerned that the dropped packets will reduce the performance of
the web server.

here's the log entry that repeats, that repeats...

Oct 20 11:01:11 fatswan kernel: FORWARD :IN=3Deth2 OUT=3Deth1
SRC=3Dxxx.xxx.xxx.xxx DST=3Dxxx.xxx.xxx.xxx LEN=3D40 TOS=3D0x00 =
PREC=3D0x00
TTL=3D127 ID=3D60618 DF PROTO=3DTCP SPT=3D80 DPT=3D2698 WINDOW=3D17225 =
RES=3D0x00 ACK
FIN URGP=3D0

Can anyone suggest a fix for this, or tell me that were talking 5
milliseconds/minute?

Cheers,

Lewis Shobbrook

