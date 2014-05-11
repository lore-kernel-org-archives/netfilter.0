From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Losing connection between nat and filter tables
Date: Sun, 11 May 2014 12:02:26 +0200
Message-ID: <536F4AB2.7020809@chello.at>
References: <536CECA8.1000604@riosoft.com.br>	<CAEzD07JLeCTxUT_rR3H6QDv6_jVH2mFH1q8B2T4EvtJsDGqF1g@mail.gmail.com>	<536CFE75.90005@riosoft.com.br> <CAEzD07LqPgQiftaS6831c2-7Kw0XM=3i84+4WX6XN2GSX0k6Qw@mail.gmail.com> <536D3E84.5020102@riosoft.com.br> <536D4983.8040105@chello.at> <536D7375.9090909@riosoft.com.br>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <536D7375.9090909@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: Anton Danilov <littlesmilingcloud@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 10.05.2014 02:31, Bruno de Paula Larini wrote:
> Wow, thank you Mart! I didn't really think that the rp_filter would have
> anything to do with it, but in fact it had! Even though I had disabled
> for "all" interfaces, it seems that the rp_filter files for each
> interface overlaps "all".
> So,
>
> echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter
>
> solved the problem of disappearing packets.
>
> But unlike the eth1 interface, the RELATED state isn't allowing (or
> recognizing) the data channel. After doing a DNAT from port 49152 to
> 65535, the default data ports for MS FTP, I can now successfully connect
> through the second interface. I don't think there's a workaround for
> that, right?
> Even so, I'm glad you guys could help me.
> Thanks a lot!
>

-t raw -j CT --helper ftp-xyz (where xyz is your desired port number).



