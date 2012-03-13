From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: comments about local loopback interface rule granularity
Date: Tue, 13 Mar 2012 10:11:46 -0500
Message-ID: <20120313151146.GV24983@harrier.slackbuilds.org>
References: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMmbHwnH1YSW8vFJu2aoFSnY-vSDRS9KtGdhSe2G=tdyhGgmsg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Mar 13, 2012 at 02:28:00PM +0000, paddy joesoap wrote:
> What is the correct local loopback iptables rules for a single
> hosted firewall (laptop)?

"Correct" might vary by needs, don't you think?

> I often see the following:
> 
> iptables -A INPUT -i lo -j ACCEPT

This is generally a good idea.

> iptables -A OUTPUT -o lo -j ACCEPT
> 
> where a default DROP policy is applied to both INPUT and
> OUTPUT chains.

rob0 rule of thumb: if you have to ask for help to make it work, you 
don't need and shouldn't use OUTPUT filtering. Just say no to DROP.

> I notice with this configuration I can ping the localhost
> (as expected) but I also can ping the local IP address of the
> machine!
> 
> Why is this this the case with respect to the local IP address?

When a local process tries to reach a locally-bound IP address, the
packets therefrom are routed through the loopback interface.

> Is this the correct set of rules?
> 
> iptables -A INPUT -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -o lo -d 127.0.0.1 -j ACCEPT
> 
> With this configuration I can ping the localhost (as expected)
> but NOT also ping the local IP address of the machine :-)

If that's what you want for some reason, I suppose it's correct for
you. I don't see the point.

> The loacal IP address of the machine is tied to a real
> interface such as eth0 and therefore no ping packets this time
> as expected.
> 
> I presume the only traffic that should ever communicate with
> the "lo" interface is traffic to and from IP address 127.0.0.1.

Why? The folks who designed your kernel's IP stack did not agree.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
