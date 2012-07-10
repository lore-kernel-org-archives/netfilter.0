From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: iptables and vlan tagging
Date: Tue, 10 Jul 2012 07:14:32 -0400
Message-ID: <CACuyg27cXsP1jabS6asAe5Ozgb7Sc7e0SUWJNd8puLyKq7KwCQ@mail.gmail.com>
References: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=KeFr2wEaWB8a1+9HZfDoziktCIl9b2DYQNJkqN8BQUo=;
        b=P84IKP2yYi8bfA/YR4sVT8IQMnax2RfrSgXU191kFAvhmMkXrEmaVwKW0woClXlZ5W
         UyplDlJzfmoNAbGylgFi+RSPo6ILRV3x8kUnHWqTi0pCstPKD9nWwVWSskpB8+OqO6/y
         KH5G8JAasDVw96ZzNFHvdrFTHSgO/ozHwem+LoRrsRfSz7ZjqbV1pkgKBcoUSKFSEumQ
         fBSSddCHz6IPhDe9IbZEiDHU60l2/3Y9CGbmNgL0JWUDFmRbgjFrtkNVuqW2y1aojW0r
         oq7rHQ+rusZgODMahOByaLMz8ikcRoltsadjwtufRkxW4rpPw4DS8SrxP+mV2ejle49a
         i+yQ==
In-Reply-To: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I can be wrong, but I believe that this will bring Layer2 problems - i
cant see logic in this way!
From what was written, we can conclude that you don't want a VLAN segmentation.

I don't know how to do this, but...
I think this doesn't work on L2.



2012/7/10 Nikolai Lusan <nikolai@lusan.id.au>:
> Hi,
> I have a 2 vlans, 1 untagged with private IP's (vlan1) and 1 tagged
> (vlan2) with non-private IP addresses, and I want to remove the vlan
> tags before sending vlan2 packets out over my internet link and add them
> back before sending packets from the internet to vlan2. Should this be
> done in the iptbales mangle table? or do I need to use ebtables? And
> exactly how should I go doing this?
>
> Thanks
> --
> Nikolai Lusan <nikolai@lusan.id.au>
