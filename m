From: eRDeeS@t-online.de (Rainer Schweitzer)
Subject: conntrack/nat w monolithic kernel: how to ftp to servers on port
	other than 21?
Date: 16 May 2002 13:25:06 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1021548307.2102.17.camel@Schmerle.zh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

Hi,

consider the following:
You want to connect to an ftp server running on, say,
port 5432 from Your internal LAN. Between is a Linux 
box with netfilter, masquerading or S'natting respectively
the internal addresses.

All works fine with ftp servers on port 21, but on port
5432 connection tracking does not work for the ftp protocol.

I'm aware, that i can do a

modprobe ip_conntrack_ftp ports=21,5432
modprobe ip_nat_ftp ports=21,5432

to solve this problem. But what, if I have a monolithic
kernel with all the netfilter code compiled into the
Linux kernel? In this case there is no such thing like
modprobe.

Any idea how to pass these port arguments directly to the
kernel, maybe a boot option I can pass to the kernel at
booting time, or an advice what piece of the source code
to change in what way (iptables 1.2.6a, linux 2.4.18)
to make this work?

TIA, Rainer


