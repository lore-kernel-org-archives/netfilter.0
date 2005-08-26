From: Maxim Shpakov <maxim@osetia.org>
Subject: Re: Analysing traffic from rule
Date: Fri, 26 Aug 2005 12:18:57 +0300
Message-ID: <603071399.20050826121857@osetia.org>
References: <1125046931.11274.10.camel@n10665.scania.com>
Reply-To: Maxim Shpakov <maxim@osetia.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1125046931.11274.10.camel@n10665.scania.com>
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
To: Jimmy Hedman <jimmy.hedman@southpole.se>
Cc: netfilter@lists.netfilter.org

Hello Jimmy,

Friday, August 26, 2005, 12:02:11 PM, you wrote:

JH> Hi,
JH> I'd like to "see" the traffic that hits a rule and found
JH> http://www.stearns.org/doc/iptables-ulog.current.html which uses ULOG
JH> which works fine. But I wonder if its possible to do it without using
JH> ULOG and storing it on a file?

JH> // Jimmy


-j LOG  ? log traffic via syslog

-- 
Best regards,
 Maxim           mailto:maxim@osetia.org


