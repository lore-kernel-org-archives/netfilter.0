From: Jason Opperisano <opie@817west.com>
Subject: Re: Port 25
Date: Tue, 08 Feb 2005 08:15:55 -0500
Message-ID: <1107868554.4399.4.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10502071325260.15692-100000@darkstar.sysinfo.com>
	<1107854056.17398.1.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1107854056.17398.1.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2005-02-08 at 04:32, Jose Maria Lopez wrote:
> I don't have the documentation handy, but it said making just a
> DROP could lead you to being DOS attacked. Have anybody heard
> something about this?

i propose that the exact opposite is true.  why should i make my
firewall undertake the effort of generating a RST packet for every yahoo
on the Internet that wants to scan my IP range for TCP 139, 445, etc.

DROP-ing a packet doesn't take any real effort on the firewall's part;
whereas generating a RST packet adds at least some overhead--which in
the extreme case could be significant.

-j

--
"Here are your messages: 'You have thirty minutes to move your
 car.' 'You have ten minutes to move your car.' 'Your car has been
 impounded.' 'Your car has been crushed into a cube.' 'You have thirty
 minutes to move your cube.'"
	--The Simpsons


