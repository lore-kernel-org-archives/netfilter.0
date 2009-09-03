From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: iptables traffic shaping question
Date: Thu, 03 Sep 2009 10:13:41 +0530
Message-ID: <4A9F497D.4070507@infoservices.in>
References: <4A9E6804.3060300@infoservices.in> <9151ac2a0909020608g3139b1detc505b80e5d609ced@mail.gmail.com> <666660245e57b9ee21d773e20fb95411@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <666660245e57b9ee21d773e20fb95411@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>
Cc: Filip Sneppe <filip.sneppe@gmail.com>, netfilter@vger.kernel.org

Julien Vehent wrote:
> On Wed, 2 Sep 2009 15:08:39 +0200, Filip Sneppe <filip.sneppe@gmail.com>
> wrote:
>   
>> Hi,
>>
>> On Wed, Sep 2, 2009 at 2:41 PM, J. Bakshi<joydeep@infoservices.in>
>>     
> wrote:
>   
>>> Dear list,
>>>
>>>
>>> I like to get a good response ( min wait ) from my ssh and  stable (
>>>       
> max
>   
>>> throughput ) connection from the apache running at a remote server. Is
>>> there any setting  in iptables which allow me to set in my server
>>> accordingly ?
>>>
>>>       
>> iptables isn't really the tool for this. look into the "tc" command of
>>     
> the
>   
>> iproute package.
>>
>> I used to go to this site:
>>
>> http://lartc.org/
>>
>> It's still, up although it looks unmaintained.
>>     
>
> LARTC is unmaintained, but, AFAIK, none of the components regarding
> traffic control described there have changed.
> Maybe somebody more aware of the recent developments could confirm...
>
>
> Julien
>   

Hello Julien and Filip,

thanks a lot for pointing out LARTC site. It is a great site.
I got there the solution of my doubt.  It is TOS adjustment.

regards,


