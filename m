From: Mihamina Rakotomandimby <mrakotom@free.fr>
Subject: uninstall/re-install iptables
Date: Fri, 22 Aug 2003 23:28:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308222328.14788.mrakotom@free.fr>
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
To: netfilter@lists.netfilter.org

Hi every body ,
i'm running slack 9 with a 2.4.21 kernel 
I got iptables 1.2.8 from netfilter website .
I first removed the slack package (1.2.7a) with the appropriate tool ,
and then a I made :
- untar the sources of iptables
- cd into the source directory
- make KERNEL_DIR=/usr/src/linux
- su 
- make install KERNEL_DIR=/usr/src/linux 

The problem is that it installed the iptables files into /usr/local .
I dont like it to be this way .

- There is not rules to "make uninstall" .Will it be enough to remove all the 
copied files during the install process ?
- what option have i got to specify to have it installed at /usr ( rather than 
the default /usr/local )?

Thanks in advance for your help .

