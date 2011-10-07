From: Duane Larson <duane.larson@gmail.com>
Subject: Re: Need to remove 802.1Q tagging
Date: Fri, 7 Oct 2011 16:22:53 -0500
Message-ID: <CAFcM1Ep1KrqDbSZdJQhS4_69NYfAFd9C7MqNz+tzqg8j-pskxg@mail.gmail.com>
References: <CAFcM1Eo0X77tfC4yYHjLPJs=xPGyrV-WUMnCnEWvbD2p5uW+9Q@mail.gmail.com>
	<20111007215212.68a88b56@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=iLjdlioKgxj8gmGLl4T8hRukLcpcmXRUGBbvcnAzV3c=;
        b=YLd2XpoMA/hKYgSKYvjRUJ2GBflMiox/gGlxvyNmXBymQ4smNlLR8qmMfDqNYrrH79
         Jqljat2JQgDDSEgrOTKBzn6CwNp6xXrPUJqSMDBh3nzEMMXWYxZNJ2yC8y+ZtF8BNghI
         Yv6eCFr+OOGzZ1i5cljbvJgvX3VsQFt9kggjU=
In-Reply-To: <20111007215212.68a88b56@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Would the following work

ebtables -A INPUT -i eth0.10 -o eth1 -j DROP    <-------- Block
eth0.10 vlan from sending traffic to eth1
ebtables -A INPUT -i eth0.+ -o eth1 -j DROP      <------ BLock all
vlans from sending traffic to eth1

On Fri, Oct 7, 2011 at 2:52 PM, Marek Kierdelewicz <marek@piasta.pl> wr=
ote:
> Hi,
>
>>I am thinking that the two interfaces on the Linux box will be bridge=
d
>>(in transparent mode) and when traffic passes through the linux box
>>the vlan 802.1q tag can be removed and then the traffic goes to the
>>Is my thinking correct? =A0Will this work? =A0What all do I need to b=
e
>>aware of and are there any current examples that point to what I am
>>trying to do??? =A0I am very new to netfilter and ebtables (I found o=
ut
>>about it last night).
>
> Your idea should work.
>
> Let's assume that "south" interface of Linux bridge on your diagram i=
s
> eth0 and "north" is eth1.
>
> You can bridge all eth0.X vlan interfaces and eth1 to single bridge
> with stp off. You should probably filter traffic on that bridge
> and allow anything but eth0.x <-> eth1. It's also a good thing to set=
up
> filtering ruleset before you start bridging (l'oops :).
>
> I've similar solution working very well in production environment. It
> involves providing pppoe on multiple vlans.
>
> If you need any more implementation details please feel free to ask o=
n
> prv.
>
> Best regards,
> Marek Kierdelewicz
>



--=20
--
*--*--*--*--*--*
Duane
*--*--*--*--*--*
--
