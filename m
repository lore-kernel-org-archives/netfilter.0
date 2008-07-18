From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: MARK and CONNMARK
Date: Fri, 18 Jul 2008 10:08:43 -0500
Message-ID: <4880B1FB.6000106@riverviewtech.net>
References: <200807161046.39247.vladislav.kurz@webstep.net> <alpine.LNX.1.10.0807161156560.26724@fbirervta.pbzchgretzou.qr> <200807161233.51463.vladislav.kurz@webstep.net> <487E0F3B.3070904@riverviewtech.net> <487EED34.7000304@standarduniversal.com.au> <alpine.LNX.1.10.0807170916180.18697@fbirervta.pbzchgretzou.qr> <4880A977.4040100@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4880A977.4040100@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/18/08 09:32, Brian wrote:
> iptables -t mangle --list
> yields

...

> so it looks like it is ignoring the -o eth41 in the mark statement. It 
> appears to be working right, but looks not right...
> 
> how can  I see the -o eth41 in the iptables -t mangle --list command or 
> can I not

Add a "--verbose" (long) or "-v" (short) to the end of your command.

iptables -t mangle --list --verbose



Grant. . . .
