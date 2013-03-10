From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Netfilter applied to specific interfaces only
Date: Sun, 10 Mar 2013 10:34:36 -0400
Message-ID: <CACuyg26567c3v=4fph1LMOAhPm6HW1yT8YXX1madzWyoLeqCSg@mail.gmail.com>
References: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=n83R2nNFAZ7LfMD3cC14qp/zhF/f2eFQbAOPW0TxJbA=;
        b=O7sikaSuXshofYV61G6mNS0fFSKI9T7b3Uu3TBtz7SOn8FIN/G6nnc2hNIMUYUE1Us
         bhh1p33cbxLOqdGum7bzfbYobCjMgbtDVO2jz6y7rAdD3JtLVtF3ON8bhp2/FtNsp1XJ
         HZvi560AgzAbmEHOuSau+Nodm6e6amY9R+Kz+EPCwCl/80OYCEf9dGM43Bdq5oDIOVxP
         CHFb5wHkXr91riScCIYKeWhc+BjwVKyMey5oiDcxxAqCkonUEtEfMENYiQL1yJGLr9ox
         WlujYWlFpWHR6YbrB0Te9/1oaLNifUcwS4XcHlH0V2X1TWauB4LWXGEEl6fHwrzO9nJI
         4hhQ==
In-Reply-To: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Mellander <jmellander@lbl.gov>
Cc: netfilter@vger.kernel.org

Hi,

This is an much discussed issue in firewall forums.
I need to study a little more about it, but my current opinion:

1. The servers should not do "any filtering" - except in specific
cases. They should be placed in a DMZ segment or serverfarm. However,
the access to these segments is controlled by a firewall (clustered or
not). So, you can focus on optimizing firewalls.

2. I don't believe there is a native solution for this issue. It's not
for nothing that the business solutions that promise this are the
highest price. This is the kind of solution you'll have to "design" -
If you want a fairly significant performance gain.
- Search for "fpga firewall".
  Something like this: http://netfpga.org/ or
http://www.xilinx.com/products/intellectual-property/TEMAC.htm

- You can also look for solutions based on GPU.
  Take a look at the Suricata project
(http://suricata-ids.org/features/) - Experimental GPU (Unfortunately
it is still experimental).




2013/3/8 Jim Mellander <jmellander@lbl.gov>:
> Greetings.
>
> In the HPC world, and in network intrusion detection, network
> performance is paramount.  We've found that just having the iptables
> kernel module loaded without any ruleset substantially reduces
> performance at high traffic rates.  Some preliminary performance
> measurements:
>
> The total traffic (reported by the iperfs) was:
>
> ~18 Gbps with IPTables enabled - no ruleset
> ~24 Gbps with IPTables disabled
>
> Disabling IPTables (and unloading the associated kernel modules)
> seemed to significantly improve performance, but running with IPTables
> disabled in production is undesirable.
>
> Typically, we have interfaces that are external facing that we would
> like to run IPtables on, but the internal interfaces which are just
> for internal cluster communications must run as fast as possible.  A
> similar issue occurs during high-speed network intrusion detection -
> we want the management interface to be subject to iptables, but we
> don't want the performance hit of netfilter impeding traffic at the
> interfaces monitoring the network.
>
> So, what would be desirable to see is a sysctl setting that would tell
> netfilter to *completely* stay out of the way on a per-interface
> basis.  Many supercomputers run linux, and it would be nice to also
> run iptables, but the performance hit is unacceptable.
>
> Thanks in advance,
>
> Jim Mellander
> NERSC Cybersecurty
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
