From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: Aren't these connections ESTABILISHED? (2nd take)
Date: Sat, 01 Oct 2005 21:12:33 +0200
Message-ID: <dhmn38$hsk$1@sea.gmane.org>
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

I spend the last weeks doing experiments with iptables but still I have
problems with connections that should be ESTABILISHED but are not.

Postfix does some DNS lookups on the DNS server (69.93.28.254). After a bit,
iptables forget that the connection is ESTABILISHED and DROPs the reply.

My logs are full of dropped packets like these
05:32:33  69.93.28.254 53  myIP 2755  UDP
05:32:33  69.93.28.254 53  myIP 2755  UDP
05:32:53  69.93.28.254 53  myIP 2758  UDP
05:32:53  69.93.28.254 53  myIP 2758  UDP
05:33:13  69.93.28.254 53  myIP 2760  UDP
05:33:13  69.93.28.254 53  myIP 2760  UDP
05:33:34  69.93.28.254 53  myIP 2760  UDP
05:33:34  69.93.28.254 53  myIP 2760  UDP
05:33:34  69.93.28.254 53  myIP 2760  UDP
05:33:34  69.93.28.254 53  myIP 2760  UDP
05:38:08  69.93.28.254 53  myIP 2761  UDP
05:38:08  69.93.28.254 53  myIP 2761  UDP

Here is my ruleset (BTW, I did not test much the "limit SMTP trafic", do you
think that it is correct?)

iptables -F
iptables -X

echo "Default policies"
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

echo "Passthrough for known good trafic"
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT #accept internal connections

echo "Allow only legal connection"
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j LOG --log-level
"debug" --log-ip-options --log-tcp-options --log-prefix 'iptables INPUT
DROP !SYN '
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

echo "Limit smtp traffic"
iptables -I INPUT -p tcp --dport smtp -i eth0 -m state --state NEW -m recent
--set
#iptables -I INPUT -p tcp --dport smtp -i eth0 -m state --state NEW -m
recent --update --seconds 30 --hitcount 4 -j LOG --log-level "debug"
--log-ip-options --log-tcp-options --log-prefix 'iptables INPUT DROP limit
'
iptables -I INPUT -p tcp --dport smtp -i eth0 -m state --state NEW -m recent
--update --seconds 30 --hitcount 4 -j DROP

echo "Exceptions for INPUT"
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A INPUT -p tcp --dport smtp -j ACCEPT
iptables -A INPUT -p tcp --dport pop3 -j ACCEPT
iptables -A INPUT -p tcp --dport imap -j ACCEPT
iptables -A INPUT -p tcp --dport http -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT


-- 
Gioele <dev@gioelebarabucci.com>


