From: Corin Langosch <corinl@gmx.de>
Subject: netmeeting ?
Date: Sun, 16 Jun 2002 19:54:15 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <17729088316.20020616195415@gmx.de>
Reply-To: Corin Langosch <corinl@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: IP-Tables Maillingliste <netfilter@lists.samba.org>

Hi all,

im behind a iptables firewall and want to be able to accept incomming netmeeting
calls. To make things simple I added the following rules:

$IPTABLES -t nat -A PREROUTING -p tcp --dport ! 80 -j DNAT --source 217.229.94.141 --to 192.168.1.3
$IPTABLES -t nat -A PREROUTING -p udp --dport ! 80 -j DNAT --source 217.229.94.141 --to 192.168.1.3
$IPTABLES -A FORWARD -p tcp -d 192.168.1.3 --dport ! 80 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d 192.168.1.3 --dport ! 80 -j ACCEPT

unluckily, no incomming calls are detected and the other party gets an error.
other programms like my local ftp server etc. work fine, this means the
rules are correct.

can anyone help me please ?

thanks,
Corin


