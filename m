From: Richard Peeters <richardpeeters45@gmail.com>
Subject: Question about NFLOG and conntrack glue
Date: Wed, 26 Oct 2016 08:27:46 -0700
Message-ID: <CABfb+p379t9n_iMK1mwMUA76fkhhr-76Fp=C-QCdmNN9iqFwkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=CuXqwOhp0PjexLrj99FiknJArnmkIwpBMXF6yYjo9Dc=;
        b=AmByg3khoLJcVQxVtEPprfsE9VVTpq6k/Ijs5JVbMfvdxMKeDESHXL2r8CJ/dY9XxR
         16beB44KBhFBI+A0d/STo0ZjjYyHBXphI4QnO3yKXdMVOV6lTYki5q9hWPmY0HjiuIwZ
         8gokhVXERhfGYiXOLOkcqmU2nv+/ct9penBvYwL0GBVDXGnjZauhKaF4w8gHPPEcsybb
         Wlbc9Tqq/ZJBz7EIMQaJU6r73GMg4SKPRaYinXXTb2jOlRoku59pF48El3uC2/va0jF+
         0QbzU7qIB7KMYBim6b3UT3pmqdY9yjDCDnU8TssQKGfFPTn3jgSdJRXkIaQ3+dbOFiTz
         BVVQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am referring to commit :
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a29a9a585b2840a205f085a34dfd65c75e86f7c3
which was pulled in with 4.4, I am running kernel 4.8, and wondering
how I would be able to access the attached conntrack info in user
space.

My application runs in user space and retrieves packets that match a
specific criteria from iptables using NFLOG, I would like to get
conntrack information for said packet.

I use libnetfilter_log but I do not see any API exposed that will give
me this information, even if I was able to extract information using
libnfnnetlink apis,
( nfnl_get_pointer_to_data(nfad->nfa, NFULA_CT, struct nf_conn);)
the best I could get in this app would be a struct nf_conn pointer.

My question is : since struct nf_conn is not exposed to userspace, how
is one supposed to use the attached information in userspace? It would
be great to see some example code.

Thanks,
Rich
