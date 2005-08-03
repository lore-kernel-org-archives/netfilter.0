From: Philip Craig <philipc@snapgear.com>
Subject: Re: DNAT pptp to windows machine
Date: Wed, 03 Aug 2005 16:25:02 +1000
Message-ID: <42F0633E.4020000@snapgear.com>
References: <04a101c597aa$2db2bc50$1500a8c0@domain.internationalauto.com>
	<01d001c597f2$246fe580$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01d001c597f2$246fe580$0100a8c0@newlife>
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

Ming-Ching Tiew wrote:
> As far as I know, PPTP connection tracking is for the PPTP client going
> through firewall, ie pptp masquerade. It is not needed for DNAT of PPTP 
> into a pptp server.

The PPTP connection tracking works for both clients and servers,
since after all, you need one of each to make a PPTP connection.

While you can get by without it for DNAT to a server, the PPTP
connection tracking allows you to automatically NAT the related
GRE connections, and you can use a conntrack state match to only
allow related GRE packets through the firewall.

