From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Confusion regarding nfct_query and nfct_callback_register
Date: Fri, 12 Feb 2016 09:40:49 +0530
Message-ID: <CAKJ7aR5QqKWJadptNGrUruWX9JQm3C97bhHqvHY3AR11HXXHyQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=lPvuOTaRNXCv0KmUVqzkrsibbKi46HovAZrgKg9VSVc=;
        b=TZOKuASBifxLKtBb1NcThl4/jXwmkuv5MGtM8ruqJb0qy7WHvbWoLc8mzmEktKJwmN
         07ewackF2xz1RZhakakVJ/eupi0fRvDzjk2vGJrsaWm9PMcHvY56epH9ga1rCvYjGHiU
         t0EWBnOGUIqh2IUZ9E1BAnkQF2+habs/Wsf9TDab/p9hM6XyglMC+sfpb5eg5n6b+NER
         FNQtGaAisc86KjcxNEEBkf47hINuOIIFxTeudlZMH4N5vctTTCwY9tcttxVUPUYE8uyG
         GvW2No8Ijqa1+dkeDV/OpFQOPMTrnFktGLBObvP8d83n7sBbu5GlAEPOj2TOl5BmzX9c
         mi7w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear All,

I using Netfilter framework and associated tools (
libnetfilter_conntrack, Conntrack-tools).

I am particularly confused with the arguments of 2 functions.

1. int nfct_callback_register ( struct nfct_handle * h, enum
nf_conntrack_msg_type type,
                                                int(*)(enum
nf_conntrack_msg_type type, struct nf_conntrack *ct, void *data)cb,
                                                void * data ).

2. int nfct_query (struct nfct_handle *h, const enum
nf_conntrack_query qt, const void *data).

The typical usage I see is as below:

nfct_callback_register(h, NFCT_T_ALL, update_cb, NULL); ret =
nfct_query(h, NFCT_Q_DUMP, &family);

static int update_cb(enum nf_conntrack_msg_type type, struct
nf_conntrack *ct, void *data)
{
        int res;
        struct nf_conntrack *obj = data;
}

So both data and ct parameters of update_cb are of type struct nf_conntrack.
Who is providing both these structures (struct nf_conntrack *ct, void
data) in update_cb.
Which struct nf_conntrack* among the 2 is the actual data received
from the kernel space.

Thanks and Regards
