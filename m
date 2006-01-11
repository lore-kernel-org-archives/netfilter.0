From: "Amresh Kumar" <amresh_srivastava@hotmail.com>
Subject: Re: iptables: No chain/target/match by that name (detailed)
Date: Wed, 11 Jan 2006 15:51:00 +0530
Message-ID: <BAY105-F278DDC069A44D143215CD19E240@phx.gbl>
References: <BAY105-F19C8BBEE4B5C9FE19B026C9E220@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY105-F19C8BBEE4B5C9FE19B026C9E220@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amresh_srivastava@hotmail.com, jsullivan@opensourcedevel.com
Cc: netfilter@lists.netfilter.org

Hi,

I have successfully applied patch for "nth" module but when i am trying to
add the following RULE for testing purpose:-

"iptables -A INPUT -p icmp --icmp-type echo-request -m nth --every 2 -j 
DROP"

It throws a message "iptables: No chain/target/match by that name".

The steps i have followed to apply the patch for "nth" are:-

1 Apply the the patch for "nth" using patch-o-matic.
#cd /root/patch-o-matic-ng
#KERNEL_DIR=/usr/src/kernels/linux-2.6.14.2 
IPTABLES_DIR=/root/iptables-1.3.4 ./runme base
2 Recompile kernel
  #cd /usr/src/kernels/linux-2.6.14.2
  #make clean
  #make menuconfig
  #make bzImage
  #make modules
  #make modules_install
  #make install
3.Reboot system	with new linux-2.6.14.2
4. #cd /root/iptables-1.3.4
   #make  KERNEL_DIR=/usr/src/kernels/linux-2.6.14.2
   #make install KERNEL_DIR=/usr/src/kernels/linux-2.6.14.2

I am trying it with kernel v2.6.14.2 and iptables v1.3.4.
**One thing that i have noticed that ipt_nth.o ipt_nth.ko ipt_nth.mod.c 
ipth_nth.mod.o was not create during recompile of kernel***
Any comment

After,the above failure i have tried the another way to use "nth", add nth
as a Module as follows:-

first store the " ipt_nth.h"  to the
"/usr/src/kernels/linux-2.6.14.2/include/linux/netfilter_ipv4/" directory
then, i wrote a Makefile

---------------------------------------------------------------
obj-m += ipt_nth.o

all:
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
-----------------------------------------------------------------------
then execute
#make
#modprobe ip_tables
#insmod ./ipt_nth.ko

It works.Now,i am able to use nth module.

So,please tell what i missed or did wrong in patch-o-matic procedure.

Thanks
Amresh Kumar


>From: "Amresh Kumar" <amresh_srivastava@hotmail.com>
>To: jsullivan@opensourcedevel.com
>CC: netfilter@lists.netfilter.org
>Subject: Re: iptables: No chain/target/match by that name
>Date: Mon, 09 Jan 2006 12:51:42 +0530
>MIME-Version: 1.0
>X-Originating-IP: [61.12.43.109]
>X-Originating-Email: [amresh_srivastava@hotmail.com]
>X-Sender: amresh_srivastava@hotmail.com
>Received: from vishnu.netfilter.org ([213.95.27.115]) by 
>bay0-mc12-f13.bay0.hotmail.com with Microsoft SMTPSVC(6.0.3790.211); Sun, 8 
>Jan 2006 23:25:14 -0800
>Received: from localhost ([127.0.0.1] helo=vishnu.netfilter.org)by 
>vishnu.netfilter.org with esmtp (Exim 4.41 #1 (Debian))id 1EvrRf-0002mk-07; 
>Mon, 09 Jan 2006 08:27:59 +0100
>Received: from bay105-f19.bay105.hotmail.com ([65.54.224.29] 
>helo=hotmail.com)by vishnu.netfilter.org with esmtp (Exim 4.41 #1 
>(Debian))id 1EvrRV-0002iu-Sufor <netfilter@lists.netfilter.org>; Mon, 09 
>Jan 2006 08:27:50 +0100
>Received: from mail pickup service by hotmail.com with Microsoft 
>SMTPSVC;Sun, 8 Jan 2006 23:21:42 -0800
>Received: from 65.54.224.200 by by105fd.bay105.hotmail.msn.com with 
>HTTP;Mon, 09 Jan 2006 07:21:42 GMT
>X-Message-Info: JGTYoYF78jEHjJx36Oi8+Z3TmmkSEdPt4iogl2abg+M=
>X-OriginalArrivalTime: 09 Jan 2006 07:21:42.0918 
>(UTC)FILETIME=[572F9A60:01C614ED]
>X-BeenThere: netfilter@lists.netfilter.org
>X-Mailman-Version: 2.1.5
>Precedence: list
>List-Id: General discussion and user questions 
><netfilter.lists.netfilter.org>
>List-Unsubscribe: 
><https://lists.netfilter.org/mailman/listinfo/netfilter>,<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
>List-Archive: </pipermail/netfilter>
>List-Post: <mailto:netfilter@lists.netfilter.org>
>List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
>List-Subscribe: 
><https://lists.netfilter.org/mailman/listinfo/netfilter>,<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
>Errors-To: netfilter-bounces@lists.netfilter.org
>Return-Path: netfilter-bounces@lists.netfilter.org
>
>
>Hi,
>Thanks for quick reply. My Iptables rule is enabled  as a module. Yes i am 
>loading the module for this i am doing
>
>modprobe ip_tables
>insmod ./ipt_nth.ko
>Than after applying rule iptables  -A PREROUTING -i eth0 -p tcp --dport 80 
>-m state
>--state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT
>It is working fine
>
>But  iptables rule for Load Balancing with random  is not working. still 
>giving error
>iptables: No chain/target/match by that name
>
>Can i enable this rule in my kernel.....
>
>
>Thanks....
>
>>--
>
>>From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
>>To: Amresh Kumar <amresh_srivastava@hotmail.com>
>>CC: netfilter@lists.netfilter.org
>>Subject: Re: iptables: No chain/target/match by that name
>>Date: Sat, 07 Jan 2006 13:50:10 -0500
>>MIME-Version: 1.0
>>Received: from itza.net ([198.77.208.51]) by 
>>bay0-mc12-f10.bay0.hotmail.com with Microsoft SMTPSVC(6.0.3790.211); Sat, 
>>7 Jan 2006 10:50:38 -0800
>>Received: from [192.168.223.201] (unverified [24.75.251.186]) by itza.net 
>>(ITZA Company Hosting Services - http://www.itza.net) with ESMTP id 
>>14066248 for multiple; Sat, 07 Jan 2006 13:50:25 -0500
>>X-Message-Info: JGTYoYF78jHLwkyVEn2eatAFdoqg5YYBiazxjq0B+qw=
>>Return-Path: <jsullivan@opensourcedevel.com>
>>References: <BAY105-F281A346E9A68ED0764F10F9E200@phx.gbl>
>>X-Mailer: Evolution 2.2.3 (2.2.3-2.fc4) X-Server: High Performance Mail 
>>Server - http://surgemail.com r=-670927196
>>X-Avast: Message is clean
>>X-IP-stats: Incoming Last 0, First 70, in=193, out=0, spam=0
>>X-External-IP: 24.75.251.186
>>X-OriginalArrivalTime: 07 Jan 2006 18:50:38.0487 (UTC) 
>>FILETIME=[40476270:01C613BB]
>>
>>On Sat, 2006-01-07 at 12:42 +0530, Amresh Kumar wrote:
>> > Hi ,
>> >
>> > I am using  iptables rule for Load Balancing with random* or nth but i 
>>am
>> > getting the error
>> >
>> > iptables: No chain/target/match by that name
>> >
>> > iptables rule :  iptables  -A PREROUTING -i eth0 -p tcp --dport 80 -m 
>>state
>> > --state NEW -m nth --counter 0 --every 4 --packet 0  -j DNAT
>> > --to-destination 192.168.0.5:80
>> >
>> > iptables -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW 
>>-m
>> > random --average 25 -j DNAT --to-destination 192.168.0.5:80
>> >
>> > My kernel version is  2.6.9-5.0.3.EL
>> > Iptable version = iptables v1.3.4
>> >
>> > can anyone  explain.
>> >
>> > Thanks..
>><snip>
>>Is it enabled in the kernel or as a module? If as a module, is it
>>loaded? - John
>>--
>>John A. Sullivan III
>>Open Source Development Corporation
>>+1 207-985-7880
>>jsullivan@opensourcedevel.com
>>
>>If you would like to participate in the development of an open source
>>enterprise class network security management system, please visit
>>http://iscs.sourceforge.net
>>
>
>_________________________________________________________________
>How good are you in a Formula One car? Play now 
>http://server1.msn.co.in/sp05/tataracing/onlinegame.asp
>
>

_________________________________________________________________
Shah Rukh fan? Know all about the Baadshah of Bollywood. On MSN Search 
http://server1.msn.co.in/profile/shahrukh.asp


