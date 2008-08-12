From: "Pablo Endres" <epablo@pabloendres.com>
Subject: Problems making ipset RPM
Date: Tue, 12 Aug 2008 16:59:36 +0200
Message-ID: <4dd1211b0808120759y79181780hff56c7d6c1a14fb1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi list,

I've been trying unsuccessfully to build an RPM of the ipset
extensions (which by the way a really great).

The main problem is that I can't manage to do a 2 stage install:
install in one temporary directory in order to package.  This is
normally done with the DESTDIR variable and it works for the binaries
but not for the kernel modules.  I've tried some tricks I found in
other RPMs but they don't seam to work: INST_DIR, INST_PATH,
0=$(DESTDIR) ....

Here is what the error looks like when trying to do the install by hand:

$ make KERNEL_DIR=/home/pablo/redhat/
BUILD/2.6.18-92.1.6.el5PAE-i686 PREFIX=/
DESTDIR=/home/pablo/tmp/ipset-dir/ install
cd kernel; make -C /home/pablo/redhat/BUILD/2.6.18-92.1.6.el5PAE-i686
M=`pwd` IP_NF_SET_MAX=256 IP_NF_SET_HASHSIZE=1024 modules
make[1]: Entering directory `/home/pablo/redhat/BUILD/2.6.18-92.1.6.el5PAE-i686'
  Building modules, stage 2.
  MODPOST
make[1]: Leaving directory `/home/pablo/redhat/BUILD/2.6.18-92.1.6.el5PAE-i686'
cd kernel; make -C /home/pablo/redhat/BUILD/2.6.18-92.1.6.el5PAE-i686
M=`pwd` DESTDIR=/home/pablo/tmp/ipset-dir/
INST_DIR=/home/pablo/tmp/ipset-dir/lib/modules/2.6.18-92.1.6.el5PAE/
modules_install
make[1]: Entering directory `/home/pablo/redhat/BUILD/2.6.18-92.1.6.el5PAE-i686'
  INSTALL /home/pablo/src/ipset-2.3.3a/kernel/ip_set.ko
cp: cannot create regular file
`/lib/modules/2.6.18-92.1.6.el5PAE/extra/ip_set.ko': Permission denied

Do you think it is possible for you to help me out?

Thanks in advance,
Pablo

--
Pablo Endres <epablo@PabloEndres.com>
Web: http://www.PabloEndres.com
