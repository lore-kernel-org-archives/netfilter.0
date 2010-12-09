From: Shawn Delaney <sdelaney@juniper.net>
Subject: conntrack problem with with ICMP defragmentenation
Date: Wed, 8 Dec 2010 19:32:14 -0800
Message-ID: <DBDEC20E6E29304D8AE5EAA493609B355764A0391D@EMBX02-HQ.jnpr.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Shawn Delaney <sdelaney@juniper.net>

Hi,

I have what looks like a problem with the netfilter connection tracking defragmentation functionality. First, here's my setup:

I have a bridge (br0) with two enslaved interfaces (int0 and ext0). From the ext0 side, with a windows device, I ping with packet size 1932:

ping -n 1 -l 1932 10.64.160.94

ping request and reply is bridged.

Now if I do the same with packet size 1933:

ping -n 1 -l 1933 10.64.160.94

the request never seems to make it to the bridge interface

If I sniff the ping from the windows device on the ext0 side, I see two frames sent, request + fragment, as expected. 
In the working case, if I sniff ext0 on the bridge device I see the same two frames received. 
In the working case, if I sniff br0 on the bridge I see one frame (I assume the bridge reassembles the request + fragment).
In the non working case,  if I sniff ext0 on the bridge device I see the same two frames received.
In the non working case, if I sniff br0 I see nothing.

It seems there is an issue with reassembly of  packets or fragments of a certain size, and am wondering If this is expected behavior or a bug.

The MTU of all interfaces is 1500.
I am using connection tracking. I don't think it's an issue with bridging because if I remove NAT and connection tracking modules, and repeat the above steps, I don't see the problem.
The problem is seen on kernels 2.6.11 and 2.6.24

Any help would be much appreciated.

Regards.

