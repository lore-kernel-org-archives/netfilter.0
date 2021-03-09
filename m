From: "" <kfm@plushkava.net>
Subject: Re: [HEADS UP] bugzilla.netfilter.org is under maintainance
Date: Tue, 9 Mar 2021 15:40:31 +0000
Message-ID: <3ade6824-e805-b43c-ecc4-e906cdfb5f22@plushkava.net>
References: <20210308232625.GA24396@salvia> <20210309130417.GA1642@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=q
        oY0FXDn89OIlquWCo02Ec01LEnn/jo8zbH7e7R1rto=; b=VCAKz0aeD0HALB4kU
        xecyeG1zrNptuH92BxrbVEmu/kb8RV7CuMCuMTnMPwgRC3fbMi3DLKTgufZ/F2U5
        /OYmwUs1HO+yuhikLFNVM/ggLMJ3cS/3NVnvbHHL+SvGs+YcFOvRVG9DZVa9TVGf
        mMVJyq1SB7iwGv/Xz0hPeeh2j2YqFX/Ghiha1G+wgZvSKWszGPk6XMbvioMqiwFZ
        UOXtAUQ2jauCT+7XpB1+Mbmq+MIm4kra6/mZJ91MR2/R+SV0LgiRrnbWb7JKknf1
        lrS6/siy/+m10jjO918GaKBHlX55xYQKLJ23cz1PxKknXva1OZU7i00HxphGqSf6
        h8E6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=qoY0FXDn89OIlquWCo02Ec01LEnn/jo8zbH7e7R1r
        to=; b=d2iMeBU98lkauby2YL9vKbmkyREObirPm6+rVpmLtFVXSyPEScnx4WRg2
        ga6jYaCHNn/739JB4DMr1f5wDAE2VjAc1TvkncZH7k6awf9orYoDZxmTnZf2ZKqu
        sMu685k64jniWTivwrw63cIgrd2XloyLll4G1dEiS/xGw2HZ8AP5BD2A6UM+oxlN
        Y1CvNfRaVAWXQmirmp1ZLej3JrvVdCYYnaVr6BRPXqLvfStMP0xi6sYTqmc6ajKm
        TP6X1Ln4MrL4DyAHJuLWNPMdZgBoB/ziNy9ikmnJG+kzi+X5jOXD7GXCbMr5wjhm
        MBWtkcRpTx8taFWWQ5xB1f+hcWhEw==
In-Reply-To: <20210309130417.GA1642@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hi,

On 09/03/2021 13:04, Pablo Neira Ayuso wrote:
> On Tue, Mar 09, 2021 at 12:26:25AM +0100, Pablo Neira Ayuso wrote:
>> Hi!
>>
>> Short notice:
>>
>> bugzilla.netfilter.org is currently down / under maintainance, we're
>> expecting to bring it back soon.
>>
>> I will keep you all posted with updates.
> 
> Netfilter's bugzilla is back to operation.
> 
> Thanks for your patience.

I just tried to submit a new bug but posting to /post_bug.cgi results in 
HTTP 403 (Forbidden).

-- 
Kerin Millar
