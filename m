From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables -F & iptables -X good enough *for all* tables/chains?
Date: Mon, 24 Jun 2002 17:19:12 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624211912.GA27552@cannon.eng.us.uu.net>
References: <20020624114108.A3305@spawar.navy.mil> <001b01c21baf$a4450a50$0a01a8c0@ed> <20020624125713.A3624@spawar.navy.mil> <20020624232025.B9475@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624232025.B9475@oknodo.bof.de>
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
To: Patrick Schaaf <bof@bof.de>
Cc: Christian Seberino <seberino@spawar.navy.mil>, netfilter@lists.samba.org

On Mon, Jun 24, 2002 at 11:20:25PM +0200, Patrick Schaaf wrote:

> > User defined chains are *not* tied to specific tables
> > as far as I can tell.
> 
> Huh? User defined chains are tied to the table they are created in.
> And I sometimes hate iptables for that...

Why? Reusability? What you do in mangle is not what you do in nat is
not what you do in filter so I see little if not at all reusability.
Or maybe you have other reasons to hate it ;-)

Ramin

> best regards
>   Patrick

