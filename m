From: Mihamina Rakotomandimby <mrakotom@free.fr>
Subject: clearing last installation
Date: Mon, 25 Aug 2003 15:13:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308251513.31677.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi everybody ,
I'm writing about a mistake i made during one installation .
i'm running linux 2.4.21 on slackware 9 .
-I downloaded iptables 1.2.8 sources .
- I first compiled/installed it just with KERNEL_DIR option .
- it installed me the stuff into /usr/local/......
- I did not like it so i manually removed all the files related to iptables 
into /usr/local 
( since iptables has told me what files he had copyied in and there is no 
"uninstall" rule into the Makefile)
- i compiled/installed the package with :
% make BINDIR=/usr/bin LIBDIR=/usr/lib MANDIR=/usr/man KERNEL_DIR=/usr...
% make install BINDIR=/usr/bin LIBDIR=/usr/lib MANDIR=/usr/man KERNEL_DIR 

but when i run a test iptables line ( just to test with ping ):
iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP

It replies :
iptables v1.2.8: Couldn't load target 
`standard':/usr/local/lib/iptables/libipt_standard.so: cannot open shared 
object file: No such file or directory

The fact is that iptables is looking for lib into /usr/local/lib ( if my guess 
is right )
What should i do ?
Thanks in advance :-)


