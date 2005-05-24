From: Binish A R <binishar@poornam.com>
Subject: Re: iptables LOG options
Date: Tue, 24 May 2005 10:46:02 +0530
Message-ID: <4292B892.7060603@poornam.com>
References: <4292A1A7.3020401@poornam.com>
	<4292A6CF.4020904@rfgt.net>	<4292AABF.4060009@poornam.com>
	<4292B530.3070801@rfgt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4292B530.3070801@rfgt.net>
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

Robert Vangel wrote:

> Binish A R wrote:
>
>> Robert Vangel wrote:
>>
>>> Make it `--uid-owner ! root' instead of `! --uid-owner root'
>>
>>
>>    
>>
>> iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root -j 
>> REJECT
>> is working fine, ie its blocking ssh from non-root users.
>> What I want is to log the username (uid) trying to do ssh.
>> Any comments?
>>
>>
>
> Please don't CC me. Thanks.
>
> Sorry, I misread the question :\.
>
> From my experience with -m owner/group (extremely limited I must 
> admit) I don't think it's possible. The messages in /var/log/messages 
> don't seem to have any uid information, and afaik there isn't any sort 
> of variables that iptables has in to do this sort of thing.
>
I apologize for the CC.
Is there any way, I can use environment variables while logging ?



