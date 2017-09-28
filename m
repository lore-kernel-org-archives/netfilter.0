From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why are two hash tuples stored for each connection in the
 connection tracking system?
Date: Thu, 28 Sep 2017 18:50:01 +0200
Message-ID: <abe1f557-b3f7-1c41-ed15-5db7c7f5b1d0@plouf.fr.eu.org>
References: <CAKMCqEL=UCUUn2=Ke7-4uJo-fij80k7u13zEOsHNh_AP_p2EKQ@mail.gmail.com>
 <0cc1bff1-b709-06ff-1dfa-5d4214397277@plouf.fr.eu.org>
 <6f1b85b3-4982-d14c-a7d0-9abca40489aa@plouf.fr.eu.org>
 <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKMCqELnZLifhdEmbYEnPOX7SWAS4Y1L5KGBJ4YS_qT3QwkK=A@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Will Sewell <me@willsewell.com>
Cc: netfilter@vger.kernel.org

Le 28/09/2017 à 17:09, Will Sewell a écrit :
>> Because conntrack has to process packets in both directions, and the
>> packet header fields in the reply direction may not be obtained just by
>> swapping the fields in the original direction.
> 
> Thanks. That makes sense. I still have some confusion however: in the
> case where the original/reply connection information is not equal, how
> does the connection tracking system ensure that both hash tuples are
> embedded in the same conntrack struct (nf_conn)? Let's say an original
> packet arrives with some new original direction connection
> information. I'm assuming conntrack will allocate a new nf_conn struct
> with just the original hash tuple embedded. When a packet arrives from
> the reply direction, how does conntrack find the correct nf_conn to
> embed it in? From what I can tell the orifginal connection information
> is required to look this up.

I don't know the detail of conntrack data structures, but conntrack 
watches packets in two places :
- when the packet enters netfilter (PREROUTING or OUTPUT)
- when the packet leaves netfilter (POSTROUTING or INPUT)

When the first original packet enters netfilter, its characteristics are 
used to define the original tuple.

When the packet leaves netfilter after being transformed, its 
characteristics are used to define the reply tuple matching expected 
reply packets.
