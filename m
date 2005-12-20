From: "ammad" <ammads@khi.comsats.net.pk>
Subject: problem related to  ftp
Date: Tue, 20 Dec 2005 19:31:04 +0500
Message-ID: <000501c60572$04613d50$0100000a@server>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

i have problem and getting this a bug.(may be)

i am using linux box as firewall+forwarding clients requests to internet. my
problem is that a server of windows ftp2003,  and clients are unable to
browse ftp site, while they are able to connect any linux base ftp server on
net. i am also using squid. all of that there isn't any restriction in squid
or iptables.
i can connect from linux box  to windows 2003 ftp server.
i flushed all rules, deleted all chains. and default policy to ACCEPT.

and atleast i used this rule but still getting error from client side, when
i check on client
c:\> netstat -a
 tcp   172.16.0.22:1044             202.145.23.3:ftp          SYN_SENT


and at least  connection time  out
i am using these two rules only (two)

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 21 -j ACCEPT


