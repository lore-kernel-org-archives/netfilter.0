From: "John Black" <black@arbbs.net>
Subject: (No subject header)
Date: Mon, 29 Nov 2004 17:00:05 -0600
Message-ID: <41aba9f5.308.7f37.1299399369@arbbs.net>
Reply-To: black@arbbs.net
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


 
I'm trying to setup a connection to port 3389 on a windows
2003 server.

my server 80.1.1.1

public ip address for windows server110.20.30.15

private ip address for windows server 192.168.0.15


is this right:
iptbles -t nat -A PREROUTING -d 80.1.1.1 -p tcp \
--dport 3389   -j DNAT --to 110.20.30.15:2289
iptbles -t nat -A PREROUTING -d 110.20.30.15 -p tcp\
--dport 3389   -j DNAT --to 192.168.0.15:2289

 


