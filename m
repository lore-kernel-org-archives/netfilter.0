From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: UDP packet forwarding woes
Date: Sun, 10 Nov 2002 19:07:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021110190751.HOVX18329.mta06-svc.ntlworld.com@there>
References: <Pine.SOL.4.44.0211101348250.13079-100000@azure.engin.umich.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.44.0211101348250.13079-100000@azure.engin.umich.edu>
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

On Sunday 10 November 2002 6:49 pm, Cynthia Wong wrote:

> I'm trying to do the following with iptables:
>
> Recieve a UDP packet;
>
> forward it to multiple hosts in forwarding table (minus a TTL or so)
> AND
> pass it to user level to process

Nope.   Not with netfilter.

Netfilter can select one target per packet, but once that's done, the packet 
is gone.

The only way you'll do this is to pass the packet to a userspace process, 
which then reinjects separate packets addressed to the multiple hosts.

Antony.

-- 

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety percent.

