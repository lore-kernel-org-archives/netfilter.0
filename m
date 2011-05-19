From: Kelbel Junior <kelbel02@gmail.com>
Subject: Re: Source MAC address through bridged connection
Date: Thu, 19 May 2011 13:11:27 -0300
Message-ID: <BANLkTikujJHoQv1hb-PdaAYyPukOpei4XA@mail.gmail.com>
References: <BANLkTikbqMrGCThuiFZRCtB6Mrf_+mcXNg@mail.gmail.com>
	<1305821120.8149.1094.camel@tardy>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Os73R+lTYm9g3SWONCKGQ+dUG9pQ6/A/wZeWx+83PuY=;
        b=epgwpXOTS/daSLC5K+me5JQ/IAQpp2Mx43UIg69Op0PXOx7FIbK3Q4qJZKYVgAJup7
         JTcuQjPRl2ophkS67DPM+/XyrMux+UEYrzpXnF0IHqArlNf/FoqSArNGMH/9WRENN6u1
         JR6LpKE064fgBklWrhOKAwcSoafQKLErzzjBw=
In-Reply-To: <1305821120.8149.1094.camel@tardy>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: rick.jones2@hp.com
Cc: netfilter@vger.kernel.org

Well, being more specific...
The computer between the clients and the Mikrotik (border gateway) is
a squid proxy operating in bridge, to intercept all traffic on the
port 80

2011/5/19 Rick Jones <rick.jones2@hp.com>:
> On Thu, 2011-05-19 at 12:52 -0300, Kelbel Junior wrote:
>> Hi guys!
>>
>> I have the following scenario:
>>
>> Clients Network <------> Linux router <------> Mikrotik gateway
>> <------> INTERNET
>>
>> Happens what the Mikrotik gateway controls the clients from the mac
>> address (joining an ip to an MAC address) and when i put the linux
>> router between they the control don't works.
>> I saw on the MK(mikrotik) the packets coming in with the MAC address
>> from the bridge, and this is a problem.
>>
>> Exist some way to preserve the source mac through a bridged
>> connection, to continue seeing the mac address of the clients?
>
> Is the device in the middle a router, or is it a bridge? =A0The
> distinction is quite important.
>
> Conceptually, a router does it's thing at layer three of the (in)famo=
us
> seven-layer model (*). =A0That means it only "preserves" layer three =
and
> above. =A0Layer 2 and below is not preserved.
>
> A bridge (or (multiport)switch, ignoring marktroid-speak about "L3
> switching") does it's thing at layer two. =A0That means it preserves =
layer
> two and above. =A0Layer 1 (physical) is not preserved.
>
> rick jones
>
> * there is also the nine-layer model
> http://www.isc.org/store/logoware-clothing/isc-9-layer-osi-model-cott=
on-t-shirt
>
>



--=20

Att.
Kelbel Junior
