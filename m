From: "Nicholas Basker" <nbasker@india.tejasnetworks.com>
Subject: Is dynamic translation rules possible using ip tables and netfilter
	infrastructure
Date: Mon, 5 Dec 2005 16:07:38 +0530
Message-ID: <GHEPLFGLHNDOFLBPNPOBCEHBEBAA.nbasker@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Received: from localhost (unknown [127.0.0.1])
	by anche.india.tejasnetworks.com (*****) with ESMTP id AAEFC73BFE
	for <netfilter@lists.netfilter.org>;
	Mon,  5 Dec 2005 10:28:26 +0000 (UTC)
Received: from nicholas (unknown [192.168.0.106])
	by anche.india.tejasnetworks.com (*****) with ESMTP id 8C4FB73B41
	for <netfilter@lists.netfilter.org>;
	Mon,  5 Dec 2005 15:58:24 +0530 (IST)
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
To: netfilter@lists.netfilter.org

Hello:

I would like to know if I can configure rules using IP Tables and Filtering
for the following scenario. I tried looking into the FAQ, HOWTO and sample
firewall configurations. My requirement does not match any of them directly.
I have thought of some solutions but not sure if it would work and whether
it is optimal.

I plan to do further experiments but I would very much appreciate your
opinion on the feasibility and the general direction of my solution. It
would be helpful if you could share other ideas and pointers on how this can
be achieved.

Network Setup
=============

The network that I am currently working is as shown below.

MyLinuxNetwork <====> ServiceProviderNetwork <======> MyCompanyNetwork.

Over the service-provider-network, there is a GRE tunnel connecting
MyLinuxNetwork and MyCompanyNetwork. I have a routing protocol running on
MyCompanyNetwork whose dump I am able to receive periodically at
MyLinuxNetwork. So at MyLinuxNetwork side I have the following table.

        T1_dstIP_x1 => T2_dstIP_y1
        T1_dstIP_x2 => T2_dstIP_y1
        T1_dstIP_x3 => T2_dstIP_y2
           *
           *
           *
        T1_dstIP_xn => T2_dstIP_yn

Notes on the above table
========================
01. The ip address types T1 and T2 (say for example Type1 and Type2) are
normal IPV4 address but are mutually exclusive.
02. More than one address in T1 can map to the same address in T2. For
example x1 and x2 in T1 have the same mapping of y1 in T2.
03. This table is dynamic and is updated every few minutes at the
user-layer.
04. There is no protocol that can be run on the tunnel over the
ServiceProviderNetwork.

What I would like to do
=======================

In the Linux router at MyLinuxNetwork, I have a default route, because of
which after POST-ROUTING the ip-packets are received at my layer2 driver
module. In the module I would like to encapsulate the packet with the
mapping provided by the above table. I am trying to get this done using
IPTables facility.

My overall plan is the following
================================

01. In POST_ROUTE MANGLE and FORWARD MANGLE, I am MARK the packet with a
number that will index into the translation table.
02. In layer2 network interface driver, when I receive the packet, I plan to
use the MARK number to index into the table and encapsulate the packet with
the translated T2 IP Address.

Questions regarding the plan
============================
01. I can have one rule for every T1_dstIP_xn IP address with a appropriate
MARK number. Keep updating this rule every time there is a change in the
table. Is there a way so that I can have one rule for the complete table.
Keep chaning the rule whenever the table changes?.
02. Will it be possible for me to access the MARK number that I have set at
layer2 network interface driver level?. I have read the mark is set with in
the Linux System and is not carried with the packet. Is this set in a such a
structure like netdevice so that the MARK value (which is really the index
into my above table) can be accessed?.

Thanks for your time,
Nicholas.



