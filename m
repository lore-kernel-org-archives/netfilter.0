From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: out of vmalloc space
Date: Tue, 6 Jul 2010 12:27:32 +0300
Message-ID: <AANLkTik2BuVthgabtSh838mUwe9AE_Q1HUuoPFRnit4G@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=cREwpgEY8qTZRITZoOQ0AsHRbtVXk6paWoN2OKdaNZw=;
        b=e6O0y101C2ZFcBfZZXrxepOeN/mrXNYCkk63/d6cwlsOEfHTI+PqvzC6VU4k10Vf9d
         B3dOd3TsvLvWy8VY/kzfHj60L41satFQG9IdDq/B6xQSYJp91VsTdkyDT2FumYa8AUMU
         NcE71jE1eq73whBjirmfIBy+7oX1eGuHJUFA0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

Symptom of my problem was:

System can not ping to 127.0.0.1
I try to add an basic iptables rules
iptables -I OUTPUT -j ACCEPT
and command returned with an error including a long number.(like the
error message when you want to add DNAT to an unsupoorted chain)

In the dmesg log:

allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
printk: 2 messages suppressed.

# cat /proc/meminfo
VmallocTotal:   118776 kB
VmallocUsed:     34948 kB
VmallocChunk:    57472 kB

Kernel Centos 5 kernel : 2.6.18-164
iptables-1.3.5

According to some notes from Internet and according to the dmesg log
it is about vmalloc.
However, meminfo shows only 34948 of 118776 vmallco is being used at
that moment.

1- How can I see the real vmalloc sizes, and what the left vmalloc is used for?
2- Is the problem about vmalloc?
3- Is the solution is vmalloc=... kernel param?

Best Regards,

Oguz Yilmaz
