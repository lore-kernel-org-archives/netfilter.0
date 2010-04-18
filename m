From: Alessandro Vesely <vesely@tana.it>
Subject: Re: can we design a modified fail2ban ?
Date: Sun, 18 Apr 2010 15:46:36 +0200
Message-ID: <4BCB0D3C.3060006@tana.it>
References: <4BC7E028.8050209@infoservices.in> <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr> <4BC9DB51.6000407@tana.it> <alpine.LSU.2.01.1004171956030.10627@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1271598395; bh=52DV9PpSTG0YF2KdlV3dwMD7J7KFWwDZu7KAvNgLAa4=;
	l=2289;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=fak2uRcanyS6pdIEvw5eqe4D7rfkZN7omrTyF4xc5HIhcsOnFqBhnI1CKSy8iZQVY
	 60OjOr3Xlmq6J4vVGrtzxNwzNNGkWVUIXl9OFgE2aTg9XXC6jIwpwfHSXko4sirPx9
	 pQDKpk4+W/kcCEpf8PYzEySp/dF3Bp6wCWxV+qKw=
In-Reply-To: <alpine.LSU.2.01.1004171956030.10627@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 17/Apr/10 19:58, Jan Engelhardt wrote:
> On Saturday 2010-04-17 18:01, Alessandro Vesely wrote:
>>>  fail2ban has the ability - if I read its own short description right - to already use various blocking methods, including not only /etc/hosts.deny but also iptables.
>>
>>  I don't think it uses netfilter, though. I've read it has to restart a daemon in order to unlist an IP --not sure it's still so for the current version.
>
> Better know than think.

The bit I had read is "You currently have to restart the daemon to 
unban." in http://www.fail2ban.org/wiki/index.php/Features#0.9.0

However, reading slightly more carefully, that's about _manually_ 
unbanning an IP (e.g. a misconfigured client that locked out the whole 
office behind its NAT.)

> N.B.: If what http://en.wikipedia.org/wiki/Fail2ban says is not correct, by all means you should correct it.
>
> Besides, if it is accurate, it uses iptables, not directly Netfilter.

Correct. Browsing action.d/iptables.conf one finds

  # Option:  actionban
  # Notes.:  command executed when banning an IP. Take care that the
  #          command is executed with Fail2Ban user rights.
  # Tags:    <ip>  IP address
  #          <failures>  number of failures
  #          <time>  unix timestamp of the ban time
  # Values:  CMD
  #
  actionban = iptables -I fail2ban-<name> 1 -s <ip> -j DROP

  # Option:  actionunban
  # Notes.:  command executed when unbanning an IP. Take care that the
  #          command is executed with Fail2Ban user rights.
  # Tags:    <ip>  IP address
  #          <failures>  number of failures
  #          <time>  unix timestamp of the ban time
  # Values:  CMD
  #
  actionunban = iptables -D fail2ban-<name> -s <ip> -j DROP

I think the daemon just executes those commands, after replacing the 
tags. I don't know whether fail2ban uses some other storage to 
remember frequently banned IPs.

How would you compare iptables and netfilter? I mean fail2ban actions 
versus looking up a b-tree file, in terms of rough memory consumption 
and responsiveness expectations? For the max number of entries, I 
reckon b-trees can allow to map the entire IPv4 address space within 
1Tb of mass storage. But what might be the difference with usual volumes?
