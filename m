From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: "iptables -h" seems to be overly verbose
Date: Wed, 29 Oct 2003 18:40:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310291840.h9TIesE06107@agate.rockstone.co.uk>
References: <Pine.LNX.4.44.0310291324230.27971-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310291324230.27971-100000@localhost.localdomain>
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
To: iptables mailing list <netfilter@lists.netfilter.org>

On Wednesday 29 October 2003 6:25 pm, Robert P. J. Day wrote:

>   following the man page, i wanted to see just the information
> about symbolic names for ICMP types with:
>
>   $ iptables -p icmp -h
>
> but i got what looks like the full online help.  should i have
> expected this?

I get the normal full help, followed by the ICMP-specific help.

Similarly for "iptables -p tcp -h" and "iptables -p udp -h", except there's 
not so much TCP-specific or UDP-specific stuff as there is for ICMP.

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

