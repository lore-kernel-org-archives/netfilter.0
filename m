From: Dave <finalglide@gmail.com>
Subject: libnetfilter_conntrack-0.0.95 compile error
Date: Mon, 30 Jun 2008 09:44:05 -0700
Message-ID: <935fab200806300944m4a184537qe3d2082afc4512e1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=UNf6hIDgcjnHaHlkaefKOVFHamRv/CN95IrvLXL83iM=;
        b=oeN3NWWMnBIngXniHxjUaMAJ5neeWC1BAXA+15pfUBZEaAF5lSobHHTvDJUvfeqg9Z
         Mw0ZYKvgzrx0wRX93ZbDH8V/C0hcLBfCClI/NffVjCyt3HVhGXJYeg5niuPJkEQd2DFh
         VbVAVvx3FZCcLfBnaFPEF6NfmpQYICaGmKTmE=
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
