From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables typeof concatenation support for vmap?
Date: Sat, 30 Jan 2021 12:52:42 -0500
Message-ID: <b90733a5-60d8-a98d-5fef-3feceaf3202e@fhmtech.com>
References: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
 <CAF90-WgNpsT9dNZjQaPo18MjQCLUDieP+=8moNy0g81DRwkv0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=+uLs1OOF0Pche/P5OzxfA02KVW6KjCq3l0VoPq0Mru8=;
        b=cxvejQ+Hq1YRw0NWxCU/L3wFlNSGM7rtx3HDeV5ZjbcTafeLQ+Us6+BNVb+BafvsgnPe4/XJYGxSmkSEjmLiQ1lyQikLvXFDVFzJbhmxssJxrr+/lfZn2vgSk+KtWUZ3N1kRd+s+CspgPGtTZmo4/VBJr/opZaf8+htnNWage2M=;
In-Reply-To: <CAF90-WgNpsT9dNZjQaPo18MjQCLUDieP+=8moNy0g81DRwkv0Q@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Laura_Garc=c3=ada_Li=c3=a9bana?= <nevola@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2021/01/30 12:48, Laura García Liébana wrote:
> Hi Frank,
> 
> Try this:
> 
> table ip ip_nat {
>      map dnat_srv {
>          type ifname . inet_proto . inet_service : verdict
>      }
> }
> 

MAGIC! It works! Thank you!!!

