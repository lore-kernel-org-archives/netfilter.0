From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: how to get ipset as module
Date: Tue, 06 Oct 2009 17:11:46 +0530
Message-ID: <4ACB2CFA.3000704@infoservices.in>
References: <4AC97923.8090108@infoservices.in> <alpine.DEB.2.00.0910061204080.14389@blackhole.kfki.hu> <4ACB2128.4070908@infoservices.in> <alpine.DEB.2.00.0910061314460.14389@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0910061314460.14389@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:
> On Tue, 6 Oct 2009, J. Bakshi wrote:
>
>   
>> Jozsef Kadlecsik wrote:
>>     
>>> On Mon, 5 Oct 2009, J. Bakshi wrote:
>>>
>>>       
>>>> I can't compile the kernel to activate ipset as it is a remote box. Is
>>>> there any alternative to to get ipset as a module in a remote suse box ?
>>>>     
>>>>         
>>> Assuming that the architectures of the remote/local boxes are 
>>> identical, that's not hard at all:
>>>
>>> - get the source code of the kernel version running on the remote box, 
>>> - configure the kernel source,
>>> - compile ipset with referring to the configured kernel source tree,
>>> - copy the compiled ip_set*.ko modules to the proper module directory
>>>   on the remote box.
>>>       
>> Thanks for your response.
>> Yes, this can be done too but the arch of the remote box is not same as
>> my local one. local box is 32-bit inter and the remote is
>> amd-dual-core-64bit
>>     
>
> Then use the ARCH=x86_64 flag when configuring the kernel source.
>
>   

Oh ! great. Forgot how flexible linux is.
Thanks

