From: Red Hat Enigma <redhat@zagros.ipm.ac.ir>
Subject: Patch-O-matic
Date: Tue, 9 Jul 2002 00:21:46 +0430 (IRST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0207090018030.13923-100000@zagros.ipm.ac.ir>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Dear friends
I still try to find a way to use patch-o-matic features on my kernel ( 
2.4.18 ) ,when I run make patch-o-matic ,many patches say, applying patch 
fail and I don't know why, I do the following steps :

make pending-patches
make most-of-pom
make patch-o-matic
< compiling the kernel>
make KERNEL_DIR

but many patches didn't apply .

Regards
Alireza


