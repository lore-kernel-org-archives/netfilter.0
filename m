From: Kirk <whereisgui@gmail.com>
Subject: =?utf-8?q?Can=E2=80=99t_receive/relay_mail_within_private_networ?=
 =?utf-8?q?k_but_I_can_manually_connect_to_port_25_whithin_the_network?=
Date: Mon, 28 Feb 2005 13:03:30 -0800
Message-ID: <48be50bb05022813034251eb3f@mail.gmail.com>
Reply-To: Kirk <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

I have three machines (Solaris and two Linux servers) behind a
firewall running iptables 1.2.11. The firewall has 4 different public
IP's binded to eth0. Three of the IP's map to the private addresses of
the three servers I mentioned above and those 3 IP's have fully
qualified domain names.  One of the Linux servers is configured to
relay mail for the Solaris box plus it receives mail from the other
Linux server.

The mail server has no problems receiving mail from servers outside
the private network but it can't relay or receive mail generated
within the private network. I find this rather strange since I can
telnet to port 25 from any of the other two servers and manually
submit mail.

I must add that I have no problems connecting to other services within
the private network. The machines can find each other because I have
the real IP addresses in the /etc/hosts file of each server. Also, 
mail works fine once I get all the servers off the firewall and change
the addresses in the /etc/hosts files.  I looked at the Sendmail
config files and there are no hardcoded IP addresses.


Here are the rules for mail from my iptables ruleset file:


:INPUT DROP
:FORWARD DROP
:OUTPUT ACCEPT

# allow all established and related
-A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT  -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#Mail
-A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.2 --dport 25 -j ACCEPT

#NAT
-I POSTROUTING -s 192.168.0.2 -o eth0 -j SNAT --to $MAIL_IP

#Mail
-A PREROUTING -i eth0 -p tcp -d $MAIL_IP  --dport  25 -j DNAT --to
192.168.0.2:25


Any help will be greatly appreciated.
Thanks!

