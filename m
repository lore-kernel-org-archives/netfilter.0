From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter Digest, Vol 8, Issue 50
Date: Tue, 29 Mar 2005 11:27:29 -0500
Message-ID: <20050329162729.GA10710@bender.817west.com>
References: <4246eaa4.1642866a.28b0.5dafSMTPIN_ADDED@mx.gmail.com>
	<9927912d050328213425051db9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9927912d050328213425051db9@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Mar 29, 2005 at 09:34:05AM +0400, Visham Ramsurrun wrote:
> I wanted to ask if it is possible to have packets enter a firewall
> host on eth0 and get sent back on the same interface, i.e sth like
> ...-i eth0 -o eth0...

if your routing table says that a packet needs to go out eth0, then it
will go out eth0...if it happened to enter on eth0 isn't really part of
the decision.

> Is this possible using the iptables commands. If not, is there a way
> to do it (I mean by modifying IPTables code)?

if you are trying to override the normal routing decision, you could use
netfilter targets such as DNAT, or ROUTE...or you could use netfilter
MARK-ing in conjunction with iproute2, or just solely iproute2.

-j

--
"The kneebone's connected to the... something. The something's
 connected to the... red thing. The red thing's connected to my wrist
  watch... Uh oh."
          --The Simpsons

