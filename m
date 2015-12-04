From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Packet disappears after DNAT?
Date: Fri, 4 Dec 2015 14:55:36 +0300
Message-ID: <CAEzD07JQmLe_SetqcEg-EetvD=Et=2Zy47V53nA37q75FBv_NA@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=OI1R6Pj7Ll8HLBSfC9osmuNRxsEKZt059E+lS5w0j+k=;
        b=Y0l0uTsWQXmObX+GzB8r58rtoTidYv78Egsb3z4XAmW77lwhjuv2ng5i779+Z3DdrU
         xiKcPZOjSHHy2nBos9eHLS89I70V6fzGrhUwK4RKSGa72/d12Q1CSDHMbWLC+TQvPeSt
         nKGDLmMvCi7Z9846TFud72WQt6z13mlUVcpu7NuNbseAbMHyL9aB/r6otAticYq9D8+/
         R59jVadygmFMi7N3OVQdKA9WH+FPOBBGrl5FBnHdnPo6/dP1/NhWJnXwW6S+F6ZN6PJa
         kSOwh6Ztq1xuGAjiNJh+iEMT6zYB3sqL5Iv5599srENibaOxAxQ/sjVoeCDItmSF254x
         M98g==
In-Reply-To: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org

Hello.
Have you enabled the ip forward?

2015-12-04 12:43 GMT+03:00 Scott Bronson <bronson@rinspin.com>:
> Is there any reason for a packet to just disappear when it gets
> DNATed?  (other than rp_filter, which is disabled)
>
>
> Background:
>
> I have a typical libvirt setup, where VMs share a private network,
> and the host masquerades them onto the internet.
>
> In addition, the host is forwarding port 25 to a VM using DNAT.
>
>
> The Problem:
>
> I log into the VM and try to connect to port 25 on the host's public
> IP.
>
>   $ ncat u32.net 25
>
> On the VM, that command just times out.  It works from the internet
> and on the host (thanks Noel).
>
> Logging demonstrates that the VM sends the packet to the host just fine.
> Then, after the host DNATs it, it just disappears.  I would expect it to
> get routed back to the VM.
>
>
> More Details:
>
> The VM creates the packet: src=192.168.122.10:23456 dst=173.233.67.174:25
>
>   * it arrives on the host's raw:PREROUTING
>   * it moves to mangle:PREROUTING
>   * it then goes to nat:PREROUTING
>     * Rule 5 DNATs the destination to 192.168.122.10
>
> And that's it!  Nothing more happens, the packet is gone.
>
>
> Here's my research with tables and traces:
>   https://gist.github.com/bronson/c857a462edb0c6eeab2d
>
> Can anyone tell me what to look at here?  I'm stumped.
>
>     - Scott
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
