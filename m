From: Nikolai Georgiev <voyager123bg@gmail.com>
Subject: Re: Unmatchable packet?
Date: Wed, 23 Nov 2005 02:46:24 +0200
Message-ID: <4383BBE0.2020504@gmail.com>
References: <071e01c5efa7$786db600$5e00800a@printserver>
	<073501c5efab$b10ad390$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <073501c5efab$b10ad390$5e00800a@printserver>
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
To: Jesse Gordon <jesseg@nikola.com>
Cc: netfilter@lists.netfilter.org

Jesse Gordon wrote:

> ----- Original Message ----- From: "Jesse Gordon" <jesseg@nikola.com>
>
>> My box is running a TCP service. When another box tries to my box, my
>> box
>
>
> I meant 'When another box tries to _connect to_ my box...'
>
> -Jesse
>
>> responds with a reply packet.(Just like it should.)
>> How do I match that (and all subsequent) reply packets so I can SNAT
>> on them?
>>
>> I even tried:
>>
>> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 222.222.222.222
>>
>> and sure enough, everything going out eth1 was 'from' 222.222.222.222
>> except the reply packets to incoming connections.
>>
>> Also tried -t nat OUTPUT, -t mangle OUTPUT, etc.. Nothing seemed to
>> work.
>>
>> Should I expect such a feat to be possible?
>>
>> Thanks!
>>
>> -Jesse
>>
>>
>>
>
I think you are looking for DNAT. Yep, you want to make DNAT. Lets
suppose you have 3 machines: A,B,C; A is behind B and you are on C. You
would want to make a DNAT rule on B to A in order to initiate
connections from C to A...

>
>
>


