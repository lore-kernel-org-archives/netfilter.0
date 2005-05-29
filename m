From: "it clown" <suse@mailbox.co.za>
Subject: ftp server
Date: Sun, 29 May 2005 10:44:04 +0200
Message-ID: <web-768144019@mail01.infosat.net>
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

Hi All,

I have a ftp server running on the box connected to the
internet with iptables. I would like to allow ftp passive
connections.I have done the following and it does not want
to work:

iptables -A INPUT -p tcp --sport 21 -m state --state
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --sport 1024: --dport 1024: -m
state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m
state --state ESTABLISHED,RELATED -j ACCEPT

I have done the following and it works but it is not
passive:

iptables -A INPUT -p tcp -m multiport --dport 20 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dport 21 -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j
ACCEPT

What are the best rules to allow ftp passive connections?

I also did load ip_conntrack_ftp.

Thanks
Regards
_____________________________________________________________________
For super low premiums, click here http://www.dialdirect.co.za/quote

