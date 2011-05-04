From: Christian Ernst <ernst997@gmail.com>
Subject: iptables 1.4.10 - statically linked
Date: Wed, 4 May 2011 09:10:29 +0200
Message-ID: <BANLkTikG1rhGATqVpSKGn_7iP256pN+k0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=vLWWowDIGOt8to1qCxiBMEx1kGS0HjhjNA2NFsckPqc=;
        b=BS9zY3n8ZfM3GKps8WnnEFhRENeG+vS8+Cp40059GqVgQEW9k99CVl3nqEQhI5rbK1
         2ZfpPHRvDrrDOO1EP6pibl9oR5BijBAtIE7+XXWMRdJnpwl/iGVpl8LNn4Tx94w1cmwv
         iOiOzGSfujH2YuDNb/9zH4LsZtQhoXN3TeLfc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all

i'm trying to compile iptables 1.4.10  statically linked. The
challenge i'm facing is that even if i compile the following way i get
a dynamically linked binary.

Here is my proceeding:

./configure --enable-static --enable-shared=no
make NO_SHARED_LIBS=1
make install


if i ldd the binary i get the following:
root@debian6:/usr/local/sbin# ldd ./iptables
        linux-gate.so.1 =>  (0xb7707000)
        libm.so.6 => /lib/i686/cmov/libm.so.6 (0xb76da000)
        libc.so.6 => /lib/i686/cmov/libc.so.6 (0xb7594000)
        /lib/ld-linux.so.2 (0xb7708000)
root@debian6:/usr/local/sbin#

Currently i'm running in a:
debian6 2.6.32-5-686 with gcc version 4.4.5

Could please someone give me an advice?
best regards
Chris
