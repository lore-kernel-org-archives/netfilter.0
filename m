From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Best Practices for iptables
Date: Fri, 5 Dec 2003 16:16:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031205211647.GA1381@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122EAF@alderaan.smgtec.com> <200312051809.15662.Antony@Soft-Solutions.co.uk> <1070652599.18670.152.camel@tarkus> <20031205124310.4d4417fc.mgale@utilitran.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031205124310.4d4417fc.mgale@utilitran.com>
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
To: Michael Gale <mgale@utilitran.com>
Cc: netfilter@lists.netfilter.org

On Fri, Dec 05, 2003 at 12:43:10PM -0700, Michael Gale wrote:

> 
> What about OUTPUT ?
> 
> You should block everything in every direction and then allow what you want per interface.

In general, yes. This would be the best (although, a bit more work) solution.
Usually the inside endpoints are the clients connecting to the outside services
which leads you to do "-p tcp/udp -o EXT -sport 1023: -j ACCEPT" however,
a hacker might run services inside on a high port and regularly initiate
outgoing traffic to a wel-defined IP/port which makes the firewall add this
to its internal conntrack then they would come in from that IP/port. That's
why you need to do some sanity checks for syn packets in ESTABLISHED state
along with many more other checks.

Most of the time, however, the OUTPUT and the outgoing FORWARD is relaxed
just because of the (false) assumption that the harm comes from outside.

Ramin

> Michael.

