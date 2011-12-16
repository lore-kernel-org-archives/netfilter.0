From: "James Lay" <jlay@slave-tothe-box.net>
Subject: Re: Filtering pppoed frames
Date: Fri, 16 Dec 2011 11:43:30 -0700
Message-ID: <6b0192825eae6b5853fecac8d285dbe9.squirrel@127.0.0.1>
References: <CAKEn5-LiE2Dv0zw_8JREHoyT1DHwQ17EirqGPsykU3GkX9XfvA@mail.gmail.com>
    <4EEA61F1.9020709@ukfsn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EEA61F1.9020709@ukfsn.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Marius Nicolae wrote:
>> Hi,
>>
>> Im not sure if this is the right list but here we go. In our small ISP
>> we've implemented a pppoe server using rp-pppoe  (
>> http://www.roaringpenguin.com/products/pppoe ) on a Ubuntu server
>> Lucid (last TLS) using a 2.6.32-34 linux kernel. For some time we're
>> also hit by the problem described here
>> http://lists.roaringpenguin.com/pipermail/rp-pppoe/2010q3/000162.html
>> . Put it short, during peak hours some buggy pppoe clients are
>> flooding the the server with PADT frames sent in the name of other
>> clients disturbing the rest of the clients by increasing cpu load and
>> traffic throughput (pings is getting worse as well). I could
>> constantly monitor the buggy clients and ask the users to
>> replace/upgrade their buggy routers but we're searching for a way of
>> getting our server immune to such floods. Since in this scenario we
>> cannot prevent the clients to send frames I'm thinking it might help
>> to drop such frames as soon as they enter on the stack network. The
>> involved ethernet protocol is 0x8863. It's described in the
>> /etc/ethertypes like this:
>> ============= 8<  ============
>> PPP_DISC    8863            # PPPoE discovery messages
>> ============= 8<  ============
>>
>> After studying the problem a little bit I was thinking to implement a
>> userspace application which would limit the packets in a manner
>> similar witth hashlimit helper from iptables but using as hashes the
>> frames' source mac. After that, other goodies like sending daily
>> reports with "outlaws" macs would had been implemented but that's
>> another story.
>>
>> Since pppoed frames aren't ip packets (ethernet type 0x800) they
>> cannot be matched with iptables. I didn't saw any way of matching such
>> frames but to implement a kernel module registering a(some) netfillter
>> hook(s) - I hope the terminology is correct. The filtering can happen
>> directly in the kernel or packets can be queued to a userspace
>> application. Before doing that:
>> 1. Is there a better and easier way of matching pppoed frames and
>> limit them in the way just described?
>> 2. If not, do you know an open source project on which I might involve
>> and contribute with such functionality?

I'd install tshark on the ppp-oe server and try any one of the below:

sudo tshark -t ad -n -i eth* pppoed

it won't block anything, but may point you in the right direction on where
they're coming from.

James


