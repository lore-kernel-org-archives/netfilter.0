From: "Raj Wurttemberg" <rajw@c64.us>
Subject: RE: patch-o-matic documentation
Date: Tue, 10 Sep 2002 17:51:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c25914$2adcb300$d201a8c0@hornet>
References: <001301c25912$44e5f600$3a00a8c0@am>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <001301c25912$44e5f600$3a00a8c0@am>
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
To: arif786@rogers.com, netfilter@lists.samba.org

Arif,

From one of my posts last week, here is how I got iptables 1.2.7a
installed on a fresh install of RH73:

/*Raj*/

---------------

I am new to this mailing list and new to iptables. I have an x86 Linux
system running RedHat 7.3 as my SMTP gateway. The default RedHat install
was using iptables 1.2.5. I have recompiled my kernel (2.4.19) after
applying the latest netfilter "Patch-o-matic" and I have compiled and
installed iptables 1.2.7a.

I am more of a user and could not find any good HOWTO files for this, so
my example below is based completely on trial, error, and learning. :)
Please advise or correct me if I did anything wrong. To get iptables
installed on RedHat 7.3, I had to do several things:

1) Run "chkconfig --list" to verify the run levels for the
   installed iptables 1.2.5
2) Copy the "iptables" file from the /etc/init.d to a temporary
   directory for safe keeping.
3) Run "rpm -e iptables" to remove the installed iptables 1.2.5
4) Installed the new iptables 1.2.7a (/usr/local/sbin/)
5) Made symbolic links to the iptables files from the /sbin
   directory (RedHat default location)
6) Copied the "iptables" file from my temporary directory back
   to /etc/init.d directory
7) Run "chkconfig --add iptables" to add the service back into
   the RedHat configuration. *NOTE* I did not have to use the
   run level numbers.
8) Run "ntsysv" and enabled iptables
9) Rebooted my server. Iptables 1.2.7a started properly

Hope tis helps.


