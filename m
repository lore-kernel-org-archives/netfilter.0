From: Ola Nilsson <ola@fam-nilsson.org>
Subject: Re: IPSec through my firewall (SOLVED!!)
Date: Wed, 23 Feb 2005 09:24:17 +0100
Message-ID: <87u0o3wuoe.fsf@helmut.nilsson.homedns.org>
References: <877jl3wsfq.fsf@helmut.nilsson.homedns.org>
Mime-Version: 1.0
In-Reply-To: <877jl3wsfq.fsf@helmut.nilsson.homedns.org> (Ola Nilsson's
	message of "Sun, 20 Feb 2005 09:23:37 +0100")
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

Ola Nilsson <ola@fam-nilsson.org> writes:

> The ESPinUDP packets where seen as bad packets by
> ip_conntrack_proto_udp.c on line 105 function udp_error():
>
> 	/* Truncated/malformed packets */
> 	if (ntohs(hdr->len) > udplen || ntohs(hdr->len) < sizeof(*hdr)) {
> 		if (LOG_INVALID(IPPROTO_UDP))
> 			nf_log_packet(PF_INET, 0, skb, NULL, NULL, 
> 				  "ip_ct_udp: truncated/malformed packet ");
> 		return -NF_ACCEPT;
> 	}
>
> By removing this code from udp_error() I can successfully connect my
> IPSec tunnel.

Answering myself (again...) I have now confirmed that it is the
clients UDP packets that are wrong. A nice sysop at the other end of
the tunnel has also started working on getting it fixed in the client.

Stange, if I where to write an application using UDP, I would use the
TCP/IP stack of the machine. What I saw here was that the ISAKMP
packets had the correct length in the header, but the ESP in UDP did
not. That has to mean that someone used raw sockets, and wrote their
own UDP/IP packets to it.

Anyhow, don't take any more notice of me, of cause netfilter should
not be changed since the client sends bad UDP packets...
-- 
/Ola Nilsson


