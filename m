From: Hai To Thanh <nguyenquocanh01@yahoo.com>
Subject: (?)Help me... install iptables
Date: Mon, 10 Jun 2002 19:07:35 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611020735.24629.qmail@web21202.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

  Hi, 
  I download: iptables-1.2.4.tar.bz2 and
linux-2.4.16.tar.gz to setup firewall under Linux 7.1.

  But when I type command: 

  make pending-patches KERNEL_DIR=/usr/src/linux 

to attach functions iptables-1.2.4 to kernel then
following message appear:

  "make: *** Warning: File "Rule.make" has
modification time in the future ( 2001-08-06 01:50:21
> 1998-01-01 02:26:21).
  
  making dependencies: please wait..."

and forever repeating some following message :

  "make: *** Warning: File "Rule.make" has
modification time in the future ( 2001-08-06 01:50:21
> 1998-01-01 02:26:28).
  "make: *** Warning: File "Rule.make" has
modification time in the future ( 2001-08-06 01:50:21
> 1998-01-01 02:26:31).
  "make: *** Warning: File "Rule.make" has
modification time in the future ( 2001-08-06 01:50:21
> 1998-01-01 02:26:34).
  "make: *** Warning: File "Rule.make" has
modification time in the future ( 2001-08-06 01:50:21
> 1998-01-01 02:26:37).
...."
 
 until I type CTRL + C.

 Help me!
 Thank for your help.


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

