From: Jason Opperisano <opie@817west.com>
Subject: Re: state: INVALID
Date: Mon, 22 Nov 2004 12:54:40 -0500
Message-ID: <20041122175440.GA31032@bender.817west.com>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
	<419FD0BD.6000906@uni-paderborn.de>
	<1101061543.3501.18.camel@hubcap.ljm.dom>
	<41A11AD5.3080401@uni-paderborn.de>
	<1101131121.13662.17.camel@hubcap.ljm.dom>
	<41A2010A.9090601@uni-paderborn.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41A2010A.9090601@uni-paderborn.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: bj-schmidt@uni-paderborn.de

alright--let's reset here.  this is how i understand the situation:

you have two machines:

192.168.1.1	(skyron)
192.168.1.2	(gigabyte)

there's an IPSec tunnel setup between the two machines to encrypt all
traffic between them.

you are trying to initiate an SSH connection from 192.168.1.1 to
192.168.1.2.

192.168.1.2 is running iptables.

with no rules loaded on 192.168.1.2, the SSH connection from 192.168.1.1
succeeds.

once you load a basic ruleset on 192.168.1.2--the ACK packets from
192.168.1.2 to 192.168.1.1 get dropped in the OUTPUT chain which allows
"-m state --state ESTABLISHED" packets.

is *all* of the above precisely correct?  if not--where am i losing it?

-j

