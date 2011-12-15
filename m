From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: Filtering pppoed frames
Date: Thu, 15 Dec 2011 21:09:05 +0000
Message-ID: <4EEA61F1.9020709@ukfsn.org>
References: <CAKEn5-LiE2Dv0zw_8JREHoyT1DHwQ17EirqGPsykU3GkX9XfvA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKEn5-LiE2Dv0zw_8JREHoyT1DHwQ17EirqGPsykU3GkX9XfvA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marius Nicolae <marius.e.nicolae@gmail.com>
Cc: netfilter@vger.kernel.org

Marius Nicolae wrote:
> Hi,
>
> Im not sure if this is the right list but here we go. In our small ISP
> we've implemented a pppoe server using rp-pppoe  (
> http://www.roaringpenguin.com/products/pppoe ) on a Ubuntu server
> Lucid (last TLS) using a 2.6.32-34 linux kernel. For some time we're
> also hit by the problem described here
> http://lists.roaringpenguin.com/pipermail/rp-pppoe/2010q3/000162.html
> . Put it short, during peak hours some buggy pppoe clients are
> flooding the the server with PADT frames sent in the name of other
> clients disturbing the rest of the clients by increasing cpu load and
> traffic throughput (pings is getting worse as well). I could
> constantly monitor the buggy clients and ask the users to
> replace/upgrade their buggy routers but we're searching for a way of
> getting our server immune to such floods. Since in this scenario we
> cannot prevent the clients to send frames I'm thinking it might help
> to drop such frames as soon as they enter on the stack network. The
> involved ethernet protocol is 0x8863. It's described in the
> /etc/ethertypes like this:
> ============= 8<  ============
> PPP_DISC    8863            # PPPoE discovery messages
> ============= 8<  ============
>
> After studying the problem a little bit I was thinking to implement a
> userspace application which would limit the packets in a manner
> similar witth hashlimit helper from iptables but using as hashes the
> frames' source mac. After that, other goodies like sending daily
> reports with "outlaws" macs would had been implemented but that's
> another story.
>
> Since pppoed frames aren't ip packets (ethernet type 0x800) they
> cannot be matched with iptables. I didn't saw any way of matching such
> frames but to implement a kernel module registering a(some) netfillter
> hook(s) - I hope the terminology is correct. The filtering can happen
> directly in the kernel or packets can be queued to a userspace
> application. Before doing that:
> 1. Is there a better and easier way of matching pppoed frames and
> limit them in the way just described?
> 2. If not, do you know an open source project on which I might involve
> and contribute with such functionality?

I don't know pppoe so am not sure it will help in this case, but you can 
match/drop/limit non ip with tc and a policer - though it's not going to 
be as sophisticated as you describe doing with iptables.

If it's possible to identify a naughty frame just from the macs and or 
contents of the frame alone, then dropping them should be quite easy.

If you can't identify from the frame alone and need state from the pppoe 
server or some statistics then it's going to be trickier.


