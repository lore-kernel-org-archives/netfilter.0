From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (SOLVED) URGENT: Some TCP connection halting at SYN
Date: Tue, 11 Jun 2002 20:57:23 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206111957.g5BJvOA18648@Networker.rockstone.co.uk>
References: <3A5DC36EC1506C40825C05BE65E62AEF0E8B2E@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3A5DC36EC1506C40825C05BE65E62AEF0E8B2E@neptuno.idea.com.mx>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Tuesday 11 June 2002 8:51 pm, Omar Castaneda Acosta wrote:

> I was selecting:
>
> CONFIG_IP_ADVANCED_ROUTER
> CONFIG_IP_PNP
> CONFIG_IP_MROUTE
> CONFIG_INET_ECN
> CONFIG_SYN_COOKIES
>
> on my kernel setup, just disabled those and it's working now. Guess I'll
> need to test one by one (most of them weren't needed after all)
>
> It's working now.
>
> Thanks everyone!

When did you last build your kernel ?   I mean, was it soon before the 
problems started, or longer ago ?

 

Antony

