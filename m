From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: setup firewall to allow Remote Desktop in XP???
Date: Mon, 28 Oct 2002 14:47:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210281447.g9SElxe08646@vulcan.rissington.net>
References: <000f01c27dca$38bb9b00$1801010a@demo>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000f01c27dca$38bb9b00$1801010a@demo>
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
To: netfilter@lists.netfilter.org

On Sunday 27 October 2002 3:05 pm, Ben Tan wrote:

> hi,
>     I am considering to setup a firewall to allow the remote desktop
> connection for internet. which ports to allow for INPUT, FORWARD, OUTPUT?
>
>     There will be a DNAT for each connecton request to the internal client.

You do not require any ports open in your INPUT and OUTPUT chains because 
these are only for packets to/from the netfilter machine - which obviously is 
not the machine running the service if you're talking about XP.

Try the following rules in your FORWARD chain, and use the logged results to 
tell you what additional rules you need to allow in order to let the packets 
through:

iptables -A FORWARD -s a.b.c.d -d w.x.y.z -j LOG
iptables -A FORWARD -d a.b.c.d -s w.y.x.z -j LOG

Where a.b.c.d and w.x.y.z are the two machines you're trying to get to talk 
to each other.

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

