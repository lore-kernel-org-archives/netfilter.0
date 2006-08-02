From: Mikhail <misha@mhsystems.com>
Subject: Conntrack for related service
Date: Wed, 02 Aug 2006 15:47:33 -0400
Message-ID: <012501c6b66c$7f60a080$4764a8c0@mhsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Hello,

I have a small network of Windows boxes behind Linux firewall/router. I run
Debian Sarge 3.1 without X there. I have a server on the LAN that serves
clients from the Internet over RMI connection on the certain port. RMI is
basically connection-oriented TCP/IP protocol. I do DNAT for such requests
to that local server. All is working fine so far.

 Problem: those clients from the Internet need direct access to the MS SQL
server over TCP/IP on the different port. I want to open and DNAT MS SQL
port dynamically - if client already has ESTABLISHED connection over RMI
port I want allow access to MS SQL port, otherwise I'd like to drop the
request. If the client got disconnected over RMI then it is OK to reject
direct requests from him to MS SQL thereafter. How can this be accomplished
with iptables?



