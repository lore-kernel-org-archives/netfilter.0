From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Fri, 03 Jun 2022 19:30:21 +0200
Message-ID: <877d5xodsi.fsf@alfa.kjonca>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
        <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1654277423; bh=TYBZLMLLSDyDPEo2QAeGaLydBt4ZbyFBuLFBOkOAfno=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=QdyXtxambtT9g9X8RzqlAOixd9fSSjkrTToNFH2GnJ4sUkB6p5RCaiNsGltlUGX+f
         wsNAseriBO8iI77HLKgpeV9o/3MbwUAOIdEcRLCgXttGgQ2W9Zn19BG/WF+pw+dxvO
         jlkVIeYlluClrAY7xuONH8ssXjmvG7VG4XDfNJJk=
In-Reply-To: <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
        (Stefan Riha's message of "Fri, 3 Jun 2022 14:54:41 +0000")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Stefan Riha <stefan@sriha.net> writes:

> Hi,
> 
> I'm a beginner and noticed than when I do e.g.
> 
> iptables -A INPUT ... -s 10.0.0.2/24 ...
> 
> this gets interpreted as "allow from source 10.0.0.0/24" i.e. from the
> entire network. I think it would be more beginner-proof if iptables
> would interpret this as incorrect input and error. Or at least,

I am afraid that you will not find allies here.
Interpreting this as bitmask notation is quite long tradition, and I am
afrait that noone wants to put extra code here,

KJ



-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
