From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Connection tracking counters increasing
Date: Fri, 08 Mar 2013 09:42:53 -0800
Message-ID: <assp.077982f054.513A231D.6070903@amfes.com>
References: <5138BC91.9060903@amfes.com>  <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr>  <5138C95B.1080405@amfes.com> <1362733731.16176.6.camel@xwu-ThinkPad-T420> <5139D769.8040606@amfes.com> <17135FC4-FCB8-4E44-843E-3AF0E80C8400@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=xnfok10GWxZgk4onlg/nmPUFqMk=; b=am1VBta0zzJWxtnqpUWokXBhPotWScBV9EonOBb5p3Q8KZNVj5cQI+B72bfQBXgJxp2jDPtCmS70j0E5aFkRa2qieEyKA/nJMYGfmna0pB0FhDCjah7FXScx1AI1t++B4cMJCDtFR5V5qAd2WptuAuKbnssNHe90w2a472MveEs=
In-Reply-To: <17135FC4-FCB8-4E44-843E-3AF0E80C8400@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter-Users <netfilter@vger.kernel.org>

On 3/8/2013 4:31 AM, Alex Bligh wrote:
> On 8 Mar 2013, at 12:19, Daniel L. Miller wrote:
>
>> I just tried that.  No apparent difference, counters continue to increase.  Now at 32322.
> Does conntrack -L list anything?
>

Yes - the number fluctuates around 100 entries.

-- 
Daniel

