From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: 192.168.2.33/24 & 192.168.2.33/29 on the same box
Date: Mon, 7 Apr 2014 07:57:00 -0500
Message-ID: <20140407125700.GH32069@harrier.slackbuilds.org>
References: <534292C8.2070301@yahoo.co.uk>
Reply-To: netfilter <netfilter@vger.kernel.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <534292C8.2070301@yahoo.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

On Mon, Apr 07, 2014 at 12:58:00PM +0100, lejeczek wrote:
> I'm hoping an expert could help me, clarify this one for me, should 
> be simple I guess, probably not for a newbie like me
> 
> having on one system
> 
> physical eth 192.168.2.33/24
> and a
> bridge (only taps no phys) 192.168.2.33/29

When you're going to bridge an interface, you assign it "0.0.0.0/0" 
(which is to bring it up.) Then you assign an IP address to the 
bridge.

No time to look it up for you right now, but I believe the brctl(8) 
manual should cover this.

> I cannot get to anything behind 192.168.2.33/29 from anything 
> behind 192.168.2.33/24 (and vice versa)

Broken bridge, I guess.

> each side can get respectively tofurther-out interface of the 
> 192.168.2.33 routing + forwarding I have it set up all I believe
> 
> is such a configuration even valid? should be, right?
>
> I'm trying to understand subnet concept of, in this case class C

Do yourself a favor: totally forget about "class".

> private net - is 192.168.2.33/29 still a part of 192.168.2.33/24
> or it is a whole separate network.

It is indeed a part. To turn those addresses into valid CIDR 
expressions, change the last quads to be the network address:

1. 192.168.2.33/29 becomes 192.168.2.32/29
   This includes IP addresses 192.168.2.32 through .39
2. 192.168.2.33/24 becomes 192.168.2.0/24
   This includes IP addresses 192.168.2.0 through .255
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
