From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Tue, 27 Jan 2009 00:01:04 +0100
Message-ID: <497E40B0.2090709@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <497E0EA9.1020408@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Hi again Yoann,

Yoann Juet wrote:
> Hi pablo !
> 
>> that were fixed in the subsequent kernel releases, but I did not know
>> any that affected the internal TCP flags set/unset. As these stuff is
>> under development, I suggest you to use the latest Linux kernel,
>> please let me know if the problem persists.
> 
> I still have the same symptoms with a 2.6.28-2 kernel. My testbed is not
> so far away from yours:
> 
> You                Me
> ----------------------------------
> Etch <->         Lenny
> 2.6.28 <->         2.6.28-2
> conntrack 0.9.9? <->     conntrack 0.9.9
> ftfw mode <->         ftfw mode
> keepalived 1.1.15 <->     heartbeat 2.1.3
> no virtualization <->     KVM with net virtio

Indeed, very similar.

> On your opinion, could it be the side effect of KVM ? Unfortunately, I
> cannot do without KVM, and cannot test easily without...

I'm not familiar with KVM, but before pointing to it as the problem
(since I think that it is transparent to conntrackd). Could you try
latest conntrack-tools 0.9.10? I released them yesterday along with
accumulated updates/fixes. Thanks!

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
