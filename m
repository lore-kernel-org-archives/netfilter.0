From: Jason Opperisano <opie@817west.com>
Subject: Re: ICMP rule for stateful firewall
Date: Mon, 9 May 2005 11:16:55 -0400
Message-ID: <20050509151655.GA5153@bender.817west.com>
References: <9927912d05050903154ad4c3f6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9927912d05050903154ad4c3f6@mail.gmail.com>
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

On Mon, May 09, 2005 at 02:15:51PM +0400, Visham Ramsurrun wrote:
> Hi to all,
> 
> I wanted to ask if such a rule was possible:
> 
> iptables -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
> 192.168.10.0/24 -m state --state NEW,ESTABLISHED,RELATED -p icmp
> --icmp-type echo request -j ACCEPT

first, it's "echo-request" not "echo request"

grant already covered all the idiosyncrasies of having the same inbound
and outbound interface and the same layer3 subnet pretty thoroughly.
the only thing i'll add is that i can't think of a situation where an
ICMP echo-request packet would be marked RELATED or ESTABLISHED by the
conntrack code.  in the case of a normal ping, ICMP echo-requests are
NEW, and ICMP echo-replies are ESTABLISHED.

i guess given grant's and my comments; i'd say, while that rule is
"possible" i don't see the point of it, and i question whether it meets
the intended purpose.

-j

--
"Stewie: Careful! You're washing a baby's scalp, not scrubbing
 the vomit out of a Christmas dress, you stupid holiday drunk."
        --Family Guy

