From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: DROP or REJECT
Date: Tue, 11 May 2004 18:15:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084313723.2953.21.camel@grendel>
References: <163801c4375e$49bb6d50$49caa8c0@caris.priv>
	 <1084295762.1965.8.camel@grendel>  <20040511181716.GA9011@home.manuelm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040511181716.GA9011@home.manuelm.org>
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
To: Frank Gruellich <frank@home.manuelm.org>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-05-11 at 14:17, Frank Gruellich wrote:
>
> * Chris Brenton <cbrenton@chrisbrenton.org> 11. May 04:
> > I like rejecting with host-unreachables as it makes it look like you
> > do not have a firewall.
> 
> I hope you do this only in the FORWARD chain, don't you?

Yup. Host unreachables originating from the host that is suppose to be
unreachable don't have quite the same effect. ;-)

C




