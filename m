From: "Daniel Tiebler" <daniel.tiebler@tik.uni-stuttgart.de>
Subject: iptables-normalizet: argument normalization and DNS resolution?
Date: Wed, 09 Apr 2014 14:10:53 +0200
Message-ID: <web-181154039@uni-stuttgart.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	rus.uni-stuttgart.de; h=content-transfer-encoding:content-type
	:content-type:message-id:date:date:x-mailer:subject:subject:from
	:from:received:received:received; s=dkim20100209; t=1397045456;
	 x=1398859857; bh=p63e52prHXgNetWsFqi1s1gGr6D2uKIXYpquPgGyG4s=; b=
	jytV9I0GO4hQKLgKZA/cv9IRzGpdXmfL3g9SOnvczB2Oo/zwLDjBr8q2kQPPe+S5
	XTH3Om7dgV4K+GXrkennnS7gL9/fK0gsnK8LhCI0h0+qnqak0ETcb4UulGNmqT0D
	BIe6dsOskU62GD4OJ8hsf8FZAO0758z7LuMdk5ovtSI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I found a thread on the mailing list "netfilter", where 
somebody else was also looking for a normalization (see 
http://marc.info/?t=127538152000002&r=1&w=2 ), but there 
was no solution.

I am looking for the features
* normalization of commandline arguments and
* resolution of DNS names
to convert a configuration file into iptables-save format.

As the manpage constitutes using DNS has its quirks, but 
we want to introduce monitoring against our running 
configuration for cases, where we do see a benefit of 
using DNS names.

If this has been already discussed or fixed elsewhere, 
please do not hesitate to point me to any relevant 
documentation. I'll be happy to RTFM.

The current state of the firewall can be obtained using 
iptables-save. That's clear. But our configuration files 
are calling iptables, so that we cannot compare the output 
of iptables-save with our configuration files directly. We 
could save the state of the firewall immediately after a 
new configuration, but we also want to track changes of IP 
adresses resolved from DNS names. The resulting diff would 
also catch cases, where some "hotfix" has been accidently 
rolled out to the machine, however not yet been added to 
the configuration.

We started to implement a tool, that is parsing the 
commandline arguments of iptables and generating an output 
comparable to the output of iptables-save. However, the 
more complex the rules are the more expensive is the 
development. So we thought of reusing the iptables source 
code.

The idea is the following: Use the parser of iptables and, 
instead of loading the rules into the kernel, output them 
with the generator of iptables-save. I tried the following 
(with version 1.4.12 of iptables on Ubuntu Server 12.04.4 
LTS): I copied the do_output() function from 
iptables-save.c to iptables-restore.c and added the 
missing includes and variable declarations. Then I added 
the struct iptc_handle as an additional argument to this 
function. When iptables-restore reaches the COMMIT line, 
instead of iptc_commit() the function do_output() is 
called. Well, this works pretty well, at first glance. 
But, there are still many calls to the kernel loading the 
data structure iptc_handle and this normalization should 
happen without touching the data structures of the kernel. 
It would be great, if there would be an API, that provides 
this functionality, or even a programm (called 
iptables-convert?).

So our questions are:
* Does a program exists, that can parse calls to iptables 
and output something comparable to iptables-save?
* Is there another solution to our problem?
* Is something similar possible with nftables?

Many thanks in advance.

With kind regards,
Daniel Tiebler
