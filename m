From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: How do you correctly interpret the FORWARD chain interface 
	options?
Date: Tue, 9 Feb 2010 15:50:17 +0000
Message-ID: <ac5c74141002090750p412dbce1wc1fb8aa447c51e07@mail.gmail.com>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
	 <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
	 <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=M20dTPbzqfFXEwvPbYDcZi2gvN/qEZFxrpcKj3OzymM=;
        b=NK0ieRLcJGSIUOyi1Z/BWyyQ/B415Jb82w+8XUqOmqh7NRTyAao6X+qsAVYC6hGEDd
         +IE3QVVslUxB2iL5+BCl5+C8EvHk27kO67KjyPvaoeKRoghqH5g9KlYGaMI+3EJIgCzn
         544ipl84Sj/xWk8/meCgdVKlFq1Xy+HHFFRvs=
In-Reply-To: <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, Feb 9, 2010 at 3:23 PM, paddy joesoap <paddyjoesoap@gmail.com> wrote:
> On Tue, Feb 9, 2010 at 1:25 PM, Richard Horton <arimus.uk@googlemail.com> wrote:
>> On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> wrote:
>>> Hi All,
>>>
>>> How should one interpret the inbound ("-i") and outbound ("-o") of the
>>> FORWARD chain.
>>>
>>
>>
>> -i refers to the interface the packet is received on.
>> -o refers to the interface the packet is routed out on.
>>
>>
>

Ignore last email (spotted an error in the example rules).

I think I get what Richard is saying now.

The following two rules-set are equivalent, it just depends where you
decide to filter.

Am I correct?

 iptables -A FORWARD -i eth0 -p tcp -s 0/0 -d webServIP --dport 80 -j ACCEPT
 iptables -A FORWARD -o eth0 -p tcp -s webServIP --sport 80 -d 0/0 -j ACCEPT

 iptables -A FORWARD -o eth1 -p tcp -s 0/0 -d webServIP --dport 80 -j ACCEPT
 iptables -A FORWARD -i eth1 -p tcp -s webServIP --sport 80 -d 0/0 -j ACCEPT

In some sense writing the 4 rules leads to duplication, in that,
applying just two will suffice.



> Does this mean that both versions below are equivalent or at least do
> the same job?
>
> (1)
>
> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
> iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT
>
> Because a packet will enter eth0 for internal network and a packet
> will leave eth1 (pushed towards eth0).
>
> (2)
>
> iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
> iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT
>
> Because a packet will enter eth0 to be forwarded internally and a
> packet will also enter eth0 when leaving the network.
>
>
>>
>> --
>> Richard Horton
>> Users are like a virus: Each causing a thousand tiny crises until the
>> host finally dies.
>> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
>> http://www.pbase.com/arimus - My online photogallery
>>
>
