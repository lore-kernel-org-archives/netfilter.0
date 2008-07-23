From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: patch-o-matic problems..?
Date: Wed, 23 Jul 2008 15:04:53 +0200
Message-ID: <48872C75.10503@netfilter.org>
References: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>	 <alpine.LNX.1.10.0807201105300.21244@fbirervta.pbzchgretzou.qr>	 <alpine.DEB.1.10.0807201544510.8813@fairy.dhcp.penguin>	 <alpine.LNX.1.10.0807201652360.21244@fbirervta.pbzchgretzou.qr> <935fab200807221736k5c95037fgac0eac3e1e4915b2@mail.gmail.com> <48871C77.5060503@netfilter.org> <48871E6F.4050302@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48871E6F.4050302@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: netfilter@vger.kernel.org

Amos Jeffries wrote:
> Pablo Neira Ayuso wrote:
>> Dave wrote:
>>> I have to agree with these guys, the whole POM and Xtables things is
>>> extremely confusing to the newbies.
>>
>> Indeed. IMO they should not exist anymore.
>>
>> With regards to POM(-ng) - I cannot talk about the other project since
>> it is not supported by the Netfilter Project itself - it was something
>> that we needed during the 2.4 days, since we could not add new features
>> to the kernel that quickly. However, with the new 2.6 development cycle,
>> features can get into kernel faster. So if you need some feature or some
>> contibution into mainline, go and ask for it. Of course, it must suit
>> the standards and it must be an interesting contribution to what we
>> already have. On the other hand, you may also get the reason why it is
>> not in mainline yet.
>>
>> Well, Anyway I think that we've already discussed about this in a long
>> thread [1].
>>
>> [1] http://marc.info/?l=netfilter&m=121484288209802&w=2
>>
> 
> Could the netfilter team at least publish something along the lines of:
>  POM(-ng) is now being deprecated. There is another independent project
> run by X over at U which performs a replacement service ...

I just told my opinion, we have to discuss this in the team, we'll do
such announcement if we agree with it. Anyhow, you seem to have
completely missed the main point of my previous email which is why do we
need pom-ng or any other of replacement at all?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
