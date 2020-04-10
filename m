From: James Bond <lfunwf@gmail.com>
Subject: Hello, I have some questions about flowtable.
Date: Fri, 10 Apr 2020 11:01:38 +0800
Message-ID: <CAB7-=9QdBF1xCyX4nWwD3_EtMMed9QEfYW6H20cYODXe7GBt1Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=5OyzwVZmjBgfhGDwvv29xvnMtylWHufsspKQVfWvFDk=;
        b=nOnCJGj2j4EGc3X8NxDFgYpNGI0s0c7Tw2wueeUnRe2lYc0Jpq+D7ut8yEB+Ira9Zq
         24Vmxlh6S575dG51h3O4OgR3jZDFimLipyr9BKHAVnkxlDL4/xynCRfL14b3+c768Omq
         Rit2yH7CPbMYEhuEuFcY/qoJ4DH9zzgC6SpBgYDtRJtvhXS4VCj54wW1MzdDUpnQHVUP
         EVj6CciW0lwQB2X4fmEXRsC6OhT/Fd5sBx0K7aK4gVnvFBUp7lQJRibu3dDl0/H2HGEZ
         NQczTmV19zAlzWWQa2I9GzoKpvQmKwyiYthwdIItuBqInpGBNSq6zohhOY8rMgje8HeO
         c5oA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

There is only one example about flowtable in nftables wiki, it is
related to packet forwarding.
Can flowtable works with NAT?
What should I do to perform NAT with flowtable?
Could you please give me some examples?
Thank a lot.
