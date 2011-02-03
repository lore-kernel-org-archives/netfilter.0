From: Andrew Beverley <andy@andybev.com>
Subject: Re: Fw: shaping vlans - revisited
Date: Thu, 03 Feb 2011 18:50:48 +0000
Message-ID: <1296759048.7587.3.camel@andybev>
References: <20110203152944.635b42e8@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296759055; bh=VXaO+gu7KzT0+6EraiJc5xT3Tr3GMT/aSiAZI
	idBeXI=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=cc6AVSK+
	92LDlFZSQBQu08RwwcO/zw80rj7jBAuqj833IpqRFuFOzWi5FakePmGTqiFEHQLh6Pi
	7k6AjkRo9MCLYqD7gM6j3GMc5+Nteg8v41w6iQohtGFzQwPCAmK8OZma4CD0Tfu8oOi
	P7FpT1AnpwIfem2zVRQ23kmBvCVu4=
In-Reply-To: <20110203152944.635b42e8@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

On Thu, 2011-02-03 at 15:29 -0200, Ethy H. Brito wrote:
> On Thu, 3 Feb 2011 16:46:53 +0100
> Marek Kierdelewicz <marek@piasta.pl> wrote:
> 
> > >Hi All
> > 
> > Hi,
> > 
> > >I can see the counters increase (tc -s ...) for classid 1:2345 (eth0)
> > >but they are zero for classid 2:2345 (eth1 - which the vlans are
> > >attached in)
> > 
> > Are you seeing any traffic on root class on eth1? 
> 
> Yes I am.
> 

Are you sure you are marking packets correctly *both* ways? Just because
they are being marked in one direction, doesn't mean that they are being
marked in the other direction.

If you add an iptables rule to LOG your traffic on that interface, then
you will be able to see the mark value.

Otherwise, if you're seeing traffic in the root class but not in the
leaf class, then that would imply that there is something wrong with the
filter.

Andy


