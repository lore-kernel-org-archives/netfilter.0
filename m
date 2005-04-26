From: Richard Hauswald <staenker@rhcs.de>
Subject: Re: Accounting with iptables vs. snmp
Date: Tue, 26 Apr 2005 16:15:29 +0200
Message-ID: <426E4D01.3010105@rhcs.de>
References: <200504261345.45177.S.Guenther@in-put.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504261345.45177.S.Guenther@in-put.de>
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
To: netfilter@lists.netfilter.org

Stefan-Michael. Guenther (in-put GbR) wrote:
> Hi,
> 
> using iptables I have setup a traffic accounting on one of our client's 
> gateways:
> 
> iptables -A INPUT -i $WAN -j LOG --log-level debug
> iptables -A OUTPUT -o $WAN -j LOG --log-level debug
> iptables -A FORWARD -j LOG --log-level debug
> 
> syslogd collects the entries in a single file which is analysed daily.
> 
> The results corresponds to the amount of data I get with "iptables -L -v -n" .
> 
> The provider of our client uses snmp on his router to calculate the traffic.
> 
> Strange, but true: The numbers are never the same, sometimes iptables logs 
> more traffic, sometimes snmp. The differences are between 1 and 25 %.
> 
> Obviously someone is doing something wrong. The provider is one of Germany's 
> big player, so I guess I made the mistake. But where and why?
> 
> Thanks for any hint.
> 
> Stefan

Hello Stefan,
maybe (!)... your problem is simple so solve. You are appending this 
rules with the LOG target. So you will not count traffic which is 
blocked. Just write an -I instead of -A. But i don't know if thats the 
problem which took up to 25% of traffic difference. It sounds very 
strange, if you say that some times you count more than your provider 
and another day your provider counts more. Maybe you have an failure 
based on rounding the bytes to megabytes?

Regards
Richard

-- 
There are only 10 types of people in the world:
Those who understand binary, and those who don't

