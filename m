From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Connection tracking counters increasing
Date: Fri, 08 Mar 2013 04:19:53 -0800
Message-ID: <assp.1779ede145.5139D769.8040606@amfes.com>
References: <5138BC91.9060903@amfes.com>  <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr>  <5138C95B.1080405@amfes.com> <1362733731.16176.6.camel@xwu-ThinkPad-T420>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=7IWjKwz4+VEnjfB3Vd786varxX0=; b=8nFwfqefo0IfDBNabF5YIozKkWHovh4kug+bPz0cIInAqAzuqcA4rwWZWZhZAcg8OGZL4Zm1MbE1gjfVUKtyG88IUMHyyG9SdURzHikVUnfXrhSP7WmtubLPRoKag67uVi27NFWWbKwCZiBAtNPzp5RLxdYUVfcqaWsoNxcytQ0=
In-Reply-To: <1362733731.16176.6.camel@xwu-ThinkPad-T420>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter-Users <netfilter@vger.kernel.org>

On 3/8/2013 1:08 AM, Xiong Wu wrote:
> Hi Daniel,
>
> Do you try to turn off nf_conntrack_tcp_loose as below:
>
> echo 0 > /proc/sys/net/netfilter/nf_conntrack_tcp_loose
>
I just tried that.  No apparent difference, counters continue to 
increase.  Now at 32322.

--
Daniel
