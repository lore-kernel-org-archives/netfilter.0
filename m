From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: connection tracking module
Date: Wed, 16 Dec 2009 21:57:32 +0530
Message-ID: <cfeab66d0912160827m729076bbx95189395cd4529a8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=c9b58dD7g0prxtTuTO2HJM9dzYRFH5Bg9KdxE8bo2QI=;
        b=DPTGS+VwIHIen9nY7tKS+3DvzfH+jvaSKtyItVucE6S+Jo8MJtznE6nMWJ2DjLBKwB
         fo4Sdh+c/XvL10ukhel1p4fFuxRVoopJMzVp/eg4OHi0OaF41EO1MmtY1ZwM7kBrZZ49
         B+MvSJ34qlZQIjJ+oXe2OkpK2G3E6NdrMdEZg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

Hi ,

      I am a little confused about connection tracking .  I would like
to clarify those with your valuable inputs . If you can find some time
, i will be grateful .


      1. Each connection tacking module ( example  - nf_conntrack_ftp
) will keep its own independent tuple hash tables ??
      2. Suppose i have  nf_conntrack_ftp , nf_conntrack_proto_tcp
modules  loaded . If i initiate a data transfer using ftp protocol ,
which connection tracking module will have tuple information .?
          { My question is :- > if i dont have nf_conntrack_proto_ftp
loaded , it will be tracked by nf_conntrack_proto_tcp }
      3. for the question 2 , which will be skb->nfct contains ?
      4. what exactly helper routines does ? is it only find out
related connection .or any other functionality ?
      5. nf_conntrack_proto_tcp also has helper routines ?

Thanks,
Ratheesh
