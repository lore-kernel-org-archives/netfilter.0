From: Nick <fenderflames@yahoo.com>
Subject: FORWARD question
Date: Thu, 20 Nov 2003 12:27:17 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031120202717.74020.qmail@web40803.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everyone,

I have a question about PREROUTING and FORWARD.

I use those rules(amongst others) to reach the FTP
server on the LAN:

 $IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP -i
ppp0 --dport 21 -j DNAT --to $FTPSRVIP 

 $IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
$FTPSRVIP--dport 21 -m state --state NEW -j ACCEPT
$IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
$FTPSRVIP--dport 20 -j ACCEPT
$IPTABLES -A FORWARD -i ppp0 -o $LAN_IFACE -p tcp -d
$FTPSRVIP--dport 1024:65535 --sport 1024:65535 -j
ACCEPT 

Does this mean that all traffic coming from the
internet for ports 1024:65535 will be forwarded
towards the FTP server ports 1024:65535 ? 

What about traffic for ports 1024:65535 that should go
to other clients on the LAN ? Is it going to be
forwarded to the FTP server as well ? If yes, how
could I forward only FTP traffic to the FTP server ? 

I hope I make sense. Thanks for any help

__________________________________
Do you Yahoo!?
Free Pop-Up Blocker - Get it now
http://companion.yahoo.com/

