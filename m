From: Jason Opperisano <opie@817west.com>
Subject: Re: server in DMZ
Date: Thu, 02 Sep 2004 09:13:25 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094130804.2573.9.camel@wolfpack.ljm.dom>
References: <20040902025038.GA10835@tranquility.scriptkitchen.com>
	<1094094296.1824.96.camel@wolfpack.ljm.dom>
	<20040902031755.GA11485@tranquility.scriptkitchen.com>
	<1094095481.1824.102.camel@wolfpack.ljm.dom>
	<20040902035116.GA12345@tranquility.scriptkitchen.com>
	<1094097295.2037.161.camel@localhost>
	<20040902040821.GA12641@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902040821.GA12641@tranquility.scriptkitchen.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-02 at 00:08, Payal Rathod wrote:
> On Wed, Sep 01, 2004 at 11:54:55PM -0400, John A. Sullivan III wrote:
> 
> > I think you have confused the issues.  Do not put the source match in
> > the PREROUTING rule (thus your squid access from the local LAN will not
> > break).  Do put the source match in the FORWARD rule.  That will
> > restrict outside access to only 1.2.3.4.  I assume there is already a
> > FORWARD rule that allows access from the LAN.  Hope this helps - John
> 
> So, you mean I keep the PREROUTING rule as before and make
> -A FORWARD -d 10.10.10.3 -p tcp -m tcp --dport 80 -j ACCEPT
> to
> -A FORWARD -s 5.6.7.8 -d 10.10.10.3 -p tcp -m tcp --dport 80 -j ACCEPT
> 
> But will this not forward requests from my squid proxy server too?
> 
> -Payal

i think there's some confusion here...there are three rules involved in
this scenario:

(1) NAT rule that maps port 80 on the outside to port 80 on your DMZ
server:

  -A PREROUTING -d 5.6.7.8 -p tcp -m tcp --dport 80 \
    -j DNAT --to-destination 10.10.10.3

(2) FILTER rule that allows external access to server in DMZ from client
IP:

  -A FORWARD -p tcp -s 1.2.3.4 -d 10.10.10.3 --dport 80 -j ACCEPT

(3) FILTER rule that allows squid proxy running directly on your
firewall to fetch content from server in DMZ:

  -A OUTPUT -p tcp -d 10.10.10.3 --dport 80 -j ACCEPT

remember:  packets passing through the firewall are filtered by FORWARD,
packets coming from the firewall are filtered by OUTPUT.

-j

-- 
Jason Opperisano <opie@817west.com>


