From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: DROP or REJECT
Date: Tue, 11 May 2004 20:38:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040511183825.GH23789@torres.ka0.zugschlus.de>
References: <163801c4375e$49bb6d50$49caa8c0@caris.priv> <1084295762.1965.8.camel@grendel>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1084295762.1965.8.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tue, May 11, 2004 at 01:16:03PM -0400, Chris Brenton wrote:
> Depends. I like rejecting with host-unreachables as it makes it look
> like you do not have a firewall.

NACK. If I weren't there, the host unreachable would have the source
address of the upstream router, and not my own one. To be truly
invisible, you'd need to fake the upstream router's IP address, which
is (a) not easy to get hold of, (b) most probably not appreciated
by your upstream, and (c) some hosts will completely cease
communication with you which is not always the intended behavior.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

