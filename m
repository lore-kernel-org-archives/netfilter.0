From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: iptables problem with rules
Date: 28 Jun 2002 18:04:24 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628180424.29924.qmail@webmail5.rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org
Cc: acearns@yahoo.com

hello group,
  i am graduate student at colorado university. i am
  working on setting up a testbed for studying the
  Denial Of Service kinds of attacks. i am using IDS
  tool snort to detect any intrusion.  once i get the
  information that there is an attack i want to limit
  the # of packets based on the type of protocol used
  in the attack(say limit icmp packets if its a icmp
  ping flooding) one way to acheive QOS inspite of a
  DOS attack is to limit the # of packets comming in
  from the attacker.

  i have used iptables rules like

#Syn-flood protection:
  iptables -A FORWARD -s a.b.c.d -p tcp --syn -m
  limit --limit 1/s -j ACCEPT

  #port scan protection:
  iptables -A FORWARD  -s a.b.c.d -p tcp --tcp-flags
  SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

# Ping of death:

  iptables -A FORWARD  -s a.b.c.d -p icmp
  --icmp-type echo-request -m limit --limit 1/s -j
  ACCEPT


the rule doesn't help to stop the packets

i tried the following rule it helps me to stop the ping flood 
attack

  iptables -A INPUT  -s 128.198.60.195 -p icmp
  --icmp-type echo-request -m limit --limit 1/s -j
  ACCEPT
  iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

  iptables -A INPUT -s a.b.c.d -p tcp --syn -m
  limit --limit 1/s -j ACCEPT

  iptables -A INPUT -s a.b.c.d -p tcp --syn -j DROP

  iptables -A INPUT  -s a.b.c.d -p tcp --tcp-flags
  SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT

  iptables -A INPUT  -s a.b.c.d -p tcp --tcp-flags
  SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT


i am able to succesfully limit the ping traffic but when i do the 
same with syn flood/port scan using nmap it doesn't limit the # of 
packets

can anyone tell me whats wrong with the rules.

thanks for your time

Thanks
ganesh



_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


