From: Frank Gruellich <frank@der-frank.org>
Subject: Re: choose interface based on port
Date: Sun, 19 Dec 2004 10:08:39 +0100
Message-ID: <20041219090839.GQ30585@der-frank.org>
References: <200412190132.52221.ssc@earth.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200412190132.52221.ssc@earth.com.br>
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

* Security Support Center <ssc@earth.com.br> 19. Dec 04:
> Hello All,

Hi,

> I have a firewall that holds 4 interfaces, and 2 of them are links to the 
> internet.
> 
> I want use link 1 for navigation (80 port) and link 2 for all the rest. But I 
> can't get it done.

You have to combine netfilter and ip.  Your problem is explained here:
<URL:http://www.lartc.org/howto/lartc.netfilter.html>

HTH,
 regards, Frank.
-- 
Sigmentation fault

