From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Prioritizing empty TCP ACKs?
Date: Wed, 5 Mar 2003 21:45:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303052144020.8093@dns.toxicfilms.tv>
References: <20030305151033.396b3e9a.acosta@ar.microlink.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030305151033.396b3e9a.acosta@ar.microlink.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Costa <acosta@ar.microlink.com.br>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

> Seemed pretty simple and effective to me. Is this possible at all with
> iptables on Linux?
I think i have seen the idea of prioritizing empty ACKs in "Linux Advanced
Routing & Traffic Control" @ www.lartc.org.
Check it out. tc with u32 is powerfull.

Regards,
Maciej


