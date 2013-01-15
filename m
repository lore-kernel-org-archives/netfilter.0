From: Manuel Scheub <manuel.scheub@kraftcom.de>
Subject: Re: iptables deactivate "getportbyname"
Date: Tue, 15 Jan 2013 15:26:24 +0100
Message-ID: <50F56710.30600@kraftcom.de>
References: <50F5483C.9050807@kraftcom.de> <alpine.LNX.2.01.1301151350060.19279@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301151350060.19279@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Am 15.01.2013 13:51, schrieb Jan Engelhardt:
> On Tuesday 2013-01-15 13:14, Manuel Scheub wrote:
>> after an upgrade of iptables from version 1.4.3.2 to 1.4.16.3, some rules
>> doesn't work anymore.
>> e.g. all rules with protocol UDP an port information:
>>
>> #iptables -A INPUT -p udp -i eth0 --dport 67 --sport 68 -j ACCEPT
>> iptables v1.4.16.3: Port "67" does not resolve to anything.
> Hrm. I cannot reproduce this so far, but I have a suspicion:
> Do you have some libc other than glibc, perhaps?

Sorry to be such a noob - what exactly do you mean?

For compiling the iptables 1.4.16.3 I did the same as for compiling the 
older version 1.4.3.2:

#./configure --with-kernel=/opt/linux-2.6.23 
--with-xtlibdir=/usr/lib/iptables

Maybe I need to upgrade my kernel-sources?

