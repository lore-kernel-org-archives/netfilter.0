From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ports
Date: Mon, 9 Sep 2002 19:39:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091839.g89Idav05987@vulcan.rissington.net>
References: <3D7CDA9B.1070706@iol.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7CDA9B.1070706@iol.it>
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

On Monday 09 September 2002 6:30 pm, Mattia Martinello wrote:

> Could I allow a packet to transit in the FORWARD chain (under
> masquerading) from some host (or any host) to a host on a port?
>
> iptables -A FORWARD -p tcp -s 0.0.0.0/0 -d 192.168.2.101 -dport 80 -j
> ACCEPT
>
> don't work (only one -d is allowed). What can I do?

You can add another '-'   :-)

iptables -A FORWARD -p tcp -d 192.168.2.101 --dport 80 -j ACCEPT

(The -s 0.0.0.0/0 is redundant - remove it to keep thing simpler.)

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

