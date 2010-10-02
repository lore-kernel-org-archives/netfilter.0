From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 02 Oct 2010 11:36:43 +0100
Message-ID: <4CA70B3B.90001@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Rq5Xg0FtCcgmx4nSxhE3xZdFawe6fIirB7xgecxagdA=;
        b=cezm8Et7Gws2B3N94MvR7p0+UdUlUiROCuuICxkshDAQiy8jqH+/H6+j6lR/4SYp3O
         ilV0b1m9Dpl2gOKj1tBUwEvCsYtVFu+mXgriqntpb1byFyLF8fACBd+seM6CgQNDW03A
         xt0L1FZrgGSI/x9eNdP782hFMAl2e+SHffINw=
In-Reply-To: <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> Thanks for the complete description - I have just released ipset 4.4 which 
> fixes this nasty bug.
>   
No worries - I was surprised to find it as ipporthash in particular 
should have been widely used in practice. As for ipportiphash and 
ipportnethash - there were recently included in the distribution due to 
another bug I found when compiling xtables (even though ipportiphash and 
ipportnethash were compiled the .ko files were never included in the 
final release making it impossible to use these two construct types).

A couple of questions and ideas for future releases:

1. Normally I used to get ipset as part of the xtables source. Is that 
still the case or do I have to download the ipset source and compile it 
separately to get the latest changes you made?
2. Related to that question - I used to get the xtables .src.rpm from 
which to compile the code and make an installation rpm. I don't seem to 
be able to do that any longer as all fedora repos are too slow to update 
the latest changes. Do you have a link from which I could get the latest 
changes in ipset/xtables in src.rpm which allows me to build an 
installation rpm. The reason I am asking this is because I am building 
an update images on all my machines (using kickstart) and need the 
installation rpms with the latest changes you made. Compiling this from 
source won't be possible as there is now way I could install this as 
part of the image-building process.

I think you mentioned that in future releases the restrictions on all 
*hash constructs (with regards to using /16 - B class - IP addresses) 
will be removed. Could you confirm that is still the case?

Would it be possible to include a new construct - IP,port,IP,port 
(without IP address restriction) - and how difficult is this to implement?

Similar question - would it be possible to include protocol (either by 
name or its number) as part of all available constructs for matching? 
The reason for this is that, as it stands, in order for me to match, 
say, "IP,port" hosts form my personal VPN I need to use two separate 
sets - one for UDP and one for TCP and I also to create two separate 
statements for iptables (one for tcp and one for udp), which is a bit of 
a waste and not very easy to administer. It would be nice if I could use 
"IP,protocol", "port,protocol", "IP,port,protocol", 
"IP,port,IP,protocol", "IP,port,IP/cidr,protocol" and so forth.
