From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: iptables and their use..
Date: Sun, 2 Jun 2002 16:24:54 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020602162454.O27307@funkyjesus.org>
References: <200206021136.51855.ve1drg@av.eastlink.ca> <20020602170044.D12326@oknodo.bof.de>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020602170044.D12326@oknodo.bof.de>; from bof@bof.de on Sun, Jun 02, 2002 at 05:00:44PM +0200
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
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Sun, Jun 02, 2002 at 05:00:44PM +0200, Patrick Schaaf wrote:

> > So - as a general rule, what does one do?  What do people block and what
> > do they accept??
> 
> General rule: block everything, log the blocking, stare at the logs while
> doing what needs to be done, and then accept what is neccessary, and no
> more.

Spot on - "that which is not explicitly permitted is denied" is the way to
go, only allow traffic in that's required.

> You'll learn all the common stuff in about 1-2 years.

Bah, depending on time and intelligence it shouldn't take that long, plus
don't worry about the common stuff... if you block everything then
everything's blocked :)


-- 
FunkyJesus System Administration Team


