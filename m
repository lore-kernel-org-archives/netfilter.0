From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Help with stateless firewall
Date: Mon, 12 Aug 2013 16:41:51 -0500
Message-ID: <20130812214151.GE13717@harrier.slackbuilds.org>
References: <5209377B.5030105@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5209377B.5030105@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Aug 12, 2013 at 01:28:59PM -0600, Alex Flex wrote:
> Iam working with a stateless firewall to help keep up with DoS
> and a state flood. I have a few doubts about my setup:

What is a "state flood"? Why do you think a stateless firewall is 
superior, or even desirable?

> a.) When allowing web traffic, is it neecessary to allow port
> range 1000:65535 ?

Regardless of the inbound port or protocol, for most, you *must* 
accept return traffic, or the connection cannot be made.

> i saw that due to this rule sending packets to those ports
> directly respond with a REJECT instead of a DROP which is
> preffered. Any work arround and still have a stateless setup?
> 
> b.) What is needed to safely have a default OUTPUT DROP,

rob0 Rule of Thumb: If you need help to make it work, you do not need 
OUTPUT filtering. Just say No to DROP. :)

Why do you want OUTPUT DROP? What are you defending against? 
Generally a stronger and more effective defense against hostile 
system users would be something like SELinux. Another good idea: 
don't give untrusted people shell access.

> apparently as soon as i change it to that iam unable to access it 
> via ssh, even if I add a rule like this: /sbin/iptables -A OUTPUT 
> -p tcp --dport 22 -j ACCEPT

See --sport in the manual. It seems that you have confused what you 
might have as source or destination port.

> Thanks for your help.
> Alex
> 
> #!/bin/bash
[snip]

Scripting like this is the wrong way to go about loading a ruleset. 
Dump your ruleset using iptables-save(8) and load it at boot time 
using iptables-restore(8). These might help:

http://inai.de/links/iptables/
http://inai.de/documents/Perfect_Ruleset.pdf
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
