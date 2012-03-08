From: Andrew Beverley <andy@andybev.com>
Subject: Re: Run a userspace script upon rule matching?
Date: Thu, 08 Mar 2012 17:19:29 +0000
Message-ID: <1331227169.30413.432.camel@andrew-desktop>
References: <4F58AA04.4010805@brain-force.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F58AA04.4010805@brain-force.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1331227173;
	bh=jB1U5pqj6dg06ct0glYzwglnrol+qTLjFpAVOPS9xUQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=Qhc/BnIyW/DGcB1IITA2j1XT8/RPU4yUVTF81nlx6RNDFNNie6s1Sfy8weou6PHUR
	 DOBUOv1mkJRHA+sSgqnyT85FqK5vZAU9I0BrIuz24Zh58I6zr2FBt6VpJ1t2IZhwmB
	 7vziI0ILdfF5/McF5U8qnLguQXa91TNZxO2aI1b0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tobster@brain-force.ch
Cc: netfilter@vger.kernel.org

On Thu, 2012-03-08 at 13:45 +0100, tobi wrote:
> As mentioned in subject I want to run an external script upon matching
> of a certain rule.

I'm not aware of any way to do that. What exactly do you want to
achieve? It may be that there is another way of doing what you want.

Andy


