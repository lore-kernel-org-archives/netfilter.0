From: Marcin <slacklist@op.pl>
Subject: Counting traffic - another question
Date: Tue, 27 Jul 2004 14:34:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1304297675.20040727143400@op.pl>
Reply-To: Marcin <slacklist@op.pl>
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

Hi

  I have set of rules that doing upload/download stats for my NATed network
  (10.0.0.0/8):

  # Marking
  $IPTABLES -t mangle -A FORWARD -p tcp -j CONNMARK --restore-mark
  $IPTABLES -t mangle -A FORWARD -p tcp -m mark ! --mark 0 -j ACCEPT

  $IPTABLES -t mangle -A FORWARD -p tcp -m ipp2p --ipp2p     -j MARK --set-mark $P2P
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $FTP_PORT    -j MARK --set-mark $FTP
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $SSH_PORT    -j MARK --set-mark $SSH
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $TELNET_PORT -j MARK --set-mark $SSH
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $SMTP_PORT   -j MARK --set-mark $SMTP
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $HTTP_PORT   -j MARK --set-mark $HTTP
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $HTTPS_PORT  -j MARK --set-mark $HTTPS
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $POP3_PORT   -j MARK --set-mark $POP3
  $IPTABLES -t mangle -A FORWARD -p tcp --dport $IRC_PORT    -j MARK --set-mark $IRC

  $IPTABLES -t mangle -A FORWARD -p tcp -j CONNMARK --save-mark

  Rules above (IMO) marks specified trafic traveling through FORWARD
  chain, and this is only traffic from localnet <-> internet, not from
  localnet <-> linuxbox.

  Ok, now i make chains for counting uploads/downloads from/to my
  lan.
  
  $IPTABLES -t mangle -N statsin
  $IPTABLES -t mangle -N statsout

  My internet interface is ppp0 ($INET_IF), and lan is connected to
  eth0 ($LOCAL_IF). So, with rules below I send packets leaving my box
  with ppp0 to statsout chain, and with eth0 to statsin.

  $IPTABLES -t mangle -A POSTROUTING -o $INET_IF  -j statsout
  $IPTABLES -t mangle -A POSTROUTING -o $LOCAL_IF -j statsin

  And here is real counting. Note, that $OTHER is for not marked
  packets.

  $IPTABLES -t mangle -A statsin -m mark --mark $P2P
  $IPTABLES -t mangle -A statsin -m mark --mark $FTP
  $IPTABLES -t mangle -A statsin -m mark --mark $SSH
  $IPTABLES -t mangle -A statsin -m mark --mark $SMTP
  $IPTABLES -t mangle -A statsin -m mark --mark $HTTP
  $IPTABLES -t mangle -A statsin -m mark --mark $POP3
  $IPTABLES -t mangle -A statsin -m mark --mark $IRC
  $IPTABLES -t mangle -A statsin -m mark --mark $OTHER

  $IPTABLES -t mangle -A statsout -m mark --mark $P2P
  $IPTABLES -t mangle -A statsout -m mark --mark $FTP
  $IPTABLES -t mangle -A statsout -m mark --mark $SSH
  $IPTABLES -t mangle -A statsout -m mark --mark $SMTP
  $IPTABLES -t mangle -A statsout -m mark --mark $HTTP
  $IPTABLES -t mangle -A statsout -m mark --mark $POP3
  $IPTABLES -t mangle -A statsout -m mark --mark $IRC
  $IPTABLES -t mangle -A statsout -m mark --mark $OTHER

  Ok, this works fine for me. But there is one thing, that wondering
  me. I want to count only traffic from lan <-> internet. But these
  rules:

  $IPTABLES -t mangle -A POSTROUTING -o $INET_IF  -j statsout
  $IPTABLES -t mangle -A POSTROUTING -o $LOCAL_IF -j statsin

  should also match packets generated on linuxbox destined to lan or
  internet. Is that true? These packets are not marked, so my rules
  count them as $OTHER.

  I dont want count these packets, so I wrote 2 new rules

  $IPTABLES -t mangle -A FORWARD -s 10.0.0.0/8  -j statsout
  $IPTABLES -t mangle -A FORWARD -d 10.0.0.0/8  -j statsin

  but this dont work :(

  So how can I count trafic only from lan <-> internet?



  PS. Yes, I know, my english is  tragic :D
  
-- 
Pozdrawiam
 Marcin                         mailto:slacklist@op.pl


