From: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Subject: For NDPI fans (Deep Packet Inspection)
Date: Mon, 22 Sep 2014 17:34:22 -0400
Message-ID: <CACuyg24-qo4=VtVAs008BDPyKwB_0QSUqrw_tAttK+1W45mHwg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=JwCmDcRhGOdRqEyaxmkxhgcZRJZrQ0vgMOBehlKSA40=;
        b=By/JGBn3QUQAVkY2r+tJ38b15ebHKQmMbE+zRo28r8uvLcAy82YcyNAjOmKM+Ksf+a
         lJi1XGgHYwI8ozMqplK6FBt7Gdutg/RcRhP3oyABat6dTfSoUc8nJlzVCXmHnqnY9+Id
         7+AsrSCVDDYv0EG1e+RnD4n5BEx3uBboY5rLsdSYzg/J7jJ1Vgw95Ei3KEVUsZ30Gc7B
         H/r2i6W9ySdPaBFNpDeOsE/aW7A50hUHrkcVEwSjEwtZzIOumWjFrNfl0XAAvpIGaxtL
         QhqC99fbpw3rD5jMMYbLlC/gE7PQmlDVfSZDYBrN/YlaFppQibqkhAM1JBrT7RkibYAx
         3Yzw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

The ndpi-netfilter is a project that I appreciate, but unfortunately
has not been updated constantly.

I made some adjustments that allow the build on Ubuntu 14.04 (or newer kernel).

I updated the project on github (making a new fork):
https://github.com/betolj/ndpi-netfilter

You can build into Ubuntu 14.04 (may be 12.04 too) with this steps:
https://github.com/betolj/ndpi-netfilter/blob/master/ndpi.install

Check if nf_conntrack_netlink is running:
lsmod | grep netlink

If true... remove after load xt_ndpi with:
rmmod nf_conntrack_netlink
modprobe xt_ndpi
