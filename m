From: Ferry van Steen <ferry.van.steen@InfoPart.nl>
Subject: Compile question
Date: Thu, 5 Sep 2002 12:06:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1864EE7E43ED511AFCB00105ADCEC2604A93A@IP_NTS02>
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

Hey there,

I need to compile a kernel and iptables for a different machine. Now the
kernel isn't such a problem, I just compile it and the modules, install the
modules, tar/gz the modules dir and copy the kernel and the modules to the
other machine, put the modules in the correct dir and run depmod and I can
boot the new kernel fine. However, iptables is more difficult as it needs
the kernel source for the make install and perhaps gnu automake and autoconf
and maybe some other utils. The kernel source, automake, autoconf, gcc/g++
and various other things needed for building sources are not available on
that system. So, could I do a ./configure --prefix=/usr/local/iptables and
make install on the compiling system against the compiled kernel, tar/gz the
/usr/local/iptables dir, remove the old iptables stuff on the other machine
and put this in, link /usr/local/iptables/(s)bin/iptables to
(/usr)(/local)/(s)bin/iptables and make it work? Would I need to add
/usr/local/iptables/lib to ld.so.config? Would I need to do other things?

TIA

Kind regards,

Ferry van Steen
InfoPart Automatisering B.V.
Beeksestraat 24
4841 GC Prinsenbeek
The Netherlands
Phone: +31 (0)76 - 5 44 04 11
Fax: +31 (0)76 - 5 41 83 51
Mobile: +31 (0)6 - 28 46 47 45
E-Mail (business): ferry.van.steen@infopart.nl
E-Mail (private): freaky@bananateam.nl
MSN Messenger: freaky@freaky2000.dyndns.org
ICQ (UIN (seldom used)): 191458



