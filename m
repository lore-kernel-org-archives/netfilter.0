From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Connection tracking counters increasing
Date: Thu, 07 Mar 2013 09:07:39 -0800
Message-ID: <assp.0778ebbb31.5138C95B.1080405@amfes.com>
References: <5138BC91.9060903@amfes.com> <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=i2bibg9wVASwcgHTGAGm/aUjv9M=; b=Cws7akSW5ARppi2qMRVCbz1Gf6cgq+sTO/qfkLOecdMh8UbQYAw/x+62FphOHg9owZhXWnw4IwtYXuUm4eUNfBIKUl8Ti4TZeSGZXHaIpU3hcDW+EkyTb556EjlYIBEZ2uGJVl3gdrJ75k6VKcXuaNjp3pXYSZyYRj/dG77UN3E=
In-Reply-To: <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-Users <netfilter@vger.kernel.org>

On 3/7/2013 8:29 AM, Jan Engelhardt wrote:
> On Thursday 2013-03-07 17:13, Daniel L. Miller wrote:
>
>> I've noticed that my connection tracking counters keep increasing -
> Which counters?
>
/proc/sys/net/netfilter/nf_conntrack_count

and when it reaches /proc/sys/net/netfilter/nf_conntrack_max things break.

-- 
Daniel

