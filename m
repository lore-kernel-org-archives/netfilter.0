From: "hard__ware" <hard__ware@hotmail.com>
Subject: IPTables Feature set and performance.
Date: Tue, 3 Dec 2002 07:33:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE22IyhXMOYdOiQ4rYn000056cb@hotmail.com>
Reply-To: "hard__ware" <hard__ware@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: ccmike@isugw.indstate.edu
Cc: netfilter <netfilter@lists.netfilter.org>

I belive you cant Mangle Packets as well on PIX Firewall
Such as TTL Values & MSS Clamps,

here are some things on why i consider netfilter over any other product for
now ..

1) its easy to understand & it works well
2) Completely Open Source Project
3) Using the help from www.lartc.org QoS can be seamlessly intergrated

4) Squid + Netfilter also offers more advantages like
Speedy Web Cache & ACL Rules to Block ADs ect,

5) IPTState is a good utillity for showing your Connections Through & Too
your netfilter firewall

6) IPTables Allows you to set Variables for its ip_conntrack_helpers such as
ftp & irc like,
the Default Port No: to track is 21 this can be changed to Many or Just One
using sysctrl options

7) Kernel Level Networking & Filtering /w Linux ..
have you got a problem, well if your good enough you
can make changes to your kernel / modules that will
improve / manipulate the way your IP V4 Box works.

hope this helps a bit,

Hard__warE

