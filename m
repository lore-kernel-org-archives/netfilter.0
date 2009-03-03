From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ULOGD:  suddenly not recording ANY connections
Date: Tue, 03 Mar 2009 17:06:38 +0100
Message-ID: <49AD558E.7010101@netfilter.org>
References: <F5E47532014E8E45A339717AF42215342F2B942BC3@hild.consultech.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F5E47532014E8E45A339717AF42215342F2B942BC3@hild.consultech.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dstorvik <dstorvik@consultech.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

dstorvik wrote:
> I setup ULOGD and everything was working, log was rotating nightly, everything was good. A few weeks later ( after a reboot) it stopped working.  The ulogd.conf file shows it is starting correctly and showing no errors but there is nothing output to the file.   I have checked all the configs and they look fine and every time I start it, it shows that it is starting fine but not a single packet gets recorded. The box it is running on is running as a NAT firewall for a saturated 25 Mbit connection so there is plenty to log( hence the nightly rotation).
> This is a fedora Core 9 System
> 
> Below is a copy of the once working conf file and the output of ulogd.log for a start of the daemon.  I only have one stack using ULOGEMU. Can anyone see why I would simply not get any output?

Are the kernel modules 'nf_conntrack_netlink' and 'nf_conntrack_ipv4'
loaded?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
