From: Mike Ireton <mike-netfilter@tiedyenetworks.com>
Subject: Using -m limit to stop outbound portscanning viruses
Date: Sat, 05 Feb 2005 14:37:47 -0800
Message-ID: <42054ABB.5040700@tiedyenetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Howdy list,

I'm concerned about portscanning viruses which have infected customer 
machines and are using all of that subscribers outbound to scan for 
(say) open port 445's all over the net. This isn't good for the wireless 
and tends to use up substantial resources in disproportion to the amount 
of data actually being moved. I have control over all my subscriber's 
CPE gear (running a custom embedded linux distro) and I am considering 
including an outbound firewalling feature to slow the rate at which new 
connections can be established. Basiclly, I want to ratelimit outbound 
syn's to some sane number (5/sec to start). I already have qos and 
bandwidth control in place at the cpe side, but this job is more 
'packets per second' oriented than 'bytes per second'.

I've looked at various cookbook examples of using '-m limit 5/s' and did 
rules like '-p tcp --tcp-flags SYN -m limit --limit 5/s -j DROP', but I 
effectively cut myself off and couldn't make any connections at all. 
Does anyone have a code snippet that could share which would do this job 
for me?

Thanks.


