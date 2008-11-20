From: "JC Janos" <jcjanos245@gmail.com>
Subject: "excessively large" library built in standalone ipset build
Date: Thu, 20 Nov 2008 14:29:26 -0800
Message-ID: <7259d7020811201429p2b83a4a5h88c46331cfbbf449@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=YgyFSADKcqY8qBmdYz6YixOvzWqZyme0sGIBBUa72VQ=;
        b=lSTckIWWQptCitE+lzenQun2vWyJu5IKHI1Qzmp0h03lF3M0IrK/BW6bBHF4IZP0PD
         3CiIODlU99fI0h0CUqref9dAVhHkSXy7ioKNccnv/3vqpleszBCCMbCw3plpXd8Fps+V
         UOl4n23MsKV+ZMKBBxgV3NyGn+JEZyw8X9k6A=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: Jan Engelhardt <jengelh@medozas.de>

(splitting this out -- more appropriately -- from a separate thread;
Thanks, Jan)

I'm building ipset from src (svn r7576) on Opensuse 11.

It builds & installs without error.

ls -al /usr/local/lib/ipset
 -rwxr-xr-x 1 root root   14941 2008-11-20 13:28 libipset_iphash.so
 -rwxr-xr-x 1 root root   15029 2008-11-20 13:28 libipset_ipmap.so
 -rwxr-xr-x 1 root root   15370 2008-11-20 13:28 libipset_ipporthash.so
 -rwxr-xr-x 1 root root   15253 2008-11-20 13:28 libipset_ipportiphash.so
 -rwxr-xr-x 1 root root 2112524 2008-11-20 13:28 libipset_ipportnethash.so
 -rwxr-xr-x 1 root root   15232 2008-11-20 13:28 libipset_iptreemap.so
 -rwxr-xr-x 1 root root   15151 2008-11-20 13:28 libipset_iptree.so
 -rwxr-xr-x 1 root root   15352 2008-11-20 13:28 libipset_macipmap.so
 -rwxr-xr-x 1 root root   15153 2008-11-20 13:28 libipset_nethash.so
 -rwxr-xr-x 1 root root   14843 2008-11-20 13:28 libipset_portmap.so
 -rwxr-xr-x 1 root root   15042 2008-11-20 13:28 libipset_setlist.so

cd /lib/modules/`uname -r`/updates/
ls -al ip_set*
 -rw-r--r-- 1 root root   18334 2008-11-20 13:28 ip_set_iphash.ko
 -rw-r--r-- 1 root root   13624 2008-11-20 13:28 ip_set_ipmap.ko
 -rw-r--r-- 1 root root   19747 2008-11-20 13:28 ip_set_ipporthash.ko
 -rw-r--r-- 1 root root   20167 2008-11-20 13:28 ip_set_ipportiphash.ko
 -rw-r--r-- 1 root root   21920 2008-11-20 13:28 ip_set_ipportnethash.ko
 -rw-r--r-- 1 root root   18697 2008-11-20 13:28 ip_set_iptree.ko
 -rw-r--r-- 1 root root   24744 2008-11-20 13:28 ip_set_iptreemap.ko
 -rw-r--r-- 1 root root   46034 2008-11-20 13:28 ip_set.ko
 -rw-r--r-- 1 root root   14066 2008-11-20 13:28 ip_set_macipmap.ko
 -rw-r--r-- 1 root root   20087 2008-11-20 13:28 ip_set_nethash.ko
 -rw-r--r-- 1 root root   14024 2008-11-20 13:28 ip_set_portmap.ko
 -rw-r--r-- 1 root root   14079 2008-11-20 13:28 ip_set_setlist.ko
, loads & functions seemingly OK.

And, the kernel modules load & the binary functions as expected.

In another thread, Jan E. pointed out, that in comparison to his ipset
build (from xtables-addons?),

  >> -rwxr-xr-x 1 root root 2112524 2008-11-20 13:28 libipset_ipportnethash.so
  >
  > However, this time, one of *your* libraries is excessively larger ;-)
  >
  > -rw-r--r-- 1 jengelh users 21432 Nov 20 23:07 libipset_ipportnethash.oo
  > -rwxr-xr-x 1 jengelh users 23251 Nov 20 23:07 libipset_ipportnethash.so

one of my libraries (libipset_ipportnethash.s) is *excessively* larger.

Looking above, that's the only one that's so large ...

Is this size in fact unexpectedly/problematically too large?

If it is, what do I need to correct in my build?

Thanks.

--JC
