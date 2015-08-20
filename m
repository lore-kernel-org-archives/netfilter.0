From: Paul Simons <paul.simons@sitaonair.aero>
Subject: nf.conntrack_max and bucket setting - how to calculate?
Date: Thu, 20 Aug 2015 17:45:02 +0000
Message-ID: <70DEBC6456A1354CB274DBEB6DDC1F4E48A27681@GVAVirtEX02.OnAir.aero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello
I would like some help setting the 'nf_conntrack_max' and 'nf_conntrack_buckets' on my system. I have checked the sources I can and everybody seems to have a different answer - some depending on 32 or 64 bit - some saying only odd numbered 'bucket' values - some saying multiply by the page size - some say divide ...

My system is getting close to the 'max' and I need to increase the limit (nf_conntrack_max). I know the 'buckets' (hash) value is linked. So my question is simple - How do I calculate the values of the 'max' and 'bucket'?
My current values are 131072 for 'max' and 32768 for 'buckets' (yes our application uses a lot!)
What are the next values I can enter?

I have the following system:

Linux system-01 2.6.32-504.1.3.el6.x86_64 #1 SMP Tue Nov 11 17:57:25 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux

With this much memory:

MemTotal:       32848292 kB
MemFree:         1206260 kB
Buffers:          339644 kB
Cached:         26568272 kB
SwapCached:            0 kB

Thanks in advance
Paul

________________________________

Disclaimer: This e-mail (and any attachments to it) is confidential and intended solely for the named person/s to whom it is addressed. If you are not an intended recipient, please notify us immediately and delete the email from your system. Any review, dissemination or other use of it in these circumstances is prohibited.
