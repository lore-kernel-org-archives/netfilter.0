From: "Charles Romestant" <cromestant@gmail.com>
Subject: Re: Port Forwarding .
Date: Tue, 8 Jul 2008 18:40:57 +1930
Message-ID: <5078d3df0807071610m5b47a81qc5d830a8b7bd0cff@mail.gmail.com>
References: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>
	 <4872943B.2060309@riverviewtech.net>
	 <5078d3df0807071532w4ab76fe4vcf4e60a8980525ba@mail.gmail.com>
	 <5078d3df0807071533k47a5dd16i254b3ae3592d7a77@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=hCCoKegXvCC4lrAxZoB5f+oCSNn4RwY/Tv7rIZ+y+sc=;
        b=ipwW4vXNA62zFOhDA+y5UCzyWXAaPfztYIgc0+owuO0ICNwp+ncfTxV20h+2ZiWLrr
         xnIlBoFA3ipYZnesFo5UkYfnYCdNTxq+vZnvs5yGCus26NHhFlMIa9D1wMggWHJ9zv8N
         LwHs5k6UiuxluWWUYdm7FSWykSJax8ZI6fTOo=
In-Reply-To: <5078d3df0807071533k47a5dd16i254b3ae3592d7a77@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

ok i just saw that the little "diagram" I sent on OP had been moved
about when sent, so resending the interface information just in case.

A: 10.0.1.200
B : eth0 10.0.1.192, eth1 10.0.10.2
C : eth0 10.0.10.1


A and B are on the same subnet and B and C are on another subnet.

The idea is to open the browser in A type 10.0.1.192 and get the web
server that is on C.

I did what you suggested Mr Taylor, and still does not work.

iptables -L lists this :


Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             Macintosh.local     tcp dpt:www
ACCEPT     tcp  --  Macintosh.local      anywhere            tcp spt:www

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain fail2ban-ssh (0 references)


thank you again

Charles

On Tue, Jul 8, 2008 at 6:03 PM, Charles Romestant <cromestant@gmail.com> wrote:
> by the way, from B i can see the server on C, so it is not a NIC problem.
>
> thanks again.
>
> charles
>
> On Tue, Jul 8, 2008 at 6:02 PM, Charles Romestant <cromestant@gmail.com> wrote:
>> thanks for answer
>>
>> hmm tried it and still does not work...
>>
>> any ideas, at least to get some debug info... still can t see the
>> server from a browser on A.
>>
>>
>> On Tue, Jul 8, 2008 at 5:40 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
>>> On 07/07/08 16:49, Charles Romestant wrote:
>>>>
>>>> on C there is a web server, running on port 80, I want to be able to
>>>> access it through B from A.
>>>>
>>>> So basically the ruleset should be on B if its port 80, forward to port 80
>>>> on C.
>>>
>>> These two rules should do the trick to get the traffic forwarded on through
>>> B to C.
>>>
>>> iptables -t nat -A PREROUTING -i eth0 -d 10.0.1.192 -p tcp --dport 80 -j
>>> DNAT --to-destination 10.0.10.1
>>> iptables -t filter -A FORWARD -i eth0 -o eth1 -d 10.0.10.1 -p tcp --dport 80
>>> -j ACCEPT
>>>
>>> You will need to make sure that the reply traffic back from C is allowed and
>>> appears to be from B.
>>>
>>> iptables -t filter -A FORWARD -i eth1 -o eth0 -s 10.0.10.1 -p tcp --sport 80
>>> -j ACCEPT
>>> iptables -t nat -A POSTROUTING -o eth0 -s 10.0.10.1 -p tcp --sport 80 -j
>>> SNAT --to-source 10.0.1.192
>>>
>>>> Any help would be appreciated, thank you in advance,
>>>
>>> You are welcome.
>>>
>>>
>>>
>>> Grant. . . .
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>>
>>
>> --
>> Charz
>>
>
>
>
> --
> Charz
>



-- 
Charz
