From: Patrick Turley <pturley@rocksteady.com>
Subject: Re: Question about limited primary addresses
Date: Tue, 21 Sep 2004 14:27:34 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415080A6.30003@rocksteady.com>
References: <414E5004.1060009@rocksteady.com>	<1095687787.1898.20.camel@wolfpack.ljm.dom>	<41507815.8080008@rocksteady.com>
	<1095794481.1897.39.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095794481.1897.39.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:
 > On Tue, 2004-09-21 at 14:51, Patrick Turley wrote:
 > # uname -a
 > Linux vmg2 2.4.26-gentoo-r9 #2 Fri Sep 3 07:13:35 EDT 2004 i686 Intel(R)
 > Pentium(R) 4 CPU 2.20GHz GenuineIntel GNU/Linux
 >
 > # ip -4 add sh eth0 | wc -l
 > 513
 >
 > # ip -4 add sh eth0 | head
 > 2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
 >     inet 10.1.0.1/24 scope global eth0
 >     inet 10.1.1.1/24 scope global eth0
 >     inet 10.1.2.1/24 scope global eth0
 >     inet 10.1.3.1/24 scope global eth0
 >     inet 10.1.4.1/24 scope global eth0
 >     inet 10.1.5.1/24 scope global eth0
 >     inet 10.1.6.1/24 scope global eth0
 >     inet 10.1.7.1/24 scope global eth0
 >     inet 10.1.8.1/24 scope global eth0
 >
 > # ip -4 add sh eth0 | tail
 >     inet 10.2.246.1/24 scope global eth0
 >     inet 10.2.247.1/24 scope global eth0
 >     inet 10.2.248.1/24 scope global eth0
 >     inet 10.2.249.1/24 scope global eth0
 >     inet 10.2.250.1/24 scope global eth0
 >     inet 10.2.251.1/24 scope global eth0
 >     inet 10.2.252.1/24 scope global eth0
 >     inet 10.2.253.1/24 scope global eth0
 >     inet 10.2.254.1/24 scope global eth0
 >     inet 10.2.255.1/24 scope global eth0
 >
 > from a machine assigned 10.1.1.100/16 and 10.2.1.100/16, i can ping:
 >
 > 10.1.0.1, 10.1.1.1, 10.1.2.1, 10.1.3.1, 10.1.4.1, 10.2.254.1, 10.2.25.1,
 > 10.1.25.1, 10.2.255.1
 >
 > ...on the test machine with all the 10.[1-2].[0-255].1/24 addresses.

I've found that ping is not a good test. Even with the networking 
broken, ping still works. Can you try to SSH/telnet/ftp/foo to the test 
machine?


