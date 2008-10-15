From: okahei@gmail.com
Subject: Re: CONNMARK target
Date: Wed, 15 Oct 2008 09:54:48 +0200
Message-ID: <ab52e4180810150054p5ee107b7p560a25e73dd2f54a@mail.gmail.com>
References: <ab52e4180810121012he399cf3pb7c1a4b9474f872f@mail.gmail.com>
	 <20081013151007.GE4148@khasse.inl.fr>
	 <ab52e4180810150049x39258263k89cf61758ef1133e@mail.gmail.com>
	 <20081015075139.GA14020@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=gqHI7niX3NaE+6OBImUFIDB8y/qPyLfcpmrAHBgYpcU=;
        b=F02Mqu6OkXBu4VTu0f+tiwWnKSKq1597vdBp1sWLN5LOJkjiJXSZYjtCukL89PJ/dI
         pm73V6agbH//dgxeDwkAi87v3tpQLjjLlcM+ttQ7aIdQQ+k1w2sALTtEjUFbVruLevVN
         PEwVWa7wWpuMkPl8C/mZbc4R5D10VgHUamRXk=
In-Reply-To: <20081015075139.GA14020@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, okahei@gmail.com, netfilter@vger.kernel.org

On Wed, Oct 15, 2008 at 9:51 AM, Eric Leblond <eric@inl.fr> wrote:
> On Wednesday, 2008 October 15 at  9:49:01 +0200, okahei@gmail.com wrote:
>> On Mon, Oct 13, 2008 at 5:10 PM, Eric Leblond <eric@inl.fr> wrote:
>> > Hi,
>> >
>> > On Sunday, 2008 October 12 at 19:12:58 +0200, okahei@gmail.com wrote:
>> >> Hello list.
>> >>
>> >> I've got a question with CONNMARK target.
>> >>
>> >> It's possible to mark whole connection playing with this parameter ?
>> >>
>> >> What i want is when a packet arrives to port 6900 UDP of firewall,
>> >> mark it with 0x99, and when the response packet arrives again from DMZ
>> >> interface of the firewall, are marked again with 0x99.
>> >
>> > You can get some information a connmark on the following page :
>> >        http://home.regit.org/?page_id=7
>> >
>> > Basically, what you want to add to your ruleset is :
>> > iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
>> > iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark
>> >
>> > First one restore mark when packet arrive (It put connection mark to the
>> > pt mark.. Second one save packet mark to connection mark to be able
>> > to restore it later (with --restore-mark).
>> >
>> > BR,
>> > --
>> > Eric Leblond
>> > INL: http://www.inl.fr/
>> > NuFW: http://www.nufw.org/
>> >
>>
>> Hello List.
>>
>> I'm in doubt with the /proc/net/ip_conntrack file, becouse i am
>> marking packets with 0x87
>
> 0x87 is in hexadecimal, this is equal to 135 in decimal ;)
>
> Don't use '0x' prefix if you want to use decimal integer.
>
> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>

Thanks for quick reply

Regards.
