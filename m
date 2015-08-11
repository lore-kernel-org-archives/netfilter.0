From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Tue, 11 Aug 2015 12:01:42 +0530
Message-ID: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=HhfZhBOEcxgw5vpHGS72lDuL7VZRGKWziQJ83WxxVZ0=;
        b=0kXwkQcBUx01n6n8d0UvxNQi7ewYm3y90yqNKwplEvgF3D1Z+wYWZcpwnPfR4eehl8
         Gd0bvSBXnFlkfmNMIjUYLSFwJ1y4suJAa6SSMQI9l5QLv56ZT1zDzVby5YuiAx5TG/JM
         TuF5zfqEnxby/N3NXmTYARlXZjrNQ6EdQkKx2rkGMS82JywmMW/tU88SARO6P5CaO9Wd
         868jgQrZwDOgorNdFQdW664E+RMM4a58dm2NctTX6qRKCcvsBbu398/EB+t4JK3rV2z6
         3rtUmaw3S67GCUoyuZuyMw3IorFinX9dYdZZu9o9AZsuCp4rWAT+395pPKeQvCaP/+ew
         MuMw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi!
I am running sl6.3 (i.e. kernel 2.6.32-279). I upgraded the kernel
using elrepo to kernel 4.1.4.
Then I downloaded ipset 6.25.
I executed follwing commands
./autogen.sh
./configure
make
make modules
make install
make modules_install

No error is generated at any step

Now when I want to creat an uipset using command
ipset -N foo hash:ip

I get error
""
ipset v6.25.1: Kernel error received: set type not supported
""

output of uname -r

4.1.4-1.el6.elrepo.x86_64




o/p of " find /lib/modules/4.1.4-1.el6.elrepo.x86_64 -name ip_set.ko"

/lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set.ko
/lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set.ko



o/p of "find /lib/modules -name ip_set.ko"

/lib/modules/2.6.32-279.el6.x86_64/extra/ip_set.ko
/lib/modules/2.6.32-279.el6.x86_64/kernel/net/netfilter/ipset/ip_set.ko
/lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set.ko
/lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set.ko


please help....
