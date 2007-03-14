From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Please help with my bridge/router
Date: Wed, 14 Mar 2007 01:57:09 +0100
Message-ID: <45F74865.5090008@rtij.nl>
References: <20070313115927.9894.qmail@web50404.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070313115927.9894.qmail@web50404.mail.re2.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Serge Matovic <matovics@yahoo.com>
Cc: netfilter@lists.netfilter.org

Serge Matovic wrote:
> Alexandru !!! THANK YOU/THANK YOU/THANK YOU !!!!
> I typed in your line (at the end of all of my commands
> to setup the bridge and router) and it WORKS !!!
> Now, I must find out what your line did to enable
> those sites that failed to load before, to load now.
>   

Most of the time, this means you don't allow the 
icmp-fragmentation-needed-but-df-bit-is set packets in. If you don't 
have these rules

-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

right on the top of your ruleset, that is your problem.

/me goes to bed, wondering how many bad recipes for iptables are on the 
net. You're only the third this month....

Post the output of iptables-save so we can examine your ruleset please.

HTH,
M4


