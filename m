From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: types of NAT with netfilter
Date: Mon, 10 Aug 2009 12:05:30 +0530
Message-ID: <cfeab66d0908092335s53f4f2ceo19ecbed6e521fe95@mail.gmail.com>
References: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com>
	 <1249647001.29388.25.camel@enterprise.ims-firmen.de>
	 <cfeab66d0908070819p66d977beo7ae1a0276c1487ff@mail.gmail.com>
	 <20090809115700.GA4861@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5nTB1Ol7yOhQ5eXbZ1K6On7LaqFbYVL3ARygaSW6ThE=;
        b=AfOLjkGgLUvsE6SZpPAQJbvpmFLRWLjC36bPCq6vCii1xKKiu9f5kaOY0/tCrzzOzb
         J7kr4++Gwo85rNVMycvYAn5yRLvWWBFNM78xh3hZ5Xr33QPyhKjbdOX65xIS5MJY4yGz
         yPcjwrqUWwrF7NEo0ELbxgebilhlyK0S+nIVE=
In-Reply-To: <20090809115700.GA4861@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

Thomas ,




On Sun, Aug 9, 2009 at 5:27 PM, Thomas Jacob<jacob@internet24.de> wrote=
:
> On Fri, Aug 07, 2009 at 08:49:35PM +0530, ratheesh k wrote:
>> My aim is to test whether my router supports what kind of NAT ..and =
to
>> know abt how we can make =A0nat types that are not supported =A0,wor=
king
>> .....
>>
>>
>> A { client computer } --------------------------> Router
>> ------------------------> internet ...
>>
>> This is my =A0 setup .
>
> So it isn't much about iptables anyway ..
>
>> On Fri, Aug 7, 2009 at 5:40 PM, Thomas Jacob<jacob@internet24.de> wr=
ote:
>> >> =A0 iptables -t nat -A POSTROUTING -i eth0 -o eth1 -j MASQUERADE
>
> This rule just gives you the NAT translation (and only deals
> with the first packet of a connection), in the "nat" table.
>
>> >> =A03 . i installed windows STUC and tested . Test results show it=
 is a
>> >> portrestricted nat ... But if i make default policy for wan INPUT=
 and
>> >> wan PREROUING as REJECT , test =A0got failed ??? is it iptables
>> >> dependend ??
>
> You also need to allow traffic to pass your system. If you REJECT eve=
rything
> in the PREROUTING/INPUT chains (in the nat table, I presume), you wil=
l basically
> prevent all NEW connections via/to the router.
>
> E.g. something like that (in the INPUT table) should get you started
>
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -m state --state NEW -i eth0 -o eth1 -j ACCEPT
> iptables -P FORWARD REJECT
> iptables -P INPUT REJECT
>
> Also check out this diagram that shows you how a packet is passed
> thru the netfilter/iptables system:
>
> http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png
>
> Maybe you should also read at least some of the docs :-)
>
> =A0=3D> http://netfilter.org/documentation/index.html
>
> =A0 Regards,
> =A0 =A0 =A0 Thomas
>
