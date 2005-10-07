From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 20:21:21 +0300
Message-ID: <4346AE91.8090002@gmail.com>
References: <4346866D.8080900@eccotours.dyndns.org>
	<4346913E.6070501@gmail.com>
	<4346A414.3030809@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4346A414.3030809@eccotours.dyndns.org>
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

Hi!

Brent Clark wrote:
> Sorin Panca wrote:
> 
>>
>> Small packets and control pachets should have priority because they
>> carry intrractive traffic.
> 
> 
> HI
> 
> I just had this other Idea,
> 
> I have a few services running in my private LAN, - Rules as so:
> 
> # To allow PPL to see PORT 80 and 443 for a particular webserver
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to
> 192.168.111.11:80
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 80 -d 192.168.111.11 -j
> ACCEPT
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to
> 192.168.111.11:443
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 443 -d 192.168.111.11
> -j ACCEPT
> 
> # TO ALLOW SMTP
> $IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT --to
> 192.168.111.11:25
> $IPT -t filter -A FORWARD -i eth0 -p tcp --dport 25 -d 192.168.111.11 -j
> ACCEPT
> 
> Can / should I use this following to help my internal web / mail server.
> 
> $IPT -t mangle -A PREROUTING -p tcp -m tcp --sport 80 -j TOS --set-tos
> Maximize-Throughput
> $IPT -t mangle -A PREROUTING -p tcp -m tcp --sport 25 -j TOS --set-tos
> Maximize-Throughput
Maximize-Throughput puts the packet in a low priority band. To help your
web server you should set the TOS to Minimize-Delay.
But as someone on the LARTC list said today, as a response to your post
there, few or none of the ISPs around the world honnor those TOS bits...
For your router you have two options for making it to consider those
bits: a classful queuing discipline that priorize according to their
meaning (that's PRIO qdisc) or a classless qdisc like pfifo_fast. The
last one happen to be the default qdisc for egress on Linux's NICs.
I don't think that sending mail is interactive traffic nor receiving it.
> 
> Just something I was thinking.
> 
> Kind Regards
> Brent Clark
> 

