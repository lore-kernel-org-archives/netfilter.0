From: "Laurence J. Lane" <ljlane@nontoxic.org>
Subject: Re: quickie - exclamation point with multiport
Date: Wed, 17 Dec 2003 04:32:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031217093202.GA23130@absolom.libra.net>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57C5D@OST_EXCH_USR5> <1071650977.906.10.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1071650977.906.10.camel@elendil.intranet.cartel-securite.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Dec 17, 2003 at 09:49:37AM +0100, Cedric Blancher wrote:

> > Justa quick one - I use $DMZPORTS to define the ports I wish to be allowed
> > inbound on the forward chain - can I use 
> > ! -m multiport --dports $DMZPORTS
> > to mean "any port that isn't specified by $DMZPORTS"?

> Match is called "mport", not "multiport". So you call it using :

FWIW, multiport is the stock match. mport is an enhancement to
multiport and is currently supplied in patch-o-matic base.

