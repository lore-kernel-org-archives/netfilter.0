From: Dave <finalglide@gmail.com>
Subject: libnetfilter_conntrack-0.0.95 compile error
Date: Mon, 30 Jun 2008 09:48:06 -0700
Message-ID: <935fab200806300948y65018956ud5513d16cd93c9cd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=UNf6hIDgcjnHaHlkaefKOVFHamRv/CN95IrvLXL83iM=;
        b=LSh8IzCY0av8E8dPWI8pctV0S50f3HZgPvzO6GAWCPTitMp2kkyuXRSGa2+Uf6J3Fe
         7s1/IxowsZi3b2+PUyM4LhCUFpZ23jj9hoSncRppVbJiRBmYM/TgcZbUlXJyqRJZww0c
         hbkRJvQVlLw5MHvH/K8v01Ae33HE9T2TwQFNc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Just tried to update conntrack librarys to new version but error out.
0.94 compiles just fine though.

gcc -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
-DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
-DPACKAGE=\"libnetfilter_conntrack\" -DVERSION=\"0.0.95\"
-DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1
-DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1
-DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
-DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DHAVE_ARPA_INET_H=1
-DHAVE_INET_NTOP=1 -DHAVE_INET_NTOP_IPV6=1 -I.  -I../include    -g -O2
-DLIBNETFILTER_CONNTRACK_DIR=\"/usr/local/lib/libnetfilter_conntrack/\"
-I/usr/local/include   -MT conntrack_events.o -MD -MP -MF
.deps/conntrack_events.Tpo -c -o conntrack_events.o conntrack_events.c
conntrack_events.c: In function 'sk_set_filter':
conntrack_events.c:44: error: invalid application of 'sizeof' to
incomplete type 'struct nlattr'
conntrack_events.c:66: error: invalid application of 'sizeof' to
incomplete type 'struct nlattr'
conntrack_events.c:92: error: invalid application of 'sizeof' to
incomplete type 'struct nlattr'
conntrack_events.c: At top level:
conntrack_events.c:149: error: invalid application of 'sizeof' to
incomplete type 'struct nlattr'
conntrack_events.c:170: error: invalid application of 'sizeof' to
incomplete type 'struct nlattr'
conntrack_events.c:195: error: invalid application of 'sizeof' to
incomplete type 'struct nlattr'
make[1]: *** [conntrack_events.o] Error 1


Any ideas?
Thanks
-Dave
