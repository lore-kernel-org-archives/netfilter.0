From: jiazhida 00102231 <jiazhida@huawei.com>
Subject: An ping issue on Linux kernel 2.6.25
Date: Thu, 26 Nov 2009 16:02:17 +0800
Message-ID: <fa33c8ee24ace.24acefa33c8ee@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-language: zh-CN
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: vivianpu@huawei.com

Dear Sir:

  I have met an issue about Netfilter. The version of my Linux kernel is 2.6.25.

  Connect to the internet, and then open the command prompt and ping using "ping wwwlclix.pt -t". In the beginning I can get respose but after disconnect and connect the internet never responds again, but if I try to open the site in the web brower it works.

  I have checked the nf_conntrack table, it seems that the nf_conntrack item for icmp had not been updated.

  Is this a bug? Or is this a especial transaction considering some reason?

  Thanks very much!


  Regards
  
  

******************************************************************************************
 This email and its attachments contain confidential information from HUAWEI, which is intended only for the person or entity whose address is listed above. Any use of the information contained here in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this email in error, please notify the sender by phone or email
 immediately and delete it!
 *****************************************************************************************
