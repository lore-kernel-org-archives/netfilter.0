From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: default policy for nat/mangle table
Date: Wed, 28 Apr 2004 21:01:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404290401.i3T41c2v007274@server5.bandwidthco.com>
References: <20040428030406.4153.h011.c009.wm@mail.canada.com.criticalpath.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040428030406.4153.h011.c009.wm@mail.canada.com.criticalpath.net>
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
To: swissguy@canada.com, netfilter@lists.netfilter.org

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
swissguy@canada.com
Sent: Wednesday, April 28, 2004 3:04 AM
To: netfilter@lists.netfilter.org
Subject: default policy for nat/mangle table

hello

i have a pretty basic problem, but i dont understand it really os debian
kernel 2.4.18-bf2.4 iptables version 1.2.6a-5

i wrote the following testscript:
#!/bin/bash

IPT="/sbin/iptables"


$IPT -F
$IPT -t nat -F
$IPT -t mangle -F

$IPT -P INPUT   ACCEPT
$IPT -P OUTPUT  ACCEPT
$IPT -P FORWARD ACCEPT

$IPT -t nat -P PREROUTING  DROP
$IPT -t nat -P OUTPUT      DROP
$IPT -t nat -P POSTROUTING DROP


$IPT -t mangle -P PREROUTING  DROP
$IPT -t mangle -P INPUT       DROP
$IPT -t mangle -P FORWARD     DROP
$IPT -t mangle -P POSTROUTING DROP
$IPT -t mangle -P OUTPUT      DROP


$IPT --delete-chain
$IPT -t nat --delete-chain
$IPT -t mangle --delete-chain

when i boot and all the policies are in all 3 tables accept i can do what i
want. now i set the default policy from nat and mangle to drop (there are no
rules)

but somehow it has influence on my filter table, i cant ping or access with
ssh.

now i was thinking that maybe every packet goes through mangle prerouting
before it comes to filter table and thats the reason for. but i am not sure
and it would be nice to understand whats going on or what i am doing wrong

also in the book i use (linux firewall by r.ziegler) the example contains
also to set default to drop on ALL
3 tables.

thanks for you help
Francis

I'm a little late getting to this so you may have a better answer than what
I'm about to give you. But . . . Setting you NAT table chains to default
DROP would be enough to give anyone nightmares. I set all my default FILTER
chains to DROP, MANGLE to ACCEPT, and NAT to ACCEPT. Never done me wrong
yet. Let us know if you need more help.



