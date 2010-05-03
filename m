From: Simon Tennant <simon@imaginator.com>
Subject: Re: DNAT issue (with added network diagram)
Date: Mon, 03 May 2010 18:52:08 +0200
Message-ID: <4BDEFF38.1000901@imaginator.com>
References: <4BDECE5A.4010808@imaginator.com>	 <alpine.LSU.2.01.1005031601340.29150@obet.zrqbmnf.qr>	 <4BDEDBE4.3020803@imaginator.com> <h2y7d7f2e8c1005030924kdb8bb20u9c71b7fa0d3a8ae6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272905543;
	bh=dynsThYml9Y+WU2gxTp6fXiRrBIxaB1h6m1rpWe73GY=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=BR5cxg7Ur/eT+Jl756P73fFelzbtQUjh61J3gm6CwhcG/fbCZg+pgldq122GJbPDE
	 7XgSPRzWaIjq/i6C6bcUvOfs3POfu8PX5fn9XapVmyc0G8lVMmqjlaa6+osr4Rgl/c
	 ffOjAO5Xe5GZRKIy6L9PZOboVuEHVrTFiqV7/cRg=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272905534;
	bh=dynsThYml9Y+WU2gxTp6fXiRrBIxaB1h6m1rpWe73GY=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=FGPeyt9aCdSgDSZoi2UCk1xAeQcfifOe9lYc7o67OmDAyPNjxsM/RG/TlOT5wWeX8
	 R74I3GOd5US9tryTbByheg6RPwU8fNQZeyYcWkj4ap1ur0MHFpJlLLnFAE5z9ci0x9
	 le4EMaYRkaOEVJu9VpUzKTChRiVgCtmmiitBYxG8=
In-Reply-To: <h2y7d7f2e8c1005030924kdb8bb20u9c71b7fa0d3a8ae6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Fink <sphink@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On 03/05/2010 18:24, Steve Fink wrote:
> iptables -t nat -A OUTPUT -p tcp -d maar --dport 443 -j DNAT
> --to-destination localhost:5222
>    
Perfect!  Works.  I was using PREROUTING instead of output:

iptables -t nat -A PREROUTING -p tcp -d maar --dport 443 -j DNAT 
--to-destination localhost:5222

Thanks.

S.

-- 
Simon Tennant

+44 20 7043 6756 (UK - office)
+49 17 8545 0880 (Germany - mobile)
+49 89 4209 55854 (Germany - office)
skype: simontennant
xmpp: simon@buddycloud.com

