From: Unknown <unknown@unknown.invalid>
Subject: Re: block dhcp service based on mac
Date: Tue, 30 May 2006 15:30:55 +0200 (CEST)
Message-ID: <7434.69904778085$1149075500@news.gmane.org>
References: <WorldClient-F200605301121.AA21510331@nepalbank.com.np>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200605301121.AA21510331@nepalbank.com.np>
From: martijn@localhost
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
To: admin@nepalbank.com.np
Cc: netfilter@lists.netfilter.org

<citaat van="System Admin">
> hello all
>
> I have an dhcp server and i want to block a particular mac address (that
> pc is virus infected) from using my dhcp service so that it will not get
> any valid ip address.
>

The DHCP server operates on a lower level than iptables. You'll never
achieve this with iptables rules alone.

The solution is very easy. Hardwire the mac address to some IP in the dhcp
server. Use 127.0.0.1 or something similarly unusable.

M4


