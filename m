From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: RE: how to set ports for ip_conntrack_ftp
Date: Fri, 1 Sep 2006 09:24:19 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609010923580.25521@yvahk01.tjqt.qr>
References: <000a01c6cd1a$7e02bbf0$0101000a@tanjian>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000a01c6cd1a$7e02bbf0$0101000a@tanjian>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: 'Netfilter-Users' <netfilter@lists.netfilter.org>

>>>> if i load it as module, i can use
>>>> 'modprobe ip_conntrack_ftp ports=21,31,41'
>>>> 
>>> AFAIK you can't: you can only do that when it's compiled as a module.
>> 
>> in other words, this module is unusable for ftpservers on non-standard
>> ports, if it's compiled into the kernel?
>
>Ah, well, you could try by passing the paramters to the kernel at
>boot-time (lilo/grub). maybe that would work.

The boot option is, IIRC, ip_conntrack_ftp.ports=21,31,41


Jan Engelhardt
-- 

