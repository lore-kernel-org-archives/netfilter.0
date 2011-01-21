From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables --string-replace
Date: Fri, 21 Jan 2011 11:25:57 +0100
Message-ID: <4D395F35.8060006@netfilter.org>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>	<alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr>	<AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com>	<alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr> <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ben K <benkloester@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On 17/01/11 03:44, Ben K wrote:
>> Don't strip Cc, and don't top post.
> 
> Sorry, missed the cc. I read the posting guidelines before mailing and
> don't consider my means of quoting to be a top-post (I removed most of
> the content and the quote was 'standalone', I just chose to put it at
> bottom).
> 
>> Matching across packets would incur unwanted complexity.
> 
> Just curious, does the current string match implementation match
> across packets? If not, then surely adding replace functionality (with
> the same compromise) is not overly complex?
> 
> On Mon, Jan 17, 2011 at 12:20 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> 
>>
>> On Monday 2011-01-17 00:58, Ben K wrote:
>>>
>>>> Does anyone know if the --string-replace functionality ever made it
>>>> into iptables? If not, what are my chances of the patch from 2004
>>>> playing nice with the current Git head revision?

I remember that this patch have several problems:

* it does not handle fragmented packets
* it only allows to replace strings of the same size, otherwise you have
to perform sequence number adjustments, and that complicates the whole
thing.
