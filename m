From: Steve Mickeler <steve@warning.ca>
Subject: Re: How filter IP address if it *changes* often?? (think dhcp)
Date: Thu, 27 Mar 2003 23:16:55 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303272314530.4873@gypsy>
References: <20030327200056.A18916@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030327200056.A18916@spawar.navy.mil>
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
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org


Thats what the INPUT and OUTPUT chains are for.

They are for packets destined to and orignated from the local box running
iptables.




On Thu, 27 Mar 2003 seberino@spawar.navy.mil wrote:

> My iptables script filters incoming packets.
>
> One filter is whether the destination address is
> MY machine.
>
> How do this if IP address changes uncontrollably
> like with DHCP??
>
> Thanks,
>
> Chris
>
> --
> _______________________________________
>
> Dr. Christian Seberino
> SPAWAR Systems Center San Diego
> Code 2872
> 49258 Mills Street, Room 158
> San Diego, CA 92152-5385
> U.S.A.
>
> Phone: (619) 553-9973
> Fax:   (619) 553-6521
> Email: seberino@spawar.navy.mil
> _______________________________________
>

