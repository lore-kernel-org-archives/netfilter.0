From: fming@borderware.com
Subject: selective connection tracking?
Date: Wed, 12 May 2004 13:42:03 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084383723.40a261ebb1122@mail.borderware.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

I am from the FreeBSD/ipfilter world. I recently switched to Linux and 
netfilter. One question I have with netfilter connection tracking is whether 
there I can instruct the connection tracking to selectively tracking 
connections.

Looks to me once I loaded the conn_track modules, everything was tracked. Is 
there a way I can specify, for example, that I only want http to be tracked? 
All other traffic will be dropped anyway, tracked or not.

Regards,
Ming

