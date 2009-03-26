From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Identifiying and modifying packets
Date: Thu, 26 Mar 2009 21:45:09 +0100
Message-ID: <49CBE955.7030507@gmail.com>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>    <49CBD634.4000203@gmail.com> <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=NOimBLxCSkfm4NS0telwunqomwoZjs1ujDOn0lcqrkk=;
        b=ic8aNOdOOa0PFEhLTgwl6SwHffdbd2bvFzztqHHtdVqMYt0Ou/+sUQilXr2KLoDQht
         fJ3ThgKT+Yy/NqZW3tM5XBkY0VGgGkLff2ZPhhKlgke/fZWA2NzjN/S1vq7+LI1xL41m
         1cwWFDdi2lI5DM+6omzZeTy9BNIZtp+P2XDrg=
In-Reply-To: <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: aragonx@dcsnow.com
Cc: netfilter@vger.kernel.org

aragonx@dcsnow.com skrev:
>> Hi,
>>     
>>> Can someone tell me what tools I could use to examine outbound packet
>>> data
>>> for the usernames and modify it if it matches a list of accounts we want
>>> to block?
>>>
>>>
>>>       
>> I suggest writing your own netfilter-module that does the packet
>> inspection, and if a packet matches you can simply return NF_DROP to
>> instruct the kernel to drop the packet. A good tutorial/book is
>> available here: http://jengelh.medozas.de/
>>
>> Maybe you can do something similar with libpcap, but I am not sure if
>> you can drop packets.
>>     
>
> I would love to just drop the packets but this causes the client
> application to crash.  So I think I need to modify ones that match to an
> invalid user name.  I've seen it mentioned that libpcap can capture the
> traffic, I have not seen where it can modify and then send it on.  Can it
> do that?
>
>   
Yes, with Netfilter your modules recieve the skb and it will not be 
passed on until the module is finished with it. You can then toy around 
with it (including the payload) as much as you want. Section 5.6 in [1] 
shows an example of modifying the payload.

I am not sure about libpcap, I haven't used it for a while, but I think 
you only receive a copy and thus cannot change what is sent over the 
network.

-Kristian

[1] - http://jengelh.medozas.de/documents/Netfilter_Modules.pdf
