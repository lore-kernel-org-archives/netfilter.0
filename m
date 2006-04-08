From: Oleg <xsov@mail.ru>
Subject: Re: iptables and mac filtering
Date: Sat, 8 Apr 2006 13:39:39 +0400
Message-ID: <200604081339.40244.xsov@mail.ru>
References: <44377281.60706@ratel.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44377281.60706@ratel.ru>
Content-Disposition: inline
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

> . Line inserted showed by iptables -L -v -n but not block any IP-less
> requests from address specified. Ping or any IP protocols blocking
> success, but pppoe discovery, exchange and traffic pass the filter
> wthout any problem with no rule countr increment. How i can fix this
> thing? Or what i to do wrong?
IPTables is IP filtering tool, you should look at arptables for any 3 layer 
protocol MAC-filtering.

-- 
Best regards, Oleg


