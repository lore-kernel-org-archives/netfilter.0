From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables design question (nat)
Date: Sat, 2 Nov 2002 13:00:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021102130007.DYNJ292.mta03-svc.ntlworld.com@there>
References: <1036179693.23663.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036179693.23663.10.camel@localhost.localdomain>
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

On Friday 01 November 2002 7:41 pm, Aki Karjalainen wrote:

> Hi.
>
> I've got a question about IPTables.
>
> Let's say I want to "hide" a public IP pool (e.g. 144.50.50.0/24) behing
> NAT. Easy.
>
> Let's say I want to provide SMTP port from LAN to the outside world. I'd
> say "-t nat -A PREROUTING -p tcp -d FWexternalIP --dport smtp -j DNAT
> --to 144.50.50.12:smtp".

Looks good.   You might want to add a "-i FWextIF" so you only catch packets 
from the outside, not the inside, but it's not too important...

> Ok, I'd still have to allow the connection in the BAD-GOOD chain for
> this to work.

Yes, you need to forward the packets and the replies.

> The result is that the outside world sees the smtp port from the
> firewall external IP _as well as_ directly from 144.50.50.12.

I don't understand this bit.   The fact that you are translating the address 
means that to people on the outside, it is only the FW ext address which is 
visible, let alone offering any services.   In order for the internal address 
144.50.50.12 to be visible to the outside world, you would have to be 
forwarding those through your firewall without any NAT (and this address 
would need to be routed to you by your ISP too)

> The question is how to hide 144.50.50.12:smtp but still allow firewall
> external ip:smtp (DNATted port)?

Does my explanation above answer your question ?

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

