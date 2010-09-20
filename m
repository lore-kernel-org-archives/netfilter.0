From: Josu Gomez <jgomezp81@googlemail.com>
Subject: Help with compiling netfilter/iptables modules
Date: Mon, 20 Sep 2010 21:59:56 +0200
Message-ID: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=8+bZHKzUq4FcTcyTILwlRosYbvI7JD/BtZsLXEWAU/g=;
        b=QcvfoIxRK8suyVoHUpLD8HKNua5UxSuQ0mwN+oAPBfp5q0CIve8Zb/3FGq20KoYmwy
         FOrB0L84G3dXIsEVRvtyoX/Q7zKvtG6otve4q1P7/oKBZGeLvVBj/bS8T74rNPsJ+jzI
         AySUA/aq85Ho839SDajqiMmkkSlIKyTXqYwAg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I compiled iptables 1.4.9.1 for powerpc architecture using this commands :

 ./configure --prefix=/dream/root/cdkroot
--host=powerpc-tuxbox-linux-gnu (with edited configure file to run
cross-compiling)
 make
 make install

The binaries and libraries are created successfully and there are
tested (with other modules).
The problem is that the modules there are not compiled. I have seen
the paths /dream/root/cdkroot/lib/modules/2.6.9/kernel/..  (net/ipv4
doesn't exist)

But exists the paths :

/dream/root/cdkroot/lib/modules/2.6.9/build/net/ipv4/*    (there are
only .c and .o files , not .ko)
/dream/root/cdkroot/lib/modules/2.6.9/source/net/ipv4/*    (there are
only .c and .o files , not .ko)

I would like to compile all the modules for netfilter/iptables with
.ko extension,

Thanks a lot and sorry for my english :)
