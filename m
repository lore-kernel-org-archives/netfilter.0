From: utteerna <utteerna@gmail.com>
Subject: Re: Small doubt from a newbie :)
Date: Fri, 10 Nov 2006 14:08:38 +0530
Message-ID: <45543A8E.7070606@gmail.com>
References: <45504519.3070907@gmail.com>
	<BAY103-DAV5241D586B5D06014EBF3FB2F20@phx.gbl>
	<4551C53D.6020306@gmail.com>
	<BAY103-DAV23E7F7CB054F62AA05D7BB2F00@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-DAV23E7F7CB054F62AA05D7BB2F00@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org

Here's steps i followed and error details. Please let me know if i 
missed something

1)Downloaded linux-2.6.18.2 and put it in /usr/src dir and untarred it
2)Downloaded iptables-1.3.6 and put it in /usr/src dir and untarred it
3)Downloaded patch-o-matic-ng-20061108.tar and put it in /usr/src dir 
and untarred it

4)cd /usr/src/patch-o-matic-ng-20061108
[/usr/src/patch-o-matic-ng-20061108]# export 
KERNEL_DIR=/usr/src/linux-2.6.18.2
[/usr/src/patch-o-matic-ng-20061108]# 
exportIPTABLES_DIR=/usr/src/iptables-1.3.6
[/usr/src/patch-o-matic-ng-20061108]# ./runme extra
Applied the following patches : IPV4OPTSSTRIP, ipv4options,ROUTE 
,TARPIT,sip-conntrack-nat
---QUESTION-->>I didn't find any patch called "random" here. Where to 
get it???

6) cd /usr/src/linux-2.6.18.2
[/usr/src/linux-2.6.18.2]# make clean
[/usr/src/linux-2.6.18.2]#make mrproper
[/usr/src/linux-2.6.18.2]#make xconfig
  Under Networking-->Networking options-->Network packet 
filtering-->Core netfilter configuration-->Netfilter Xtables support, i 
selected ALL the options (including "statistic") and set it compile as  
modules.
---QUESTION-->> Do i have to compile them in to the kernel rather than 
compiling them as modules???
[/usr/src/linux-2.6.18.2]#make bzImage
[/usr/src/linux-2.6.18.2]#make modules
[/usr/src/linux-2.6.18.2]#make modules_install
[/usr/src/linux-2.6.18.2]#make install

7)Now i boot with my new kernel

8) cd /usr/src/iptables-1.3.6
[/usr/src/iptables-1.3.6]# make clean
[/usr/src/iptables-1.3.6]#make
[/usr/src/iptables-1.3.6]#make install

9) Now when i execute
/sbin/depmod -a
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_conntrack_irc
/sbin/modprobe iptable_nat
/sbin/modprobe ip_nat_ftp
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
........some other commands..................
iptables -t mangle -A OUTPUT -o ! eth0 -m random --average 50 -j ACCEPT
........some other commands..................

i get the error
##############################################################################
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.3.6: Couldn't load match 
`random':/usr/local/lib/iptables/libipt_random.so: cannot open shared 
object file: No such file or directory
##############################################################################
---QUESTION-->> Do i have to load some other modules???
---QUESTION-->>Is the way i do the compiling and installing correct or 
am i missing something???

Thanks
Utteerna

Marco Berizzi wrote:
> utteerna wrote:
>
>
>   
>> I tried the following
>>
>> 1) Took 2.6.18.2 kernel source - Compiled it with "statistic match"
>> option on
>> 2) Then compiled iptables 1.3.6  and installed it
>>
>> But still doesn't work.
>>     
>
> Error messages?
>
>
>
>   

