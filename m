From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 03:57:29 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621105729.21895.qmail@web14726.mail.yahoo.com>
References: <Pine.LNX.4.33.0406211143360.31871-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406211143360.31871-100000@blackhole.kfki.hu>
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

--- Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> Are you sure, you run the kernel indicated?
> 
uname -a
Linux svr1.myDomain 2.6.7 ...

> How did you compile iptables-1.2.10? There was a bug
> introduced in
> linux-2.6.7, which prevented anyone to compile the
> iptables source
> using linux-2.6.7.
> 
I exported the variable CC before I compile iptables
as follows:

CC="gcc -D__user= "
export CC

make BINDIR=/sbin LIBDIR=/lib \
MANDIR=/usr/share/man KERNEL_DIR=/usr/src/linux-2.6.7
>& iptables-make.log

make BINDIR=/sbin LIBDIR=/lib \
MANDIR=/usr/share/man install
KERNEL_DIR=/usr/src/linux-2.6.7  >&
iptables-install.log

Anyway, my problem is nothing to do with Linux kernel
2.6.7. The RELATED did not work on kernel 2.6.5 and
iptables 1.2.9. That's why I upgraded the kernel and
the iptables.

> > > You should post the complete list of your rules
> in
> > > all of the tables.
> > >
> > 	/sbin/iptables -P INPUT DROP
> > 	/sbin/iptables -P FORWARD DROP
> > 	/sbin/iptables -P OUTPUT DROP
> 
> What about the nat/mangle/raw tables?
> 
I do not use NAT. It does not operate as a router.
Therefore, no IP forwarding. It's not connected to any
office LAN. Access is only thru the eth0.

I'm not sure about mangle and raw tables. My intention
is to allow access only to the services I offer.

Do I have to use mangle and raw tables? 

Could you kindly write for me a complete iptables
firewall allowing access ONLY to the FTP and ssh? I
know this is a crazy request. But I can implement it
on my server and test. So our test firewall should be
able to accept active as well as passive FTP client
connections for file upload and download and ssh
access for me to manipulate the server.

Kind regards
Sagara


		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 

