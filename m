From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need some clarification or help
Date: Tue, 20 Apr 2004 19:47:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201947.39774.Antony@Soft-Solutions.co.uk>
References: <20040420182205.GA2948@rie.rie.priv>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420182205.GA2948@rie.rie.priv>
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

On Tuesday 20 April 2004 7:22 pm, Christian Riechmann wrote:

> Hello,
>
> is it possible to read - via ipq_read/ipq_get_packet - a UDP packetr
> and after some changes to accept - via ipq_set_verdict with NF_ACCEPT and
> shorter length - it as a TCP packet?

My immediate response to this is "no, of course not, because UDP and TCP 
packet headers are completely different".

I mean, UDP packets just get sent - who knows whether the receiver gets them 
or not?   TCP involves a three-way handshake to set up a connection, and then 
sequence & acknowledgement numbers to maintain the reliability.   Creating 
that out of nowhere would be difficult.

> Here is what I wish to do:
> For the transmission of IP packets (UDP, ICMP, TCP) between two hosts
> I want to send these packets through a UDP tunnel.

Tunnelling is a very different matter from converting UDP packets into TCP 
packets, and should be eminently feasible.

http://vtun.sourceforge.net will provide you a general-purpose tunnel which 
operates over UDP.   See if that does what you need - it'll probably simplify 
what you've been attempting to do with netfilter considerably.

Regards,

Antony.

-- 
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


