From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Why are default policies not possible for user-defined chains?
Date: Mon, 8 Jul 2002 17:56:39 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708165641.UMXD19225.mta07-svc.ntlworld.com@there>
References: <02070818322007.14428@Lms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02070818322007.14428@Lms>
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

