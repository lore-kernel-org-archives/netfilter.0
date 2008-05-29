From: Mark Baker <mbaker824@gmail.com>
Subject: Re: Site-specific filter rules problem
Date: Wed, 28 May 2008 22:02:41 -0700
Message-ID: <1212037361.7205.14.camel@u804mbr>
References: <1211702139.7164.22.camel@u804mbr>
	 <483C1AAE.1010709@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=U3EdwXfiWgMJHd5wnByV3vG9EJCsNvEo6DngSxk+Yms=;
        b=lKnwK3s9/iGzTAujShJY1ql9gCEy6415mJ6hjj6xK2Rg+G09tfbNEO0XYTydHXNwqQYRuR+Mvu28u77yoGCN/NAWiOiAnglgvcsuauLB2yEWDVQGpM07pzQDEiWcMNkvqNY29M2QqsveNvlOcPmTmpbGUdjYtPc1zKewhLl2Xuw=
In-Reply-To: <483C1AAE.1010709@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tue, 2008-05-27 at 09:29 -0500, Grant Taylor wrote:
> On 05/25/08 02:55, Mark Baker wrote:
> > I have packet captures from connections to this site, with and 
> > without firewall rules installed.  I don't see anything that should 
> > be blocked based on these rules - the only thing odd is that when the 
> > problem occurs I get a ton of retransmissions from the server. 
> > Another oddity in both cases is that virtually every packet coming 
> > from the server is fragmented; but from what I've read, connection 
> > tracking (which is running on this machine) should completely 
> > reassemble fragmented packets before delivery to the filter table. 
> > Still, could fragmentation be the problem?
> 
> Based on the retransmissions, it sounds like something is expecting to 
> get something through and have it acknowledged that is not.
> 
> I'd look at what is being re-transmitted and see if it needs to get 
> through and / or if there is an unacknowledged reply that is being blocked.
> 
> 
> 
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks for the advice, Grant.  Keeping in mind that I'm only having this
problem with one site and therefore it must be doing something
differently, I did a little more playing and found out I could eliminate
the problem by adding the following rule after my state rule, like this:

$IPT -t filter -A U804-input -m state --state RELATED,ESTABLISHED -j
ACCEPT

$IPT -t filter -A U804-input -s $ANGELIP -p tcp -m tcp --sport 80
--dport 1024:65535 ! --syn -j LOG

$IPT -t filter -A U804-input -s $ANGELIP -p tcp -m tcp --sport 80
--dport 1024:65535 ! --syn -j ACCEPT

After adding the next 2nd and 3rd rules above, I found that huge numbers
of packets were getting past my state rule, but it cured the problem.
When I compare the logged packets to /proc/net/nf_conntrack, though, I
find that the sockets identified in the missed packets matched
established connections listed in nf_conntrack, so I'm still not sure
why they were being missed. 

I played around with it a bit more, and found that if I set
nf_conntrack_tcp_be_liberal=1, virtually everything is accepted by my
state rule (although by the end of the session with the problem site, 3
out of about 3500 packets had still gotten through somehow).  The only
problem is, I don't fully understand the ramifications of that setting.
I spent a lot of time searching, but have found little information on
the nf_conntrack settings in /proc/sys/net/netfilter.

Can anyone help me understand exactly what nf_conntrack_tcp_be_liberal
does?  Also, what about nf_conntrack_tcp_loose?  If anyone can tell me
where to find documentation on the nf_conntrack parameters, that would
be even better.

Thanks,
Mark

