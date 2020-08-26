From: "" <kfm@plushkava.net>
Subject: Re: Explanation of 2 Rules
Date: Wed, 26 Aug 2020 18:28:29 +0100
Message-ID: <49199808-3b28-fe00-34ca-737bba29ad56@plushkava.net>
References: <416b36ac-c17f-0ccd-3d28-cf8e4f3372ae@mail>
 <96ccc7de-4de4-e01f-2270-a1238b4cff1a@mail>
 <c9f61216-e333-6551-e98e-8a5ce015f248@plushkava.net>
 <c44a47f2-1de8-8a70-b31d-fa92b2547881@mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=t
        hyzE+sAVa5UfUziUkbnG1MO3sGUMaUzNI1j5+x0zYA=; b=aZyTAryQdkJtdpe4Z
        lyqchhsf4Br1XVbRNf72cFukv6nmA/4kRc/QlUPpQOsPvq/3Y3CqQZ5XH5g4Rjla
        lRpAsW0EJgRqMV7yLr29HCwybMbVu/IJ6PF0PalvMhuKS/dMrK9sq+aKW5wrD6Zp
        Y96n0cw/XtmpeycOx6aS4iUAFSA6ZwczgnsJjHjquNFpZimrRb6/btgDMhZAJJK+
        qC/Sl18qG0gHPdI2MYNGwER5viTguUkh42sN9BJZH/h1efxCy9m9eQq8eikAEpfH
        mO1KNjWow+BB8KjV8rMb+bW35rsmCr1vcc6pdp92c4Ttxjc+ujNYyU8LfBV+2iIu
        nluVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=thyzE+sAVa5UfUziUkbnG1MO3sGUMaUzNI1j5+x0z
        YA=; b=ZqJ8mzLilWa+IU/l53MC9XODRxoHTilLbL0B9oaTRPCtZ1aHi1UAeH87/
        sen3+8MyRVLAKRey3GtBhx2j6ZoD3Cc6S251eEexgq8ZtK05I4yNkQUb5YA3Pjjh
        G08/n3YhhUvNNbyT5wU/HVI1SrwNFZCqI4qLRUj3yR9m7LBES+9ChP1NqLc2F+s4
        G2LqXXlZYLXZL3fm0n/u74R5rCAlmrR0RZWZFdWK2CubU4By+irJHJkgBj+nAmaP
        hw+e/GwiTeIV36YkRN4tjmbuwIMacd+rpr35ieYwKgD5d418n32owE/plfUYB78k
        MkG0J5fe3MFyxENktLEn3lN9wNYmw==
In-Reply-To: <c44a47f2-1de8-8a70-b31d-fa92b2547881@mail>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Thomas Luening <toml@thlu.de>, netfilter@vger.kernel.org

Hi Thomas,

On 26/08/2020 17:01, Thomas Luening wrote:
> Hi Kerin, hi David
> 
> Am 26.08.20 um 08:49 schrieb kfm@plushkava.net:
>> Your interpretation appears correct to me.
> 
> Thank you for your Answer! :-)
> 
>>
>> /*           sNO, sSS, sSR, sES, sFW, sCW, sLA, sTW, sCL, sS2   */
>> /*synack*/ { sIV, sIV, sSR, sIV, sIV, sIV, sIV, sIV, sIV, sSR },
> 
> That was a great help, but it is really heavy stuff. It's hard to work 
> through these tables and to understand them in context. While testing I 
> found that the xmas-statement is a rather weak protection, because it 
> seems to check for an explicit match of all given flags. If I use the 
> flags in various combinations...
> 
> nmap 10.0.1.200 --scanflags "URG ACK PSH RST SYN FIN" -p 631
> 
> ...it is noticeable, that some Packages was not recognized at all. But 
> the check for 'invalid' was always successful. Conclusion: The 
> xmas-statement is not a good choice.

I forgot to say that there is a sysctl which, if enabled, will log 
invalid packets. You can enable it by running:

   sysctl -w net.netfilter.nf_conntrack_log_invalid=1

Packets that fail the general flag combination check will then trigger a 
message containing the substring "invalid tcp flag combination", whereas 
packets that violate the rules of the state machine will trigger 
messages containing substrings such as "invalid state". Just look for 
the word, invalid, in general.

> 
> I believe that the problem can be closed. Thanks again for your help.
> 
> Best Regards, Tom

-- 
Kerin Millar
