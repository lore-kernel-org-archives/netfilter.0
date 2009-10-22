From: Israel Garcia <igalvarez@gmail.com>
Subject: can't initialize iptables table `filter': Bad file descriptor
Date: Thu, 22 Oct 2009 10:15:00 -0500
Message-ID: <194a2c240910220815n10b1e240le35f6039f9127e39@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=he3ta5V2Ik4q5qw4kocepmxhVWj78rY4szKOBdyCw2Y=;
        b=FHRvVCnITYHh3cgz9z7OEW0WJqWd6eLx128dj0IHsZIzGd5kHuU8WzeOCd4ZQr4Yzq
         +PgPLDW8nBHkD5WuuHZJu1sl06cifvEx5pkxh2Dwr/5TBuJv6/k1qVO6uqVMsV7f326e
         Qds+9JxElUTLdyi2PB55lOt4YGTKW9RD+DtZk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

I have an old domU VM debian etch in production for several years, but
last week I'm getting problems with the firewall (iptables), and when
I run iptables -L, I get the error in the subject:

server:~# iptables -L
iptables v1.3.6: can't initialize iptables table `filter': Bad file descriptor
Perhaps iptables or your kernel needs to be upgraded.

I've searched the archives but didn't find anything useful.
I don't know if any update at dom0 or domU could make this, but I have
others domU's without any iptables  problem in the same dom0. Do you
know how can I fix it?

More details:
on domU --  linux-kernel-headers       2.6.18-7
on domU  -- iptables                  1.3.6.0debian1-5

on dom0 --  linux-kernel-headers       2.6.18-7
on dom0 -- linux-image-2.6.18-6-xen-amd64                  2.6.18.dfsg.1-23etch1
on dom0 -- iptables                  1.3.6.0debian1-5

An odd thing, in spite of iptables gives this error there are rules
running in the server, but I can't stop them right now and I need to
make a change there. :-(

thanks for your time.

-- 
Regards;
Israel Garcia
