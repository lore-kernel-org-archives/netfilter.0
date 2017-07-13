From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: FTP NAT fails after kernel upgrade
Date: Thu, 13 Jul 2017 17:57:04 -0300
Message-ID: <bfb77353-7334-1a41-f3c4-b5d260a14a6d@riosoft.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: pt-BR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everyone.
I'm experiencing some unexpected behavior after upgrading the kernel 
from 4.6.5-300.fc24.x86_64 to 4.10.10-100.fc24.x86_64.

I have some rules that make FTP connections go back to my LAN with DNAT, 
delivering it with SNAT so my FTP server won't try to reply directly to 
my computer. I'm doing this so users can seamlessly use their service 
with their laptops inside or outside my network without changing their 
profiles.

After updating the kernel, I've noticed that users outside my network 
can use the FTP service normally, but the connection fails for users in 
the LAN. But it will only fail for the FTP port or any additional ports 
specified in the options for the nf_conntrack_ftp module, which in my 
case is "options nf_conntrack_ftp ports=21,2121". If I remove the port 
2121 from the option, for example, it will work (authentication only, 
listing the directory will fail as expected in a DROP policy).

Is there some new way to do what I wanted in these new kernel versions 
or would it be some bug?

Thanks for the help!
