From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: How do you correctly interpret the FORWARD chain interface 
	options?
Date: Tue, 9 Feb 2010 15:23:52 +0000
Message-ID: <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
	 <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=kwuCbLRo5iog0ADs+WPmWT/KEmgYD2LmMfnDOrtNUhI=;
        b=pAF9ajNdyoQWKWNtQwrXqULStlS4IGp/msKIAc3HS6l/j42DDrthvB0euxgBtt9iHI
         aoo2aYrhDI6hzLmkuiLuL/ACSchxGtdt/6F1Djovh11qQg6OqYERTKdYErdHPTde/cEI
         EZyrWcqujF6SPUtGivDTls0U5bja8yEGuQ3Ds=
In-Reply-To: <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, Feb 9, 2010 at 1:25 PM, Richard Horton <arimus.uk@googlemail.com> wrote:
> On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> wrote:
>> Hi All,
>>
>> How should one interpret the inbound ("-i") and outbound ("-o") of the
>> FORWARD chain.
>>
>
>
> -i refers to the interface the packet is received on.
> -o refers to the interface the packet is routed out on.
>
>

Does this mean that both versions below are equivalent or at least do
the same job?

(1)

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT

Because a packet will enter eth0 for internal network and a packet
will leave eth1 (pushed towards eth0).

(2)

iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT

Because a packet will enter eth0 to be forwarded internally and a
packet will also enter eth0 when leaving the network.


>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
> http://www.pbase.com/arimus - My online photogallery
>
