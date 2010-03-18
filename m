From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: Rules PREROUTING doesn't work
Date: Wed, 17 Mar 2010 23:48:03 -0500
Message-ID: <hnsba3$50s$1@dough.gmane.org>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>  <hnqkk4$62v$1@dough.gmane.org>  <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>  <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com> <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com> <hnrrke$d0$1@dough.gmane.org> <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 03/17/2010 08:14 PM, Jan Engelhardt wrote:
>
> On Thursday 2010-03-18 01:20, Robert Nichols wrote:
>>
>> And, I just noticed that the protocol is UDP.  The only way a UDP
>> entry gets removed from conntrack is by timing out, and that can take
>> up to 3 minutes (see the values in
>> /proc/sys/net/netfilter/nf_conntrack_udp_timeout*).
>
> No, that is not the only way. You can manually remove entries
> with `conntrack -D ...`.

Yes, I should have said, "... gets removed _automatically_ ...".

-- 
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.

