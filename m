From: Javier Govea <jgovea@magma.ca>
Subject: iptables kernel space
Date: Sun, 20 Jul 2003 16:28:41 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307202028.h6KKSfie003783@webmail1.magma.ca>
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
To: netfilter@lists.netfilter.org


Hi,

Has anybody compiled the iptables in the kernelspace sucessfully??? I'm getting an
annoying problem. I'm using redhat 9 with kernel 2.4.20-8.

Here is my setup: 
I have a LAN connected to my redhat box. My redhat box is accessing internet through a ppp
connection. My redhat box is accessing internet via a ppp link. And my LAN is accessing
the internet via my redhat box (which in turn uses the ppp link to allow my LAN to get
access internet). So, in my redhat box, i'm using iptables to masquerade all the traffic
comming from my LAN so they can access internet. 

Here is my problem:
This setup works fine when i use the compiled iptables version that comes with redhat.
(I'm talking about the iptables in kernel space that comes with redhat). But if i compile
iptables in the kernel space and i use that version instead of the one that comes with
redhat then my boxes in my LAN do not access internet. I don't get any errors, i just can
access internet when i use my version of iptables. 

BTW i need to use my own compiled version of iptables because i'm gonna need, later on, to
apply a patch to the iptables and that patch requires to compile the iptables in kernel space.

so here is a description of what i'm doing (if i'm doing something wrong or i missing
something please correct me):

1. i'm compiling the kernel as follows

make clean
make mrproper
make xconfig 
(when doing make xconfig i'm selection 'no' module versions and 'no' symmetric
multiprocessing. I select all netfilter options as moudules 'm')
make dep
make modules
(before doing make modules i'm editing the makefile and putting in the SUBDIRS line only
'=net' since the netfilter/iptables module is in the net subdirectory)

up to here so far so good...no errors no problems...the netfilter is compiled and i get a
bunch of *.o files....

2. i'm copying my new compiled *.o files into the folder where the modules suppose to be.
In this case the folder is /lib/modules/2.4.20-8/kernel/net/ipv4/netfilter. 

3. Then i'm setting up a NAT/masquerade rule using the userspace iptables:

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE 

when i setup this rule it loads the kernel modules (LKM) i compiled in my step 1:
ipt_MASQUERADE, iptable_nat, ip_conntrack and ip_tables. Up to here so far so good, the
rule seems to be set (i can see the rule by doing an iptables -t nat -L), and the modules
i compiled are loaded (i can see the modules with lsmod)..so far so good...

4. but as i mentioned at the begining, my LAN cannot access internet. If insted of using
my own version of iptables i leave the redhat version of iptables (which comes in the
folder i mentioned in my step 2) then everything works fine. 

How can i be sure that my compile version is working is fine?? besides testing it with my
LAN trying to access the net i haven't tested with anything else...

just for ur information: the object files i compiled are not of the same size of the files
that come with redhat, for example my ip_tables.o is 18,744 bytes and the redhat one is
19,292 bytes, not a big difference but still....

I think i'm compiling iptables in the wrong way or i'm missing a parameter or i'm
installing it in the wrong way ..but i don't know exactely what is my problem...any help
is very much appreciated...

thanx to all..
X





