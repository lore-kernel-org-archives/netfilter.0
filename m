From: Ed W <lists@wildgooses.com>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 23:05:54 +0100
Message-ID: <4F8C97C2.6020000@wildgooses.com>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com> <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu> <4F8BDA57.4090701@wildgooses.com> <alpine.DEB.2.00.1204161126050.20321@blackhole.kfki.hu> <4F8C1B23.8040400@wildgooses.com> <alpine.DEB.2.00.1204161515310.20321@blackhole.kfki.hu> <4F8C1E78.6030202@wildgooses.com> <alpine.DEB.2.00.1204161548170.20321@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1204161548170.20321@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Netfilter <netfilter@vger.kernel.org>

On 16/04/2012 14:48, Jozsef Kadlecsik wrote:
> On Mon, 16 Apr 2012, Ed W wrote:
>
>> On 16/04/2012 14:20, Jozsef Kadlecsik wrote:
>>> On Mon, 16 Apr 2012, Ed W wrote:
>>>
>>>> On 16/04/2012 10:55, Jozsef Kadlecsik wrote:
>>>>> Try the following untested patch:
>>>> Thanks for the idea.  I'm not 100% sure I'm testing correctly, but I
>>>> rebuilt
>>>> and I see no change...
>>> See the message from Amos in this thread: if uclibc ignores
>>> AI_NUMERICHOST, then I can't workaround that :-(.
>> Could you please investigate keeping your changes and I will separately
>> investigate fixing/patching uclibc.  I found Amos' referenced post and it
>> gives some background on what is needed to resolve this
> Sure.
>

I have now implemented a fix in uclibc.  The current patch I submitted 
is not optimised by the AI_NUMERICSERV option, so whilst leave it in if 
there is no harm, it's not necessary for uclibc.  Performance has 
improved dramatically!

Thanks for all the help - very much appreciated!

Ed W
