From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Conntrack for related service
Date: Thu, 3 Aug 2006 18:03:46 +0200 (CEST)
Message-ID: <49345.6398872242$1154621127@news.gmane.org>
References: <012501c6b66c$7f60a080$4764a8c0@mhsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <012501c6b66c$7f60a080$4764a8c0@mhsystems.com>
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
To: Mikhail <misha@mhsystems.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Mikhail">
> Hello,
>
> I have a small network of Windows boxes behind Linux firewall/router. I
> run
> Debian Sarge 3.1 without X there. I have a server on the LAN that serves
> clients from the Internet over RMI connection on the certain port. RMI is
> basically connection-oriented TCP/IP protocol. I do DNAT for such requests
> to that local server. All is working fine so far.
>
>  Problem: those clients from the Internet need direct access to the MS SQL
> server over TCP/IP on the different port. I want to open and DNAT MS SQL
> port dynamically - if client already has ESTABLISHED connection over RMI
> port I want allow access to MS SQL port, otherwise I'd like to drop the
> request. If the client got disconnected over RMI then it is OK to reject
> direct requests from him to MS SQL thereafter. How can this be
> accomplished
> with iptables?

Should be possible using reject. Something along these lines.

-A FORWARD -m state RELATED,ESTABLISHED -j ACCEPT
# Maybe you restrict this more, for now accept RMI from everywhere
-A FORWARD -p tcp -dport $rmiport -j RMI
-A FORWARD -p tcp -dport $mssql -j MSSQL
... other rules ...

-A RMI -p tcp --tcp-flags FIN FIN -j RMIFIN
-A RMI -m recent --name rmi --set
-A RMI -j ACCEPT
-A RMIFIN -m recent --name rmi --remove
-A RMIFIN -j ACCEPT
-A MSSQL -m recent --name rmi -rcheck -j ACCEPT
-A MSSQL -j LOG --prefix "mssql without rmi "
-A MSSQL -j DROP

HTH,
M4



