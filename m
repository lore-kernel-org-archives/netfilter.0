From: dstorvik <dstorvik@consultech.net>
Subject: RE: ULOGD:  suddenly not recording ANY connections
Date: Tue, 3 Mar 2009 11:48:20 -0500
Message-ID: <F5E47532014E8E45A339717AF42215342F2B942BC9@hild.consultech.local>
References: <F5E47532014E8E45A339717AF42215342F2B942BC3@hild.consultech.local>
 <49AD558E.7010101@netfilter.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49AD558E.7010101@netfilter.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Pablo Neira Ayuso [mailto:pablo@netfilter.org]
> Sent: Tuesday, March 03, 2009 11:07 AM
> To: dstorvik
> Cc: netfilter@vger.kernel.org
> Subject: Re: ULOGD: suddenly not recording ANY connections
>
> dstorvik wrote:
> > I setup ULOGD and everything was working, log was rotating nightly,
> everything was good. A few weeks later ( after a reboot) it stopped
> working.  The ulogd.conf file shows it is starting correctly and
> showing no errors but there is nothing output to the file.   I have
> checked all the configs and they look fine and every time I start it,
> it shows that it is starting fine but not a single packet gets
> recorded. The box it is running on is running as a NAT firewall for a
> saturated 25 Mbit connection so there is plenty to log( hence the
> nightly rotation).
> > This is a fedora Core 9 System
> >
> > Below is a copy of the once working conf file and the output of
> ulogd.log for a start of the daemon.  I only have one stack using
> ULOGEMU. Can anyone see why I would simply not get any output?
>
> Are the kernel modules 'nf_conntrack_netlink' and 'nf_conntrack_ipv4'
> loaded?
>
> --
> "Los honestos son inadaptados sociales" -- Les Luthiers


Well I believe they were....I can't check now.  In the process of getting ready to upgrade conntrack-tools yesterday I upgraded the Libnfnetlink  to 0.0.40 from 0.0.39  and libnetfilter-conntrack to 0.0.99 from 0.0.97.
 I noticed this morning that ULOGD mysteriously started logging again as of around the time I was installing those newer libraries.... So I guess we're fixed but not sure exactly why it broke nor why it is now fixed... very frustrating.

Thanks for the quick response.

Derek
