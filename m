From: Binish A R <binishar@poornam.com>
Subject: Re: iptables LOG options
Date: Tue, 24 May 2005 09:47:03 +0530
Message-ID: <4292AABF.4060009@poornam.com>
References: <4292A1A7.3020401@poornam.com> <4292A6CF.4020904@rfgt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4292A6CF.4020904@rfgt.net>
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
To: Robert Vangel <vangelr@rfgt.net>
Cc: netfilter@lists.netfilter.org

Robert Vangel wrote:

> Binish A R wrote:
>
>> Hello,
>>
>> I am trying to write my custom firewall rules.
>> I want to drop all outgoing ssh for non root users and log any such 
>> attempts at the same time.
>> I want to log the username trying to do that. What option should I give?
>>
>> The following won't definitely work.
>>
>> iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root -j 
>> LOG --log-prefix "$USER NO SSH ALLOWED"
>>
>> because the shell expands $USER variable immediately.
>>
>> Is there any other option to find the value of owner that get matched 
>> by the below rule:
>>
>>
>> iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root
>>
>>
>> Any help is much appreciated.
>>
>>
>> Thanks and Regards,
>>
>> Binish
>>
>>
>>
>
> Make it `--uid-owner ! root' instead of `! --uid-owner root'

iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root -j REJECT
is working fine, ie its blocking ssh from non-root users.
What I want is to log the username (uid) trying to do ssh.
Any comments?



