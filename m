From: aragonx@dcsnow.com
Subject: Re: Identifiying and modifying packets
Date: Thu, 26 Mar 2009 15:43:55 -0400 (EDT)
Message-ID: <c8c16aac285fb28dc9a3c09a70855718.squirrel@www.dcsnow.com>
References: <e4bd24ae0b0148637ca48bf14e29b27a.squirrel@www.dcsnow.com>
    <49CBD634.4000203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49CBD634.4000203@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kristian Evensen <kristian.evensen@gmail.com>
Cc: netfilter@vger.kernel.org

> Hi,
>> Can someone tell me what tools I could use to examine outbound packet
>> data
>> for the usernames and modify it if it matches a list of accounts we want
>> to block?
>>
>>
> I suggest writing your own netfilter-module that does the packet
> inspection, and if a packet matches you can simply return NF_DROP to
> instruct the kernel to drop the packet. A good tutorial/book is
> available here: http://jengelh.medozas.de/
>
> Maybe you can do something similar with libpcap, but I am not sure if
> you can drop packets.

I would love to just drop the packets but this causes the client
application to crash.  So I think I need to modify ones that match to an
invalid user name.  I've seen it mentioned that libpcap can capture the
traffic, I have not seen where it can modify and then send it on.  Can it
do that?

---
Will Y.



-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

