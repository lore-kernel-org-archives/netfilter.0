From: Michael <mutk@iprimus.com.au>
Subject: Re: IP Accounting and performance
Date: Mon, 09 Dec 2002 10:13:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF3E022.50203@iprimus.com.au>
References: <AB18D92A-0AF2-11D7-96A2-00039376F59E@gerry.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: IPtables Users <netfilter@lists.samba.org>

Gerald Galster wrote:
> Hi all,
> 
> Perhaps you can give me some hints on a performance problem that I'm
> currently experiencing with iptables.
> 
> The situation is as follows:
> 
> I have a firewall currently running kernel 2.4.20, Celeron 1 GHz and 512 
> MB of RAM
> that should do traffic accounting based on single IP addresses. I 
> thought it would be more
> efficient to use iptables than writing a standalone application using 
> pcap or the like.
> 
> I need to add filtering rules like
> 
> /sbin/iptables -A FORWARD -o eth0 -s ip_address/32
> /sbin/iptables -A FORWARD -i eth0 -d ip_address/32
> 
> for about six class-C networks (this means about 3000 iptables rules).
> 
> The average throughput is around 3 Mbits / second.
> 
> After I've added those rules, the latency in ping times to a machine behind
> the firewall increases from 30 ms to over 200 ms ...
> 
> Now my question is if I can speed those things up ... do you have any 
> ideas?
> 
> Thanks in advance.
> 
> Regards,
> Gerald
> 
> 
> 

Hmm. Exactly what this site says will happen: http://www.hipac.org/ 
(See the performance tests)

As far as I know, you will not be able to overcome the limitations 
that iptables has with large rulesets. You can minimise the effect 
with carefull design , but once you have that many rules, iptables 
inevitably grinds to a halt.

nf-hipac does not currently have byte and packet counters 
unfortunately. It has occured to me many times that the most likely 
situation in which large rulesets are needed is when per IP accounting 
is being done, yet nf-hipac does not yet have counters..

Cheers,
Michael



