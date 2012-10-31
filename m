From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Process Hang in __read_seqcount_begin
Date: Wed, 31 Oct 2012 01:33:02 +0100 (CET)
Message-ID: <alpine.LFD.2.02.1210310130240.2756@ionos>
References: <CAN8Q1EdobyFuAvtajGRSqNsCG+XoPA+FkwN=2j_H126mmfEjTQ@mail.gmail.com> <1350925299.8609.978.camel@edumazet-glaptop> <CAN8Q1EeqmHMHD-VUgr7Wzv0Z_DAD1SrEniftg==L14d+hGwu+Q@mail.gmail.com> <CAN8Q1EcTRsHjCJD90q0bKRJFMvi7Vn8YRsyQTAHNtTFVuuNdWQ@mail.gmail.com>
 <CAN8Q1EeB2kC6A_YP9zdtp_qYHMG5FF7-Usjx7Rz5pv--bjhqkQ@mail.gmail.com> <1351053164.6537.95.camel@edumazet-glaptop> <CAN8Q1Ef9sCAG8-KNWXEeuRUcmFNcg93mMG=HRQw6i3UuGtJCVg@mail.gmail.com> <1351270087.30380.9.camel@edumazet-glaptop>
 <CAN8Q1Ed1J-jmO9LppcA=rFXPvxFkk-J9mMb2-NhDYyAQKO2jvQ@mail.gmail.com> <1351285552.30380.20.camel@edumazet-glaptop> <CAN8Q1Ecx-pDR=NBQm4O=VaynQsxBU1wku9e_kcKkWB=xU0OtMA@mail.gmail.com> <alpine.LFD.2.02.1210262351330.2756@ionos>
 <CAN8Q1Ef1_OOTpqSrvPB6ja3A3e9-Lky-iceH4NKjWLw8HcW2AA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-rt-users-owner@vger.kernel.org>
In-Reply-To: <CAN8Q1Ef1_OOTpqSrvPB6ja3A3e9-Lky-iceH4NKjWLw8HcW2AA@mail.gmail.com>
Sender: linux-rt-users-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter LaDow <petela@gocougs.wsu.edu>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org, netfilter@vger.kernel.org

On Tue, 30 Oct 2012, Peter LaDow wrote:
> Anyway, based on earlier discussion, is there any reason not to use a
> lock (presuming any solution properly takes into account possible
> recursion)?  I understand that the mainline is protected, but perhaps
> in the RT version we can use seqlock (and prevent a recursive lock)?

Have you tried 3.6.3-rt9?
