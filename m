From: Jason Opperisano <opie@817west.com>
Subject: Re: valid INPUT/OUTPUT rule piece?--> '-p tcp --tcp-flags ACK,
	FIN FIN -j DROP', etc.
Date: Mon, 31 Jan 2005 16:04:38 -0500
Message-ID: <20050131210438.GA26076@bender.817west.com>
References: <20050126001855.GC15359@spawar.navy.mil>
	<41F6E665.6010000@lopsch.com>
	<20050126052658.GA17112@spawar.navy.mil>
	<20050126190815.GA7187@bender.817west.com>
	<20050131204217.GG2880@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050131204217.GG2880@spawar.navy.mil>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Jan 31, 2005 at 12:42:17PM -0800, seberino@spawar.navy.mil wrote:
> Thanks for your 2 links.  I really did read both of them carefully.
> They explained SYN, ACK and FIN but not URG, PSH and RST.
> Do you have another great link to explain these last 3 flags? :)

yeah--they're all within "The TCP/IP Guide" which I linked to;
specifically:

PSH:
http://www.tcpipguide.com/free/t_TCPImmediateDataTransferPushFunction.htm

URG:
http://www.tcpipguide.com/free/t_TCPPriorityDataTransferUrgentFunction.htm

RST:
http://www.tcpipguide.com/free/t_TCPConnectionManagementandProblemHandlingtheConnec.htm

you can also read some/all of RFC 793--TRANSMISSION CONTROL PROTOCOL:

http://www.faqs.org/rfcs/rfc793.html

specifically--the section on page 35 titled "Reset Generation" explains
all three states that would lead to the generation of a RST packet, and
all three specify the calculation of an acknowledgment number, whether
the packet that leads to the state had the ACK bit set or not.

this plus observation of real OS's in the real world sending real RST
packets leads me to believe that a real RST packet should have the ACK
bit set.  note; however, that more often than not--i have been proven
to be wrong on these types of things--so take what i say with a grain
of salt.

-j

--
"When will I learn? The answer to life's problems aren't at the bottom
 of a bottle, they're on TV!"
        --The Simpsons

