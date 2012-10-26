From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: Process Hang in __read_seqcount_begin
Date: Fri, 26 Oct 2012 23:05:52 +0200
Message-ID: <1351285552.30380.20.camel@edumazet-glaptop>
References: <CAN8Q1EdobyFuAvtajGRSqNsCG+XoPA+FkwN=2j_H126mmfEjTQ@mail.gmail.com>
	 <1350925299.8609.978.camel@edumazet-glaptop>
	 <CAN8Q1EeqmHMHD-VUgr7Wzv0Z_DAD1SrEniftg==L14d+hGwu+Q@mail.gmail.com>
	 <CAN8Q1EcTRsHjCJD90q0bKRJFMvi7Vn8YRsyQTAHNtTFVuuNdWQ@mail.gmail.com>
	 <CAN8Q1EeB2kC6A_YP9zdtp_qYHMG5FF7-Usjx7Rz5pv--bjhqkQ@mail.gmail.com>
	 <1351053164.6537.95.camel@edumazet-glaptop>
	 <CAN8Q1Ef9sCAG8-KNWXEeuRUcmFNcg93mMG=HRQw6i3UuGtJCVg@mail.gmail.com>
	 <1351270087.30380.9.camel@edumazet-glaptop>
	 <CAN8Q1Ed1J-jmO9LppcA=rFXPvxFkk-J9mMb2-NhDYyAQKO2jvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:from:to:cc:in-reply-to:references:content-type:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=aN0vJnzTRNm8raoRNiCutlRLXb8Fgg3cAHlCOLD6z+g=;
        b=e1jDUmfyPlRtNS1eClAvvw+K6c6GUF+9Ypz6ka0dl4Ux14a8k0bTjMzhG6OQdEi9hv
         IJOxb29QGes+AOsISu/2f+sesIFTk3BEr/Kgo2/FQyzUDsJhc3t9yhsuAkVXae78C4JK
         iS2WowDALCsSUridAArYRDDFtpejd/2N7iMfzFsd2x31eeOYimdV/2rLLVeJq9QZR9/L
         KLjFGoFBGKOJzyK6a1gv2gT1p39hSj10S32XPJiefmg6zMRA0Q9ELhf+mhNeBqJD94EB
         HzefOeZr8aNe3jS8VW2PpD0vjH2XPvEJT85neXcCLL/Rd/zhpEM84pA1wxSnpwC4x+Q4
         t7Ig==
In-Reply-To: <CAN8Q1Ed1J-jmO9LppcA=rFXPvxFkk-J9mMb2-NhDYyAQKO2jvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter LaDow <petela@gocougs.wsu.edu>
Cc: linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org, netfilter@vger.kernel.org

On Fri, 2012-10-26 at 11:51 -0700, Peter LaDow wrote:
> (I've added netfilter and linux-rt-users to try to pull in more help).
> 
> On Fri, Oct 26, 2012 at 9:48 AM, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> > Upstream kernel is fine, there is no race, as long as :
> >
> > local_bh_disable() disables BH and preemption.
> 
> Looking at the unpatched code in net/ipv4/netfilter/ip_tables.c, it
> doesn't appear that any of the code checks the return value for
> xt_write_receq_begin to determine if it is safe to write.  And neither
> does the newly patched code.  How did the mainline code prevent
> corruption of the tables it is updating?
> 

Do you know what is per cpu data in linux kernel ?

> Why isn't there something like
> 
>   while ( (addend = xt_write_recseq_begin()) == 0 );
> 
> To make sure that only one person has write access to the tables?
> Better yet, why not use a seqlock_t instead?
> 

Because its not needed. Really I dont know why you want that.

Once you are sure a thread cannot be interrupted by a softirq, and
cannot migrate to another cpu, access to percpu data doesnt need other
synchronization at all.

Following sequence is safe :

addend = (__this_cpu_read(xt_recseq.sequence) + 1) & 1;
/*
 * This is kind of a write_seqcount_begin(), but addend is 0 or 1
 * We dont check addend value to avoid a test and conditional jump,
 * since addend is most likely 1
 */
__this_cpu_add(xt_recseq.sequence, addend);

Because any other thread will use a different percpu data.

