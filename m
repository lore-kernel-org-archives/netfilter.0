From: Javier Govea <jgovea@magma.ca>
Subject: Re: iptables kernel space
Date: Tue, 22 Jul 2003 11:35:28 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307221535.h6MFZSbv000728@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

Hi,

Okay...i think i found my problem, but i don't know how to fix it....i think my
ipt_MASQUERADE.c is not compling properly, modprobe is not loading this module but i don't
know why or how to fix it, when i do 'modprobe ipt_MASQUERADE' i'm getting this:

modprobe: Too deep recursion in module dependencies!
modprobe: Circular dependency? ip_nat_core ip_nat_proto_udp ip_conntrack ip_tables
ipt_MASQUERADE
Aborted (core dumped)

what is this???????????? is it a bug??? how do i fix it??  if i do 'insmod ipt_MASQUERADE'
then the module is loaded but it's not masquerading anything..... any ideas or suggestions
are all very welcome....

here are the answers to the questions i got:

> 	Question -- once ip_conntrack is loaded,  does /proc/net/ip_contrack exist?
Yes, it does exist. I do 'modprobe ip_conntrack' and the module loads and creates
/proc/net/ip_contrack. I also do 'modeprob iptable_nat' and it loads ip_tables,
ip_conntrack and iptable_nat and it creates /proc/net/ip_contrack and
/proc/net/ip_tables_names This part seems to be working.

However when i do 'modprobe ipt_MASQUERADE' i get the problem above mentioned....

> 	Question -- what is the result of depmod -a after installing the new modules?
This is the result(i'm only showing 4 of them but the result is the same for all of them):

depmod: *** Unresolved symbols in
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/iptable_nat.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_conntrack.o
depmod: *** Unresolved symbols in /lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ip_tables.o
....

However i don't think this is problem. I create a module for the NTFS file system using
the same procedure i'm using now. The NTFS module is working properly and i'm getting the
same error msg: "Unresolved sybols in /lib/modules/2.4.20-8/kernel/fs/ntfs/*" 
Also, as i mentioned above the only module with problems when i use modprobe is
ipt_MASQUERADE in spite of having all modules with this error message.

Does anybody has a different opinion?????????

> 	Question -- are you configuring *the rest* of the kernel options to match 
> your current kernel? <--- this goes back to my caveat above ... I would not 
> build this this way... *grin*
> 	

I don't know what else should i configure....can please go a bit more in detail about this
point???

How would u build it?? would u build the whole bunch of mudules???

> 	   Point 1 -- I'm not -- experienced enough to say for sure that it's wrong, 
> but I wouldn't be building only the net dir ... (but again.. thats me)

Well i was trying to follow what is mentioned in Section 3.3 of the Linux Kernel HOWTO
http://www.tldp.org/HOWTO/Kernel-HOWTO/ but i don't know if i'm missing something or if i
skiped some steps....

> 	Can you try logging everything using iptables and see what if any packets are 
> coming through the relevant interfaces?

Below is the log file i'm getting when i use the setup i described in my last email. I've
never used this feature before but i think packets are comming to my box (since i have
them in my log file):

ipt_nth match unloaded
ip_tables: (C) 2000-2002 Netfilter core team
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack
ip_conntrack version 2.1 (1983 buckets, 15864 max) - 292 bytes per conntrack

well, that's it...any ideas, suggestion, opinions????????????

THANX TO ALL
X



> 	Okay ... 
> 
> 	   Point 1 -- I'm not -- experienced enough to say for sure that it's wrong, 
> but I wouldn't be building only the net dir ... (but again.. thats me)
> 	Point 2 -- I run slackware and have never had problems with the kernel 
> modules, even when trying out experimental P-O-M stuff  .. 
> 
> 	Question -- once ip_conntrack is loaded,  does /proc/net/ip_contrack exist?
> 	Question -- what is the result of depmod -a after installing the new modules?
> 	Question -- are you configuring *the rest* of the kernel options to match 
> your current kernel? <--- this goes back to my caveat above ... I would not 
> build this this way... *grin*
> 	
> 	Can you try logging everything using iptables and see what if any packets are 
> coming through the relevant interfaces?
> 
> 
> -(hoping that I can help)- 
> 
> 	Alistair Tonner
> 	nerdnet.ca
> 	Senior Systems Analyst - RSS
> 	
>      Any sufficiently advanced technology will have the appearance of magic.
> 	Lets get magical!
> 
> > Hi,
> >
> > Has anybody compiled the iptables in the kernelspace sucessfully??? I'm
> > getting an annoying problem. I'm using redhat 9 with kernel 2.4.20-8.
> >
> > Here is my setup:
> > I have a LAN connected to my redhat box. My redhat box is accessing
> > internet through a ppp connection. My redhat box is accessing internet via
> > a ppp link. And my LAN is accessing the internet via my redhat box (which
> > in turn uses the ppp link to allow my LAN to get access internet). So, in
> > my redhat box, i'm using iptables to masquerade all the traffic comming
> > from my LAN so they can access internet.
> >
> > Here is my problem:
> > This setup works fine when i use the compiled iptables version that comes
> > with redhat. (I'm talking about the iptables in kernel space that comes
> > with redhat). But if i compile iptables in the kernel space and i use that
> > version instead of the one that comes with redhat then my boxes in my LAN
> > do not access internet. I don't get any errors, i just can access internet
> > when i use my version of iptables.
> >
> > BTW i need to use my own compiled version of iptables because i'm gonna
> > need, later on, to apply a patch to the iptables and that patch requires to
> > compile the iptables in kernel space.
> >
> > so here is a description of what i'm doing (if i'm doing something wrong or
> > i missing something please correct me):
> >
> > 1. i'm compiling the kernel as follows
> >
> > make clean
> > make mrproper
> > make xconfig
> > (when doing make xconfig i'm selection 'no' module versions and 'no'
> > symmetric multiprocessing. I select all netfilter options as moudules 'm')
> > make dep
> > make modules
> > (before doing make modules i'm editing the makefile and putting in the
> > SUBDIRS line only '=net' since the netfilter/iptables module is in the net
> > subdirectory)
> >
> > up to here so far so good...no errors no problems...the netfilter is
> > compiled and i get a bunch of *.o files....
> >
> > 2. i'm copying my new compiled *.o files into the folder where the modules
> > suppose to be. In this case the folder is
> > /lib/modules/2.4.20-8/kernel/net/ipv4/netfilter.
> >
> > 3. Then i'm setting up a NAT/masquerade rule using the userspace iptables:
> >
> > iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> >
> > when i setup this rule it loads the kernel modules (LKM) i compiled in my
> > step 1: ipt_MASQUERADE, iptable_nat, ip_conntrack and ip_tables. Up to here
> > so far so good, the rule seems to be set (i can see the rule by doing an
> > iptables -t nat -L), and the modules i compiled are loaded (i can see the
> > modules with lsmod)..so far so good...
> >
> > 4. but as i mentioned at the begining, my LAN cannot access internet. If
> > insted of using my own version of iptables i leave the redhat version of
> > iptables (which comes in the folder i mentioned in my step 2) then
> > everything works fine.
> >
> > How can i be sure that my compile version is working is fine?? besides
> > testing it with my LAN trying to access the net i haven't tested with
> > anything else...
> >
> > just for ur information: the object files i compiled are not of the same
> > size of the files that come with redhat, for example my ip_tables.o is
> > 18,744 bytes and the redhat one is 19,292 bytes, not a big difference but
> > still....
> >
> > I think i'm compiling iptables in the wrong way or i'm missing a parameter
> > or i'm installing it in the wrong way ..but i don't know exactely what is
> > my problem...any help is very much appreciated...
> >
> > thanx to all..
> > X


