From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Questions about the workings of iptables
Date: Tue, 27 Jul 2004 09:47:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407270947.39244.Antony@Soft-Solutions.co.uk>
References: <564DE4477544D411AD2C00508BDF0B6A21C4DABE@usahm018.exmi01.exch.eds.com> <200407261417.33159.Antony@Soft-Solutions.co.uk> <opsbsb0q0j2fsc0m@192.168.1.10>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <opsbsb0q0j2fsc0m@192.168.1.10>
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

On Tuesday 27 July 2004 8:20 am, Ashutosh wrote:

> > No.   AFAIK the connection tracking in netfilter checks only src+dst
> > IP+port, nothing else.
>
> .. And the Protocol

Er, well, yes.   I kind of took this bit for granted, but you're correct; a 
conntrack entry for a TCP connection between a.b.c.d:e and v.w.x.y:z will not 
match UDP packets on the same IPs and ports :)

Also, conntrack entries take care of non-TCP/UDP connections (eg ICMP, ESP) 
which do not have port numbers, therefore src+dst IP (and protocol) are the 
only things matched here.

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


