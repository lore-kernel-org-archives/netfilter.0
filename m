From: Marc Remijn <marc@dubhead.xs4all.nl>
Subject: New functionality not showing up in kernel config
Date: Sat, 22 May 2004 23:22:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AFC4B2.3000505@dubhead.xs4all.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Netfilter list members,

I installed:

Kernel 2.4.26 sources (Slackware).
Patch-o-matic-ng-20040302
Iptables-1.2.9/

I went into the kernel source dir. I did 'make dep'
I went into the patch-o-matic dir. I did ./runme extra

	- I chose amongst others h323 conn tracking and 'limit match'
I went back into the kernel source dir and did 'make xconfig'.


The entries for limit match didn't have a help text when I clicked 
'help' in the kernel config menu.

I couldn't find H323 anywhere in the kernel config menu. In 'make 
xconfig' I saved the config and then searched for '323' in the .config 
file. Not found.

I even tried another 'make dep', but this didn't help.

With the 2.4.23 and the older path-o-matic I succesfully added H323 
connection tracking functionality.

What's going on here?

Marc


