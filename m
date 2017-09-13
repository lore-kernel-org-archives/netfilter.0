From: "Thomas Rosenstein" <thomas.rosenstein@creamfinance.com>
Subject: Re: Change source or destination for packets arriving locally (for
 Direct Server Return)
Date: Wed, 13 Sep 2017 15:23:28 +0200
Message-ID: <DF1B4985-ED4C-4881-8A54-11310C5AA3B9@creamfinance.com>
References: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
 <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=creamfinance.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=Rmb3qofbJQRJaSXBUJHqdMieS6Ws2WqQgwfR5UqfGCI=;
        b=ElqMCc9etLCpdyBbBLyaVaLGZ/efaEk7q0rk2cjlE2bouOrlOU2cad6SrAbgMqjBYw
         OkAXlKPbnVLuLch0M54sKFNrawNrxw9v48moJ/G2iQpTfpRhquhXPCXAAXVRfwYCcND5
         C0WZAwqtHhP1gsKVjzH4kkFrEhMfssG+LAtqo=
In-Reply-To: <CAOkSjBh4nkZ25_oxmkK6W5uFQnMUc7_nCdC+LVA90jbqhdALPA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; markup=markdown; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi,

it is now working and my router receives the return packets, but they 
are not forwarded and dropped after the MANGLE PREROUTING chain.

What could be the issue, or where in the kernel could I check what's 
happening? Is there some flag to enable detailed tracing?

Based on tcpdump the packet is okay regarding checksums.
Based on this 
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg 
it breaks somwhere between mangle and nat PREROUTING.

Any suggestions or ideas are welcome!
Thanks

BR
Thomas

On 13 Sep 2017, at 11:34, Arturo Borrero Gonzalez wrote:

> On 12 September 2017 at 08:00, Thomas Rosenstein
> <thomas.rosenstein@creamfinance.com> wrote:
>> Hello,
>>
>> I'm trying to setup L3 load balancing (with direct server return) 
>> which
>> requires me to send back or receive packets with a certain src/dst 
>> address,
>> but for these packets the dst address is replaced on the load 
>> balancer, then
>> routed and are arriving on my linux container.
>>
>
>
> I guess you could do this with nftables. You can perform this kind of
> load balancing with nftables out of the box [0].
> Note that nftables should be able to work with DSCP, so you can
> combine both things (matching, load-balancing) with the same
> technology.
>
> Please, read the docs in our wiki and do some tests.  After that, it
> would be great if you come back here and report your experience :-)
> Perhaps we can generate a concrete example and put it in the wiki for
> future references.
>
> [0] https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
