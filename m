From: dorian <dorian33@o2.pl>
Subject: Re: libnetfilter_queue issues
Date: Mon, 14 Jan 2013 15:24:25 +0100
Message-ID: <50F41519.8040505@o2.pl>
References: <50F15A68.3060806@o2.pl>  <CAOZ=-EUzjDe8YtZYZA_BjZt_cmP=ivcjUa6R5EecCmNZEEh0Rg@mail.gmail.com>  <1358017441.18655.1.camel@tiger2> <20130113112940.GA15424@1984> <1358117216.4629.2.camel@tiger2>
Reply-To: dorian33@o2.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1358117216.4629.2.camel@tiger2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@regit.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, credzba@gmail.com, netfilter@vger.kernel.org

Hi Eric,
Thanks a lot for explanations.

I would like ask you about another matter.

Previously, without deeper knowledge about dequeuing rule based on
verdict rather then the order of the packets  I've tried to implement
another solution.

I assumed that for queued packets 1,2,3,4 the verdict should be set in
the (same) order 1,2,3,4.

But since for packet 2 I needed to make some processing (which took a
while) and not wanting to block the packets 3 & 4 I used the following
strategy in my program.

packet1 -> NF_ACCEPT
packet2 -> need to be processed -> copy packet to program buffer -> NF_DROP
packet3 -> NF_ACCEPT
packet4 -> NF_ACCEPT

And the copy of the packet was processed "off-line" and finally the
packet should  be  "accepted"

For this I needed to find out how to re-insert the copy of the packet 2
into the network and  raw udp socket seemed to be right choice.

And I found the problem - using sendto() function I observed that the
packet incoming to the client was altered (somewhere in the system).

To be more specific:  all above concerned http packets transmitted from
a server to the client and the problem was that the tcp source
(server's) port  has been altered.

Additionally tcp checksum was changed for new but correct value (but
probably this was recalculated by interface)

Finally the packet arrived to the destination host but was refused by
the host as it was not from port 80.

I detected also that above "change" concerns only packets without 'fin'
flag.

Packet2 with 'fin' flag has been delivered properly.



I understand that above does not directly concern libnetfilter_queue
matters but it is an issue which explanation maybe interesting.

Maybe you have some knowledge why above could happened?

Why system modifies the packet (and additionally in specific packet
place: always source port) sent with raw socket?

And how to send packet without this unexpected system interventions ?

Any advice will be appreciated.

Best regards,
Dorian



> Hello,
>
> On Sun, 2013-01-13 at 12:29 +0100, Pablo Neira Ayuso wrote:
>> On Sat, Jan 12, 2013 at 08:04:01PM +0100, Eric Leblond wrote:
>>> Hello,
>>>
>>> On Sat, 2013-01-12 at 07:23 -0600, Felix wrote:
>>>> excellent question !
>>>> I too am interested in this.
>>>>
>>>> Another similar, related question is do packets that are not filtered
>>>> wait on a verdict for a filtered packet?
>>>> Again, if not, it means we can change packet order?
>>>> If so,it means we can degrade system performance unrelated to our
>>>> filtered packets.
>>> I've just wrote an article describing libnetfilter_queue and NFQUEUE. It
>>> has been written to answer your questions:
>>> https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/
>> It would be good to integrate part of this information to the doxygen
>> library documentation:
>>
>> http://www.netfilter.org/projects/libnetfilter_queue/
>>
>> Or simply add reference to Eric's page in the main page of the doxygen.
> To follow a small patchset trying to improve libnetfilter_queue doxygen
> documentation.
>
> BR,

