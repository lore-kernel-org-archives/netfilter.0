From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: DHCP and Ident
Date: Sat, 10 Jul 2004 16:12:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040710141220.GA22967@itstud.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi

I've been thinking for some time now about the rules needed to allow the
firewallbox to receive its public IP from a DHCP-server but everywhere I
look it's done in different ways.

My first thought was to open up for the DHCP-request in the OUTPUT-chain
(all policies DROP) and let netfilters connection-tracking abilities
take care of the rest. Like this:

iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEP=
T
iptables -t filter -A INPUT -i $WAN -p UDP --dport 67 --sport 68 -j ACCEP=
T

But then I realised that since I don't have a source or destination
address netfilter will probably not be able to track the connection.

On the net I found this:
$IPTABLES -A OUTPUT -o eth1 -p tcp -s 0.0.0.0/32 --sport 67 \
	-d 255.255.255.255/32 --dport 68 -j ACCEPT
$IPTABLES -A OUTPUT -o $internal_int -p udp -s $internal_ip --sport 67 \
	-d 255.255.255.255 --dport 68 -j ACCEPT

$IPTABLES -A INPUT -i $internal_int -p tcp --sport 68 --dport 67 -j ACC\E=
PT
$IPTABLES -A INPUT -i $internal_int -p udp --sport 68 --dport 67 -j ACCEP=
T

Looks a bit much I think. Also found this:

$IPTABLES  -I INPUT -i $LAN_IFACE -p udp --dport 67:68 --sport \
	67:68 -j ACCEPT

But this opens two ports and the only protocol I know of that uses two
ports is FTP, so If someone could give me some hints I'd be happy.


I was also wondering if about Ident, today I use it only when connecting
to IRC-servers and have port 113 forwarded to the computer running the
IRC-client but this solution is not so good if another computer on my
network should have a need of Ident. So I was wondering: If I install an
Identd on my firewallbox and let it take care of requests would it work,
considering that the connection does not origin from the firewallbox?

Thanks for your time.

--
Erik Wikstr=F6m

