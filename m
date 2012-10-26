From: Peter LaDow <petela@gocougs.wsu.edu>
Subject: Re: Process Hang in __read_seqcount_begin
Date: Fri, 26 Oct 2012 11:51:43 -0700
Message-ID: <CAN8Q1Ed1J-jmO9LppcA=rFXPvxFkk-J9mMb2-NhDYyAQKO2jvQ@mail.gmail.com>
References: <CAN8Q1EdobyFuAvtajGRSqNsCG+XoPA+FkwN=2j_H126mmfEjTQ@mail.gmail.com>
	<1350925299.8609.978.camel@edumazet-glaptop>
	<CAN8Q1EeqmHMHD-VUgr7Wzv0Z_DAD1SrEniftg==L14d+hGwu+Q@mail.gmail.com>
	<CAN8Q1EcTRsHjCJD90q0bKRJFMvi7Vn8YRsyQTAHNtTFVuuNdWQ@mail.gmail.com>
	<CAN8Q1EeB2kC6A_YP9zdtp_qYHMG5FF7-Usjx7Rz5pv--bjhqkQ@mail.gmail.com>
	<1351053164.6537.95.camel@edumazet-glaptop>
	<CAN8Q1Ef9sCAG8-KNWXEeuRUcmFNcg93mMG=HRQw6i3UuGtJCVg@mail.gmail.com>
	<1351270087.30380.9.camel@edumazet-glaptop>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=zV7FRz7o4qL0jR0qSijXfP3TecPwIA/pfdyYirQpsPw=;
        b=FqlCEcrhXgRuu94WfPKjdUVlFdHjp/1yWhie9p2pJUveeik63pvDkD0pRJ2+LkOR6L
         MQDsyIfEuVFbv3ZZyy+/HCbTCVxP92+UovI6p9tzC0Kklfgd54Zn2OKLQvtVG8IHj5Q+
         r3BKY8M7f8C1uWbDa0SieuIHNNFRpsX5TT3VE5fcmtLWZpG/BO2qFq0DyoEPY5KflAF0
         J7aaBMqWC2WbppEDjSZC251nfkEOECKpaYwbtD/jOkNd9avzOqBs3sHAEAnM5kT3yyww
         FWR2SbcEeSL7imEUvkxAA++bW96kJ0YXXmBCsSu6hJ8vQ3YUpVTVvvPfGNP6Z1osHJos
         ZsgQ==
In-Reply-To: <1351270087.30380.9.camel@edumazet-glaptop>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org, netfilter@vger.kernel.org

(I've added netfilter and linux-rt-users to try to pull in more help).

On Fri, Oct 26, 2012 at 9:48 AM, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> Upstream kernel is fine, there is no race, as long as :
>
> local_bh_disable() disables BH and preemption.

Looking at the unpatched code in net/ipv4/netfilter/ip_tables.c, it
doesn't appear that any of the code checks the return value for
xt_write_receq_begin to determine if it is safe to write.  And neither
does the newly patched code.  How did the mainline code prevent
corruption of the tables it is updating?

Why isn't there something like:

  while ( (addend = xt_write_recseq_begin()) == 0 );

To make sure that only one person has write access to the tables?
Better yet, why not use a seqlock_t instead?

> Apparently RT changes this, so RT needs to change the code.

The RT patch only touches local_bh_disable/enable, not the code in
ip_tables.c.  Does the local_bh_disable/enable in the mainline code
protect against multiple writers?

> cmpxchg() has strong guarantees (and is also slower than upstream code),
> and seems a reasonable way to fix RT/iptables

I see this now.  And I agree that your patch would prevent corruption
of the sequence counter.

Thanks,
Pete
