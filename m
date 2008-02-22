From: Simon Jester <tanstaafl@libertytrek.org>
Subject: Re: Basic IPTables / firewall help?
Date: Fri, 22 Feb 2008 09:19:17 -0500
Message-ID: <47BED9E5.4090200@libertytrek.org>
References: <47BCA565.3000309@libertytrek.org> <47BCC9BF.9050509@riverviewtech.net> <004d01c87451$ab505240$01f0f6c0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004d01c87451$ab505240$01f0f6c0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

> I don't know if there is another list elsewhere or not. I'm sure
> there are lists but I would have no idea where to look other than
 > Google or distribution support pages.

I have read a few, but most make my head hurt. ;) Maybe this is one of 
those things that just doesn't make sense until one day a light bulb 
goes off.

what I'd like is just a bunch of commonly used rules, with simple, plain 
english explanations of each part of the rule - what it does, and why, 
and how it protects the system.

> To sort of answer what you want, you could do something like this:
> 
> If <packet(s)> match "x" do "this"
> If <packet(s)> match "y" do "that"
> If <packet(s)> match "z" do "something" 

Yes, but... the approach that makes the most sense to me is simply deny 
everything, then just open up what you want. The problem is, I don't 
know enough about the protocols involved (and/or the packets themselves) 
to understand all of the lingo surrounding what you can 'do' with them. 
I'm not a programmer, but I do like running my own servers because of 
the flexibility it provides.

> not to make too fine a point of it, but you'd probably go unnoticed at
> Times Square.

Lol... that would actually pretty much have been true 30 years ago (I 
spent 9 months on Governors Island in the Coast Guard in 78/79, and 
Times Square was extremely bizarre, especially at night) - but from what 
I understand, Guliani pretty much cleaned it up some years ago...

> i have difficult relating that, to someone, who, is running linux
> with a need to 'modify' firewall behaviour ...

Running a small server with only mail and web services running. I just 
want to lock down everything as much as is reasonably possible.

I have a hardware based firewall/router that blocks all incoming 
connections except the ports I am using (25, 443, 587 and 993), but I'd 
also like to know what else I can do local_firewall-wise to protect 
these ports even more from mis-behaving/malicious clients/connections.

One of my main goals right now is to install fail2ban to prevent 
dictionary attacks, but have been hesitant to do so, since I really 
don't understand IPTables...

> I'd like to add that there's a good iptables tutorial explaining most
> things there are to know and more when you're just starting with this,
> with examples. You can find it here:
> 
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Thanks for the replies...

I'll try the tutorial this weekend, and come back when I have questions...

Is it considered bad form to post current IPTables rules and ask for 
comments/critiques?
