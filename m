From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Blocking direct private IP address
Date: Thu, 1 Mar 2007 00:35:14 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703010033510.23355@yvahk01.tjqt.qr>
References: <BAY119-F18E57FAE6C344557F46010D6810@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F18E57FAE6C344557F46010D6810@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org


On Feb 28 2007 15:20, Andrew Kraslavsky wrote:
>
> If I set up a host on the external/public network with a static route that
> causes it to send traffic addressed to 192.168.0.0/24 to the 10.0.0.1
> external/public IP address of the firewall/router and then attempt to access
> the Web server using 192.168.0.99 as the address, these directly addressed
> packets get through the firewall.

I did not find the question in your mail, but:

Activate "rp_filter", and any hosts on 10.0.0.0/24 that uses a
non-10.0.0.0/24 address as source will be ignored.


Jan
-- 

