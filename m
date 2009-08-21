From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: try to change os fingerprint
Date: Fri, 21 Aug 2009 07:49:48 -0400
Message-ID: <1250855388.6489.21.camel@jaspav.missionsit.net.missionsit.net>
References: <4A8E5BD6.5040904@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A8E5BD6.5040904@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org

On Fri, 2009-08-21 at 14:03 +0530, J. Bakshi wrote:
> Hello,
> 
> I am trying to change the OS fingerprint with iptables. Here are two
> rule set which I have constructed to do the same
> 
> ````````
> iptables -t mangle -A PREROUTING - -j PERS --tweak dst --local --conf
> example/win9x.conf
> iptables -t mangle -A OUTPUT -j PERS --tweak src --local --conf
> example/win9x.conf
> ````````````
> 
> But it throws an error like
> 
> ``````````
> iptables v1.4.2-rc1: Unknown arg `--tweak'
> Try `iptables -h' or 'iptables --help' for more information.
> ```````````````
> 
> What might be the problem here ?
> Thanks
<snip>
I'm not familiar with the PERS target.  It does not show up in my
iptables.  Is it available in your kernel or do you need to load and
perhaps compile a module for it? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

