From: Indrek Paas <indrekpaas@gmail.com>
Subject: Re: Iptables and voip (sip) traffic
Date: Sun, 11 Apr 2010 12:07:09 +0300
Message-ID: <l2q596a60ad1004110207w394a042dn1a1fc12853158539@mail.gmail.com>
References: <o2m596a60ad1004090653r8d00d435wfa96256b847dece8@mail.gmail.com>
	 <4BC0BCF3.5080302@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=N8xW1Eml4EPVuymu3b/sURxSpPqkVR0iia6bxeI2qEk=;
        b=qOtmbkIEKN5NU4oR5zEjUZ3F9TwRnOVxnA/vTU9O19JUmMrE/lerzS4sozOnPMoMev
         UPV0lGXyP8IVM1bil1giZpNREajNFNgdJqZTXoQS66htWVYYtVjFwg4Apu7/ku16bNHf
         XY4yfQawgYoAV7QNqKhcUxnqsDI4r+GpLK/g8=
In-Reply-To: <4BC0BCF3.5080302@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, Apr 10, 2010 at 9:01 PM, whiplash <whiplash@bofhland.org> wrote=
:
> Indrek Paas ha scritto:
>> Hi,
>>
>> I have searched information about iptables and Sip protocol used for
>> Voip calls. I remember that this particular protocol had problems
>> passing firewalls which were configured to use NAT.
> [...]
>> And voip service provider claims that the Linux router should be
>> switched to their Thompson device. Because iptables "interferes with
>> their service". So any help and information is greatly appreciated.
>
> Linux kernel already has two modules for handling natting and conntra=
cking
> of SIP protocol, nf_nat_sip and nf_conntrack_sip; your VoIP service
> provider is trying to sell you something you don't really need, possi=
bly.
>
> HTH.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>

So there is no need for special Iptables rules to manage sip protocol?
Other than allowing the traffic for port 5060? If this is true then I c=
an ask
the provider to look over the settings for voip account.


Indrek P.
