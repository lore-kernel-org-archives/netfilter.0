From: Patrick Schaaf <bof@bof.de>
Subject: Re: iptables -F & iptables -X good enough *for all* tables/chains?
Date: Tue, 25 Jun 2002 08:04:51 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020625080451.C9475@oknodo.bof.de>
References: <20020624114108.A3305@spawar.navy.mil> <001b01c21baf$a4450a50$0a01a8c0@ed> <20020624125713.A3624@spawar.navy.mil> <20020624232025.B9475@oknodo.bof.de> <20020624211912.GA27552@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624211912.GA27552@cannon.eng.us.uu.net>; from ramin@cannon.eng.us.uu.net on Mon, Jun 24, 2002 at 05:19:12PM -0400
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
To: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Cc: Patrick Schaaf <bof@bof.de>, Christian Seberino <seberino@spawar.navy.mil>, netfilter@lists.samba.org

> > > User defined chains are *not* tied to specific tables
> > > as far as I can tell.
> > 
> > Huh? User defined chains are tied to the table they are created in.
> > And I sometimes hate iptables for that...
> 
> Why? Reusability? What you do in mangle is not what you do in nat is
> not what you do in filter so I see little if not at all reusability.

I often have user defined chains with nothing but a list of "-s IP -j ACCEPT"
in them. In a "higher level" chain, I select on protocol and port, jumping
to such an "IP address list" chain. It sometimes happens that I need the
exact same list of IP addresses both in the filter and nat/mangle tables,
and I have to duplicate them, then.

I hate it when I have to duplicate stuff needlessly.

On the other hand, as the chains are generated (e.g. by parsing
/etc/hosts.allow), it's not a problem to handle the situation,
and iptables cannot be changed to the "slightly better" behaviour
for compatibility reasons. So don't get me wrong: this is not
a feature request.

best regards
  Patrick

