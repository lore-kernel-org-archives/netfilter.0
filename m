From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables TRACE not logged
Date: Fri, 11 Sep 2015 17:37:51 +0200
Message-ID: <20150911153751.GA3581@salvia>
References: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
 <20150911122803.GA5460@salvia>
 <CABLYT9i-i5oaXkAmeVSXGbsob5kfcX5RQM8xktzAj7f273BriQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABLYT9i-i5oaXkAmeVSXGbsob5kfcX5RQM8xktzAj7f273BriQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vieri Di Paola <vieridipaola@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, Sep 11, 2015 at 03:31:05PM +0200, Vieri Di Paola wrote:
> [sorry, I previously replied only to Pablo instead of the mailing list]
> 
> # cat /proc/net/netfilter/nf_log
>  0 NONE (nfnetlink_log)
>  1 NONE (nfnetlink_log)
>  2 nfnetlink_log (nf_log_ipv4,nfnetlink_log)
>  3 NONE (nfnetlink_log)
>  4 NONE (nfnetlink_log)
>  5 NONE (nfnetlink_log)
>  6 NONE (nfnetlink_log)
>  7 NONE (nfnetlink_log)
>  8 NONE (nfnetlink_log)
>  9 NONE (nfnetlink_log)
> 10 NONE (nfnetlink_log)
> 11 NONE (nfnetlink_log)
> 12 NONE (nfnetlink_log)
> 
> Do I need to change the backend?
> eg. sysctl net.netfilter.nf_log.2=ipt_LOG

You have to switch to nf_log_ipv4, yes. Otherwise the trace messages
go to nfnetlink_log, thus you'll need ulogd2, which is something that
you may not need in your setup.
