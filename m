From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: ICMP types
Date: Sun, 01 May 2005 01:40:48 +0200
Message-ID: <42741780.9000603@danbbs.dk>
References: <000101c54cf4$955d5460$6363a8c0@compaq>	<427378BC.6070804@danbbs.dk>
	<20050430223538.GC12091@samad.com.au>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050430223538.GC12091@samad.com.au>
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
Cc: Alexander Samad <alex@samad.com.au>

Alexander Samad wrote:
> On Sat, Apr 30, 2005 at 02:23:24PM +0200, Mogens Valentin wrote:
> 
>>Ken Hilliard wrote:
>>
>>>In reading different firewall scripts/tutorials many of them recommend
>>>filtering ICMP packets. I added ICMP filter in my firewall but was
>>>unsure of the value as well. What is the consensus view out there?
>>
>>Not wanting to comment what the consensus are, but some types are 
>>generally considered nessesary to filter/allow.
>>
>>But its really not just a matter of filtering this-or-that, also what's 
>>set in /proc . There's a lot to read...
>>A few ideas:
>>
>>Filtering ICMP:
>>
>>### Define icmp_packets chain:
>>    $IPT -F icmp_packets
>>    $IPT -X icmp_packets
>>    $IPT -N icmp_packets
>>    $IPT -A icmp_packets -p icmp --icmp-type echo-request -j ACCEPT
>>    $IPT -A icmp_packets -p icmp --icmp-type echo-reply -j ACCEPT
>>    $IPT -A icmp_packets -p icmp --icmp-type destination-unreachable -j 
>>ACCEPTlog
>>    $IPT -A icmp_packets -p icmp --icmp-type network-unreachable -j 
>>ACCEPTlog
>>    $IPT -A icmp_packets -p icmp --icmp-type network-prohibited -j 
>>ACCEPTlog
>>    $IPT -A icmp_packets -p icmp --icmp-type source-quench -j ACCEPTlog
>>    $IPT -A icmp_packets -p icmp --icmp-type parameter-problem -j ACCEPTlog
>>    $IPT -A icmp_packets -p icmp --icmp-type time-exceeded -j ACCEPTlog
>>    $IPT -A icmp_packets -p icmp --icmp-type fragmentation-needed -j 
>>ACCEPTlog
>>    #$IPT -A icmp_packets -p icmp -j ACCEPTlog
>>    $IPT -A icmp_packets -p icmp -j LOG
> 
> 
> 
> why not use
> -m limit --limit 1/s --limit-burst 5 
> as well to limit them and then drop the rest!

Yes, you're right. Actually thought about it awhile ago, but forgot.
Tnx for reminding me :-
And yes, I do start off dropping everything...

-- 
Kind regards,
Mogens Valentin


