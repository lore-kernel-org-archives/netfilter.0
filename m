From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: RE: How to install patch-o-matic
Date: Fri, 27 Aug 2004 16:50:25 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C0xpI-0004Rt-00@deer.gmane.org>
References: <D5C9032B2B09C64EA2409D6214E91AC90512A2@asimail2.alphanumeric.com>
Reply-To: bassam@palettemm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512A2@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-admin@lists.netfilter.org, netfilter@lists.netfilter.org

Thanks for the great information, 
	I have successfully upgraded and recompiled the kernel according to
the URL you gave to me.

You have mentioned to compile the user space, so what do u mean by user
space and how to compile it, do you mean I have to go inside the
/usr/src/iptables-1.2.11 and write the following instructions again:

make KERNEL_DIR=/usr/src/linux-2.4.27
make install KERNEL_DIR=/usr/src/linux-2.4.27

Do I need to compile this user space before I start the actual configuration
and compilation for the kernel as described in the URL
http://www.digitalhermit.com/linux/Kernel-Build-HOWTO.html?


How many user spaces available in Linux?



Regards
Bassam


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Jason Opperisano
Sent: Thursday, August 19, 2004 2:09 AM
To: netfilter@lists.netfilter.org
Subject: RE: How to install patch-o-matic

> During my research on the net, I found that I need to load two modules in
> the kernel in order to enable this function; the modules (please correct
me
> if I am mistaken) are "ip_conntrack_pptp" & "ip_nat_pptp".
>
> And I found that these two modules come with patch "patch-o-matic". I have
> kernel version "2.4.20-8" and iptables version "v1.2.7a", and hence I
> downloaded the "patch-o-matic-20030107.tar.bz2" in accordance.
>
> I decompressed and untar that patch inside "/root" directory.
> Then I get inside the directory "/root/patch-o-matic-20030107" and I found
a
> list of files and other directories.
> In fact I don't know how to complete the installation process after that
and
> which file I should start with in order to have these two modules in hand;
> it is not mentioned precisely in the README file.

you need to have the kernel source code available on your system, and run
(for example):

KERNEL_DIR=/usr/src/linux-2.4.20-8  ./runme pending
KERNEL_DIR=/usr/src/linux-2.4.20-8  ./runme extra/pptp-conntrack-nat

(the KERNEL_DIR above is just an example)

> It is required to recompile and build the Red Hat 9.0 kernel after
> installation that patch, so can you refer me where can I find a detailed
> instructions and steps on how to compile the kernel?

yes--recompiling the kernel is required.  refer to the kernel how-to:

  http://www.digitalhermit.com/linux/Kernel-Build-HOWTO.html

it's usually a good idea to rebuild the userspace iptables after applying
pom; though, i don't think it's necessarily "required" in your case.

-j

---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.740 / Virus Database: 494 - Release Date: 8/16/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.744 / Virus Database: 496 - Release Date: 8/24/2004
 


