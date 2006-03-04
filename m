From: Davis Sylvester <dsylvesteriii@yahoo.com>
Subject: FTP through Firewall
Date: Sat, 4 Mar 2006 10:47:27 -0800 (PST)
Message-ID: <20060304184727.92357.qmail@web54708.mail.yahoo.com>
Reply-To: dsylvesteriii@yahoo.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I am trying to grant FTP access to Internet customers
to our servers behind our firewall.
When they try to connect they get the following error:

ftp: connect :Unknown error number

I am using the following iptables commands to allow
access.  Our default policy is DENY.

iptables -A FORWARD -m state --state
RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state NEW -i eth4 -o
eth5 -d 1.1.1.2 -p tcp --dport ftp -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -d 208.1.1.1 -p
tcp --dport ftp -j DNAT --to 1.1.1.2


Thanks in advance!


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

