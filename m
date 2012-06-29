From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: ip options fitering with iptables
Date: Fri, 29 Jun 2012 12:30:02 +0530
Message-ID: <CAE1WnGcvRLbgcGXcLH-5JPXKb6VnceBzHv3RTinKRgNc8VCLrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=vKCyCGQ3RlSwrl7sixmx3vpp8Zq1C5AZOzYFMzr40kk=;
        b=RS7ye6A2dG1LXSFaFf5+sqrDNBK1aGwAMBdQvxbZJmN7QciVcfMArv92VAKEQ1/0fb
         4v/KO89YkCEVjX0HGriW+MUCRjcpdHou/3DXf7jLfHcQzl8Jtb79YZGQ4ZJ/iYoQ7YAO
         ioOgq4S3XrMALDSCiPYN02RwuThkMlwPqRHviIvHvmFAi5W9RUgGeBbkUQq3NnD+Fdqy
         5UBbaX4Kando13beABfb8i4Ff5t9qoxsLx7x/oeP8pUVJHYxur32fSZUHP4uSqGSiqT5
         P1IvBoXN+CGj0YPcViwiiZ/LvVvAONKktvthbR853woDq2iqMs34/b56UvhvoP1IcF45
         tBRQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

i am using iptables version 1.4.9.1
this version does not have ipv4options filtering support


iptables -A INPUT -i eth1 -m ipv4options --ssrr -j DROP
iptables v1.4.9: Couldn't load match
`ipv4options':/lib/xtables/libipt_ipv4options.so: cannot open shared
object file: No such file or directory

and i am not able to find any patch to support ipv4option filtering.

Please provide necessary information
