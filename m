From: Michael Gale <mgale@utilitran.com>
Subject: What does RELATED and ESTABLISHED really mean.
Date: Tue, 9 Dec 2003 08:39:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209083954.0b7aa4c0.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hello,

	I have been reading many netfilter documents and books, they all talk about related and established connections. To use them for FTP connections and to simplify rule sets.

But none explain exactly what an ESTABLISHED or RELATED connection is ?

Here are my definitions ... please let know if these are correct :)

ESTABLISHED - This allows return packets from a connection and all proceeding packets.

Example -- you have a web server on the DMZ network.
you have the following iptables rules.

$IPT -t nat -A POSTROUTING -i $EXT_FACE -d X.X.X.X -j SNAT --to-destination 172.16.0.5

$IPT -A FORWARD -i $EXT_FACE -o $DMZ_FACE -d 172.16.0.5 -p tcp --sport 1024:65535 --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPT -A FORWARD -i $DMZ_FACE -o $EXT_FACE -s 172.16.0.5 -p tcp --sport 1024:65535 --dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT

This only allow a tcp connection to be setup between a out side client and a web server on the DMZ. It also only allows the web server to respond to a TCP connection on port 80 and does NOT allow the web server to initiated a outgoing TCP connection.

If I used related it would allow the web server to make a out going TCP connection to the server that made the initial inbound connection  ?

Sorry -- I hope I explained this well.

-- 
Michael Gale
Network Administrator
Utilitran Corporation

