From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 15:04:25 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627190425.GU31466@cannon.eng.us.uu.net>
References: <20020627182753.GS31466@cannon.eng.us.uu.net> <20020627205319.E2890@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020627205319.E2890@oknodo.bof.de>
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
Cc: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.samba.org

On Thu, Jun 27, 2002 at 08:53:19PM +0200, Patrick Schaaf wrote:

> Hi Ramin,

Hi Patrick,

> 
> > Does anyone have a good solution to catch the third (ACK) packet
> > in a tcp connection setup?
> 
> Maybe you could use the CONNMARK patch, found in patch-o-matic?
> Mark the conntrack one way for the first packet of a new connection,
> and later match on that mark, changing it to something else when that
> match hits.

Hmm, OK, interesting. I was thinking to play with Stephen's excellent
module (recent) to acomplish this but I just wanted to have all the
options open. I'll definitely dig into this solution as well :-)

> Thanks for a nice idea from the "how do I bend iptables into a
> programming language" department. :-)

Well, you know, I'm not a kernel guy; not that I can't be one
but I'd leave it to the gurus we have out there. I'm just trying
to gather enough available building blocks to do my things easily :-)

Ramin

> best regards
>   Patrick

