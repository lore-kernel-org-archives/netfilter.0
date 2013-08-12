From: Alex Flex <aflexzor@gmail.com>
Subject: Re: Help with stateless firewall
Date: Mon, 12 Aug 2013 16:19:30 -0600
Message-ID: <52095F72.7070808@gmail.com>
References: <5209377B.5030105@gmail.com> <20130812214151.GE13717@harrier.slackbuilds.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=2aIp7xyRLvGMhEghCcEcRNGKDF1yuGCXaOxObjXJoMo=;
        b=na+75/xUaJCE7OmHR+ePcccMTvZgP4YJxvyZqvAXA24DH6YbYay1dA5kOHI89GfSRm
         /pn0QqG3wYd27hPU0b6LIYLDunO+SVMo52LJXBvprSp1I87WyTDdeQ6xtmsbjUBKPBnz
         hvJ5coDvpcrZKH0QutRjdBc438/QMJxSIqebxk6vgXRq5mqqAjsr0E5uLPE8iAniGYZz
         IeyujbBPfhQ7B/pdHiD8WHOHr3BYzt1eYQCrFbgpmRsf+trx9nQ5+PkPaJ+7Cp2mEOrZ
         oRXh1ihwByIxtFljiP0gaiOt/EUjEFtxkK8iGedj53LKIUhBMQhyYF+Gj4n1d0gSsKJd
         eBsg==
In-Reply-To: <20130812214151.GE13717@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Rob,

On 08/12/2013 03:41 PM, /dev/rob0 wrote:
> On Mon, Aug 12, 2013 at 01:28:59PM -0600, Alex Flex wrote:
>> Iam working with a stateless firewall to help keep up with DoS
>> and a state flood. I have a few doubts about my setup:
> What is a "state flood"? Why do you think a stateless firewall is
> superior, or even desirable?
With a state flood, i meant a syn flood for example. My experience has 
taught that small bandwith attacks (those that my uplink stands) are 
done based on my state table reaching its limits.

Knowing this, do you think I should have taken another approach?

Is there anyway I can assign conntrack resources per chain, this would 
greatly help at isolating damage.

The OUTPUT deny is a paranoid method to have a more complete 
understanding of that traffic and future applications cannot misbehave 
so easily. It is not meant to guard from ssh users.



