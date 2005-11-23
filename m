From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Unmatchable packet?
Date: Tue, 22 Nov 2005 17:46:36 -0800
Message-ID: <078401c5efcf$bd9eb210$5e00800a@printserver>
References: <071e01c5efa7$786db600$5e00800a@printserver>
	<073501c5efab$b10ad390$5e00800a@printserver>
	<4383BBE0.2020504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Nikolai Georgiev <voyager123bg@gmail.com>
Cc: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Nikolai Georgiev" <voyager123bg@gmail.com>
To: "Jesse Gordon" <jesseg@nikola.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Tuesday, November 22, 2005 4:46 PM
Subject: Re: Unmatchable packet?


> Jesse Gordon wrote:
>
>> ----- Original Message ----- From: "Jesse Gordon" <jesseg@nikola.com>
>>
>>> My box is running a TCP service. When another box tries to my box, my
>>> box
<snip>
>>>
>>> Should I expect such a feat to be possible?
>>>
>>> Thanks!
>>>
>>> -Jesse
>>>
>>>
>>>
>>
> I think you are looking for DNAT. Yep, you want to make DNAT. Lets
> suppose you have 3 machines: A,B,C; A is behind B and you are on C. You
> would want to make a DNAT rule on B to A in order to initiate
> connections from C to A...

Thanks for your response!

You are correct as to how I would go about forwarding ports to publish an 
internal server -- but forwarding ports isn't my goal.

Incidently I didn't explain well I guess.

Note that what I'm trying to describe is not a normal thing to do; It's not 
something that will make sense. Once you understand what I'm trying to say, 
you'll want to ask me "But why on earth would you even want to do that?" (My 
goal does have a use in the real world, but the real world is a much more 
complicated scenerio to set up.)

I actually want to rewrite the source IP of TCP packets that exit a given 
ethernet card -- even (especially) if they are generated as responses to 
incoming connections to the box.

 Lets say I have 2 machines: S, and C;
S is the server, and I am on C[lient]. Both machines are sitting on a simple 
isolated flat LAN.

Normally, when C connects to S, S replies with it's own source address. This 
is normal operation, and is what I want to alter.
I wish for the replies from S to be to reach C with an arbitrarly assigned 
source address.
(And I want the source address rewrite to be performed inside S)

I hope I was more concise this time.

Thanks again!

-Jesse

>
>>
>>
>>
>
> 



