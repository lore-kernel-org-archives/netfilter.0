From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: FTP server behind a load balancer
Date: Sun, 7 Nov 2004 10:12:55 +0200
Message-ID: <1403218a041107001226656b10@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Dear all,
I have two FTP servers behind a load balancer.
Furthermore, those FTP servers, listen on both ports 21, 45 (for some reasons)
I am not using NAT, they have public IPs.
When the client connects from the outside world, to port 21, passive
FTP works fine.
When the client connects to port 45, it doesn't work !!
I did modprobe ipt_conntrack_ftp ports=21,45
But during debugging I noticed something, when working with port 21,
the response of the passive FTP, it returns with the loadbalancer IP
(The IP the client has talked to in the first place), but when talking
to port 45, it returns with the server IP address (The real IP of the
server, not the load balancer), and this causes IPTables to think it
is a new connection, to a random IP.

Should ipt_conntrack_ftp track only the ports, or also the ports and
IPs returned in the response of the FTP server ??
Any clue ?
-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

