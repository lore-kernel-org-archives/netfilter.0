From: Martin Whinnery <martin.whinnery@sbirmc.ac.uk>
Subject: Re: transparent proxy with captive page - ipt_recent?
Date: Tue, 26 Jun 2007 09:12:21 +0100
Message-ID: <4680CA65.6090903@sbirmc.ac.uk>
References: <467FE1E4.2040306@sbirmc.ac.uk> <4680C39A.7030902@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4680C39A.7030902@rtij.nl>
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

Martijn Lievaart wrote:
> Martin Whinnery wrote:
>> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -m recent 
>> --rcheck --seconds 30 -j REDIRECT --to-ports 8080
>> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -m recent --set 
>> -j REDIRECT --to-ports 82
>>
>> So I thought the first rule wouldn't match first time around. Then the 
>> second rule would provide the proxy instructions page, and make the 
>> /proc/sys/net/ipt_recent/DEFAULT entry. This works fine.
>>
>> But the first rule should match on the next request. And it doesn't 
>> seem to. And I don't understand.
>>
> 
> I think you need to replace rcheck with update.
> 
> 
> HTH,
> M4
> 
> 

Thanks Martijn,

I think it's working now. I've found that conntrack keeps the first 
connection in TIME_WAIT for 120 seconds, and that if I try before that, 
rule1 misses. This will do me, so long as I keep my --seconds greater 
than this.

Thanks again

Mart

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


