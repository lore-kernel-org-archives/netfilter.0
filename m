From: Pablo Allietti <pablo@lacnic.net>
Subject: POP3 Forwarding ok or not.
Date: Tue, 18 Jan 2005 16:58:58 -0300
Message-ID: <20050118195858.GD27505@omega.lacnic.net.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi people. 


i have a question..

my net is 


		|200.40.228.64/28
		|
		Firewall FC2 (200.40.229.67)
		|	dns midomain.com
		|
		|192.168.1.0/24
-------------------------------
    |
    |
    |
FC2 (pop3) 192.168.1.6


i need to check mail in midomain.com but the pop3 server and mail server
is in 192.168.1.8

is that correct to check and send mail?

iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.6 --dport
110 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 0/0 -d 192.168.1.6 --dport  
25 -j ACCEPT


or need another rule?


i need to do. all traffic in port 110 or 25 forwarded to check in
192.168.1.8 






