From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Why are default policies not possible for user-defined chains
	?
Date: Tue, 9 Jul 2002 08:34:56 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA279@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

You could put a RETURN at the end too couldn't you, so it'll return back to
the chain it came from and then end up with the original chains DEFAULT
policy... no?

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Tuesday, 09 July 2002 2:57 AM
To: netfilter@lists.samba.org
Subject: Re: Why are default policies not possible for user-defined
chains?


On Monday 08 July 2002 5:32 pm, Jan Humme wrote:

> What is the reason that iptables does not support default policies on
> user-chains?

I suppose it's partly because there's not a lot of point (that I can see).

You can only call a user-defined chain from one of the built-in chains (or 
from another user-defined chain, which has to be called from a built-in 
chain, etc...) therefore ultimately it's the default policy of the built-in 
chain which determines what happens to a packet if none of the rules match.

> It seems like such a natural extension, and easy to implement. Or not? Is
> there perhaps a catch that I am overlooking?

It's easy enough to put a DROP, or ACCEPT, or whatever, as the last rule in 
your user-defined chain, thereby catching any packets which haven't already 
matched.....

 

Antony.

