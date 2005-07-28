From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: Re: ESTABILISHED connections are not that estabilished
Date: Thu, 28 Jul 2005 11:52:15 +0200
Message-ID: <dca9si$kis$1@sea.gmane.org>
References: <dc8blc$p5s$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

Gioele Barabucci wrote:
> In my logs I often find reports of dropped input packets from my DNS:53 or
> dropped output packets generated from localhost:25 to other mail servers.
> Why are these packets dropped?
I attach my simple iptables rules

  iptables -F
  iptables -X
  
  echo "Default policies"
  iptables -P INPUT DROP
  iptables -P OUTPUT DROP
  iptables -P FORWARD DROP # just for fun, I don't do any routing
  
  echo "Exceptions for OUTPUT"
  iptables -A OUTPUT -o lo -j ACCEPT
  iptables -A OUTPUT -p udp --dport nameserver -j ACCEPT
  iptables -A OUTPUT -p tcp --dport nameserver -j ACCEPT
  iptables -A OUTPUT -p tcp --dport smtp -j ACCEPT
  iptables -A OUTPUT -p icmp -j ACCEPT
  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  
  echo "Exceptions for INPUT"
  iptables -A INPUT -i lo -j ACCEPT
  iptables -A INPUT -p tcp --dport ssh -j ACCEPT
  iptables -A INPUT -p tcp --dport smtp -j ACCEPT
  iptables -A INPUT -p tcp --dport pop3 -j ACCEPT
  iptables -A INPUT -p tcp --dport imap -j ACCEPT
  iptables -A INPUT -p tcp --dport http -j ACCEPT
  iptables -A INPUT -p icmp -j ACCEPT
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  
  echo "Logging"
  iptables -A INPUT -m limit --limit 3/second --limit-burst 5 -i ! lo -j LOG
--log-level "debug" --log-ip-options --log-tcp-options --log-prefix
'iptables INPUT DROP '
  iptables -A INPUT -m limit --limit 3/second --limit-burst 5 -i ! lo -j
ULOG --ulog-prefix 'iptables INPUT DROP '
  iptables -A OUTPUT -m limit --limit 3/second --limit-burst 5 -o ! lo -j
LOG --log-level "debug" --log-ip-options --log-tcp-options --log-prefix
'iptables OUTPUT DROP '

  echo "REJECT for outgoing packets"
  iptables -A OUTPUT -j REJECT # reject, don't DROP outgoing packets


-- 
Gioele <dev@gioelebarabucci.com>


