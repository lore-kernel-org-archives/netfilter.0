From: "" <kfm@plushkava.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 19:44:31 +0000
Message-ID: <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=N
        cXke1vZ9eglxypqaRlglEYGoumES2kcpCiMgQRKEgw=; b=Rw96OwL9lcs4C8L7Z
        rGNovp+qYSXpEdYzHxlNw9OvgdE8pvqR4sTx/OMR4DcCpW52vMfqB97PvVQEdlq8
        Jr837lVA+ZUpHU9h1sDUS7rWq85H9YMci/NL/sQ12LxBMH+ZEmGxQlgt5CJAfXkq
        NHx9uk9aK/2iu7wvmnfpqEPzxB5PaOQDPiGE9rTWRcHNEsdwLg/qyi2rQp8Sf5Ix
        WMD3shGWt5rQkb15pCVh+56L01haRe6cRt/QZHPtPRCxxHcRwr0ek68d1GtJEzir
        d4jLVyHiDp/JnsVRAh1vogvKPR/AKEcBKm61O8xhf5110yjIxx78Ts4Gaapc0nWy
        j4xpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=NcXke1vZ9eglxypqaRlglEYGoumES2kcpCiMgQRKE
        gw=; b=34lPu82B4w+AHlgV3oOQrPUZsQETP03rQP8DjXbr1cyr8JZrDjRsxAW7y
        eZGyW6UVHFQZr+QpeFL2lcEJDMvjuLc7OSB4nzA1ZFrpjMLNCP88pVDYPwCGNPlN
        RzZgQ3cAeroStue3BcKEZXKMInXXfGMdocu7QCs/G7O1HhdSlbQfwdzCY7XWT5k+
        iB0z5DucaVK5l7HwUe2utxCK514Ll5p4x1JjZ+0ATR5Kb7/IlmysnaUR/mkCQ/0W
        /FM3aXzwno0YFVJOd/6sEHX/SLnuSzNMGWCQet1rFamc+bTwH11dJVh2g3KswHmU
        oemRUc3DQ4+CIsoHVPpHCYUYGyzng==
In-Reply-To: <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/02/2020 19:21, ѽ҉ᶬḳ℠ wrote:
> 
> On 12/02/2020 19:01, kfm@plushkava.net wrote:
>> On 12/02/2020 18:52, ѽ҉ᶬḳ℠ wrote:
>>>
>>> On 12/02/2020 18:40, kfm@plushkava.net wrote:
>>>> On 12/02/2020 16:41, ѽ҉ᶬḳ℠ wrote:
>>>>> Have tried to some online guidance which NFT features require which 
>>>>> kernel config to be set to get them working and whether jump is 
>>>>> among such feature set.
>>>>>
>>>>> Because hitting:
>>>>>
>>>>> Error: Could not process rule: Not supported
>>>>>
>>>>> with:
>>>>>
>>>>> table inet filter  {
>>>>>   chain input  { type filter hook input priority 0; iifname 
>>>>> pppoe-wan jump wan_i }
>>>>> }
>>>>
>>>> As shown, this isn't quite valid nft syntax. Please post a minimal - 
>>>> but complete - ruleset that reproduces your issue in a form that is 
>>>> verbatim. Include the wan_i definition, even if it merely an empty 
>>>> chain.
>>>
>>> table inet filter {
>>>      chain input { type filter hook input priority 0; iifname 
>>> pppoe-wan jump wan_i; }
>>>      chain wan_i  { type filter hook input priority 0; }
>>> }
>>>
>>
>> You may not jump to the wan_i chain because it is hooked. It makes as 
>> little sense as trying to run iptables -I INPUT -j INPUT.
>>
> 
> So jump and goto are only good with non-base chains and those can only 
> be utilised for:
> 
>   * nft_immediate: loads an immediate value into a register.
>   * nft_cmp: compare a given data with data from a given register.
>   * nft_payload: set/get arbitrary data from packet headers.
>   * nft_bitwise: perform bit-wise math operations over data in a given
>     register.
>   * nft_byteorder: perform byte order operations over data in a given
>     register.
>   * nft_counter: a basic counter for packet/bytes that gets incremented
>     everything is evaluated for a packet.
>   * nft_meta: set/get packet meta information, such as related
>     interfaces, timestamps, etc.
>   * nft_lookup: search for data from a given register (key) into a
>     dataset. If the set is a map/dictionary, returns the value for that 
> key.
> 
> 
> then, that correct? I had hoped that I could organise the chain 
> structure for processing into something like WAN, LAN and WAN<>LAN.

The obvious solution is to remove the hook from the wan_i chain. There 
is no apparent reason for it to have one. Also, you may find it useful 
to jump from your input chain to others by way of a verdict map.

-- 
Kerin Millar
