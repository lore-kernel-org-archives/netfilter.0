From: "Jacky Luk" <jacky.luk@primecreation.com>
Subject: Is the libnetfilter_queue thread-safe?
Date: Fri, 23 Jan 2009 12:02:21 +0800
Message-ID: <web-4707182@mail.primecreation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I would like to ask a question about the 
libnetfilter_queue. Is the libnetfilter_queue thread-safe? 
Would the API of libnetfilter_queue cause the kernel crash 
under multi-threading environment? I am using the Red Hat 
Enterprise Linux 5.2 with the kernel version 
2.6.18-92.el5PAE to develop my own program. The version of 
libnetfilter_queue is 0.0.16 and the version of 
libnfnetlink is 0.0.40.

Thanks and Regards,

Jacky Luk
