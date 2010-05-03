From: Simon Tennant <simon@imaginator.com>
Subject: Re: DNAT issue (with added network diagram)
Date: Mon, 03 May 2010 16:21:24 +0200
Message-ID: <4BDEDBE4.3020803@imaginator.com>
References: <4BDECE5A.4010808@imaginator.com> <alpine.LSU.2.01.1005031601340.29150@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272896490;
	bh=C3OIYlE1rWEdZMFwv4ImM9byM+4emOaQB8RKVe7qrz8=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=BDlXKIekeenxsAAl0EKUzkTZ5F1uEFOQpnDz0/KKyRmw7h26l1UWso8TOgiH9pAnh
	 mpGlEIcwOew6fqAIfoCXX+fTuVJNlMRsMjk+C88QX7WYPspigAvon0NlCPL0vL/CIi
	 /5ts7SW3bdNrzPzFFwGuy+CJzHJ0kozPFqSoQWJc=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272896485;
	bh=C3OIYlE1rWEdZMFwv4ImM9byM+4emOaQB8RKVe7qrz8=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=HBGCVVvX72y2HvbbOQ92FXz9vhlowHRbJM9dugWUt0N8dpjiXOSjRNvxLN0ak/WcY
	 9kYRoDddbJI+MNCFsM4m3ynsofIrN98WBPa3Cl0PzQvrplTwzHTPdl7266h104fjS3
	 bVoigjR7Mh2Vl2FAxXnv5bAiEhya4p+HYxe6vti8=
In-Reply-To: <alpine.LSU.2.01.1005031601340.29150@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 03/05/2010 16:01, Jan Engelhardt wrote:
>> My question is what DNAT or SNAT rules do we need to add to cave or to maar so
>> that remote *and local (originating from cave)* clients can make xmpp
>> connecitons on 443 and end up on cave:5222?\
>>      
> Since they have all public addresses, no NAT is needed.
>    
Just to clarify: both services run on one host.  The second host (maar) 
doesn't host any services and shouldn't. It's role in this is just 
forwarding maar:443 -> cave:5222.  Ordinarily I'd just have a listener 
for xmpp on cave:443 but that's taken by apache.  Hence this packet 
wangling.

S.

-- 
Simon Tennant

+44 20 7043 6756 (UK - office)
+49 17 8545 0880 (Germany - mobile)
+49 89 4209 55854 (Germany - office)
skype: simontennant
xmpp: simon@buddycloud.com

