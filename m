From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: FTP NAT fails after kernel upgrade
Date: Sat, 15 Jul 2017 00:18:37 +0200
Message-ID: <8bccddf4-95f7-06d7-f6eb-2c309dc004ca@free.fr>
References: <bfb77353-7334-1a41-f3c4-b5d260a14a6d@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bfb77353-7334-1a41-f3c4-b5d260a14a6d@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Le 13/07/2017 à 22:57, Bruno de Paula Larini a écrit :
> Hello everyone.
> I'm experiencing some unexpected behavior after upgrading the kernel from 4.6.5-300.fc24.x86_64 to 4.10.10-100.fc24.x86_64.
> 
> I have some rules that make FTP connections go back to my LAN with DNAT, delivering it with SNAT so my FTP server won't try to reply directly to my computer. I'm doing this so users can seamlessly use their service with their laptops inside or outside my network without changing their profiles.
> 

There was a change in kernel 4.7 related to conntrack/nat helper.  I'm
quite sure that's your issue. Before 4.7, you got this dmesg warning,
for years:
nf_conntrack: automatic helper assignment is deprecated and it will be removed soon. Use the iptables CT target to attach helpers instead.

Search "nf_conntrack_helper" in:
linux/Documentation/networking/nf_conntrack-sysctl.txt
 
> Is there some new way to do what I wanted in these new kernel versions or would it be some bug?
> 

A good explanation of the "new way" including an FTP example:
https://home.regit.org/netfilter-en/secure-use-of-helpers/

If it's down, like it appears to me now, Wayback Machine:
https://web.archive.org/web/20170704141901/https://home.regit.org/netfilter-en/secure-use-of-helpers/

You can still (for how long?) revert the change by setting
nf_conntrack_helper to 1 before loading any helper module.

regards,
Adel Belhouane.


