From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: problems with h323 helpers
Date: Tue, 16 Oct 2012 11:03:36 +0300
Message-ID: <CAAo+KFn=iGm0wruYkR1udwx_+RTrDmWBeh4MdX2zSTbGHgdZnA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=8AyAtO4p6ihIQcWd1rPIy39d+mwDK5oneT6Yvu9Vu4o=;
        b=Okeg65yiwUAvcZPewc0zRGoDpudCGoG7NTyrKF6Mo+zabgrXIuI2Y9KbOu6b5IH7kB
         XeoDBfkLokZO4hzsjyhLZBkYoFsglNskJJRM35zNTRv/JN3/9KbE/Dvyy5UHJQoFI71V
         DZLhtEInvbQKdzE8+t/6ZSC0FfRhIhDcUtjqvJklacyRaF9V+pIxsRLDxnEe6v59/PTz
         KrJvFT9ZD4LKQHOVqX85NQrSH8+ySJoeSZviyCL2epSN6mDz493u/9siAguPua987MAI
         YX1Fk/LR8p7/ygFn19MBZTnsEZz43JOH+n/E7pZzQPsFXMt7zlwok/nIrrnOVAQvtGkH
         wZJA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello

In my system There is a Polycom HDC7000 video conferencing device and
a VVX1500 ip phone.

Incoming connection:

Src:Any - Dst:ExtIP1 - Srv:Any -> DNAT to-destination IntIP7000
Src:Any - Dst:ExtIP2 - Srv:Any -> DNAT to-destination IntIP1500
Src:IntP7000 - Dst:Any - Srv:Any -> SNAT to-source ExtIP1
Src:IntP1500 - Dst:Any - Srv:Any -> SNAT to-source ExtIP2


When I have loaded nf_nat_h323 and nf_conntrack_h323, HDX7000 can not
call outside, VVX1500 works correctly. When I have disabled those
modules, HDX7000 works and VVX1500 stops working.

I can enable module for a specifi connection. (see my previous post).
What can be the problem is? What do you suggest me?

Regards,




--
Oguz YILMAZ
