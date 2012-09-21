From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: wildcard subnets with ipset
Date: Fri, 21 Sep 2012 10:28:53 +0300
Message-ID: <CAAo+KFmHJzk-9bLdj36RMtu_Xs8KjtBbRq24a6Ce=G5CcQiZhQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=3Gm3QBykO64+sTyB7yg543VTFQdeUcYm9FYgFWRrQMY=;
        b=FCIG/6rPNnz2sOfeoqUMuYL8KBmWYChBse4W7TLd3PGjXi6sHuMQHs9wIlWruKVQEL
         1ts/DdwE9vkpxQPPLmIipmsetR/WXK6ts7fvIQjEu2bmtKVXDRLjX8W4nvNjIcBahVYR
         CnH4zrlBk0a6EuPdmgrAGEoPlY+sHv19sjsZ+GJy+Rv1S39ur1Kt7vlnCsby25pnYOBU
         wpN/DuZaaxxZ2U4igOUx5gSC7xnrZR/qRuU1BORPQphY0axEU0PZ3qmv8WMuJsHKRISB
         rzfSBdxJl3TZbRNZxmJYbzqzcy/d8t6NVbHz2E5EVYi6w9KF2lFU6tmLdIBC8hTOnbQt
         oxog==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Currently iptables supports network definitions such as
10.0.10.0/255.0.255.0 (wildcard subnets). What do you suggest to
implement such wildcard subnets with ipset?

Regards,

--
Oguz YILMAZ
