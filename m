From: Moyuan Chen <moyuan.chen@gmail.com>
Subject: Re: use libiptc to build a rule to allow tftp traffic
Date: Thu, 12 Mar 2020 15:48:43 -0400
Message-ID: <CAJjT2kgiAg17n085MbvOTOOYCvDnnzEUJqqj+t89-J5wmqNC2w@mail.gmail.com>
References: <CAJjT2kgnuK_zy1tyQh5U7GiSv1P9pQqK7c7e_578w10sFMLKDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=AToQHot9AlMgyqDtzPXQuIBKhSJ5DGbDxLPYv6Qbrp0=;
        b=sQBUgPwbfrmW4L5zQNYPqoD9dmk5dgcm572m7LAfO669UqbmWbiURmynlPB4Gb2az/
         NXrX9AJVvCvtB27FszoZ8fxG8K1o1SBcYMDEvZN7yj94soA4Q2gaykZn2rx0tQPyjYFc
         IShuVV4XvfvgBpa2oJCCFk/XeoYLvwRBOWXjm52ISyWItT32RJuTBww5mZXXU/7kRK2W
         GB4krZFcI4MGNV8hbYz65/omoKOy/ycXt1HHXfCh6wnhiLRL07A7ccD+fu0B04PAfC3w
         XClA7QW5AYAS1Qneh/GJ7McJ8smrRu83xFMho7vkgcm/9TFD88/yLwZPO4S2vJcFrNe3
         i/gA==
In-Reply-To: <CAJjT2kgnuK_zy1tyQh5U7GiSv1P9pQqK7c7e_578w10sFMLKDA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I am trying to build a rule just like below:
iptables -t raw -I OUTPUT -j CT -p udp --dport 69 --helper tftp

Just can't figure out the CT target part.
I'm referring to xt_ct_target_info_v1 in xt_CT.h to construct the CT
target data structure.
For tftp helper, supposedly I should set the helper field to "tftp". Right?
struct xt_ct_target_info_v1 {
__u16 flags;
__u16 zone;
__u32 ct_events;
__u32 exp_events;
char helper[16];
char timeout[32];

/* Used internally by the kernel */
struct nf_conn *ct __attribute__((aligned(8)));
};


But I also find a "xt_helper.h" where it's like below:
Should I also add a match part using this xt_helper_info structure?

struct xt_helper_info {
int invert;
char name[30];
};

Thanks,
Moyuan
