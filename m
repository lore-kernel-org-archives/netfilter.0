From: Jason Opperisano <opie@817west.com>
Subject: Re: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 10:40:43 -0400
Message-ID: <20050713144042.GA23898@bender.817west.com>
References: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
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

On Wed, Jul 13, 2005 at 03:30:37PM +0530, Chandra.Vempali@infineon.com wrote:
> Hi 
> Thanks for your reply.
> 
> My ip_conntrack_ftp module gets loaded properly.
> 
> If I keep a rule like "iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT"
> It means that traffic is allowed to pass through for all ports which should not be done for security reasons.

that's not what it means at all, but your rules as written make no sense
whatsoever, so something's going to have to change.

> As for passive FTP, I added two rules to allow traffic thru only 21 port.
> iptables -A INPUT -p tcp --sport 21 -m state --state  ESTABLISHED,NEW -j ACCEPT 

the only src port tcp 21 traffic are the replies from the server to the
client on the control channel connection.  these packets will never
be NEW. so let's go with:

  iptables -A INPUT -p tcp --sport 21 \
    -m state --state ESTABLISHED -j ACCEPT

> iptables -A OUTPUT -p tcp --dport 21 -m  state --state NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> So, control messages goes thru firwall successfully.

dst port 21 traffic will never be related to anything, they will only be
NEW or ESTABLISHED:

  iptables -A OUTPUT -p tcp --dport 21 \
    -m state --state NEW,ESTABLISHED -j ACCEPT

> But for the data, now both server and client work on random ports.
> ip_conntrack_ftp module should read this PASSIVE port from FTP message and then it should create an expectation.

it does, and it marks those packets as RELATED, which you have not
allowed in your rules, because you do not trust the conntrack mechanism
because you are smarter than it.

> In my case, it is creating an expectation too. But when data starts flowing, firewall does not allow
> even through it is expectation.

the "proper" solution to this is just to use the conntrack functionality
as it was intended:

  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

but for what ever reason; this is not acceptable to you, so let's HIPPA
them up a bit:

  # allow packets related to FTP connections in
  iptables -A INPUT -p tcp --dport 1024: -m helper --helper ftp \
    -m state --state RELATED -j ACCEPT

  # allow packets related to FTP connections out
  iptables -A OUTPUT -p tcp --dport 1024: -m helper --helper ftp \
    -m state --state RELATED -j ACCEPT
  iptables -A OUTPUT -p tcp --dport 20 -m helper --helper ftp \
    -m state --state RELATED -j ACCEPT

those rules give the appearance of more security.  if you think that the
conntrack mechanism in netfilter actually works--they offer no security
and simply create administrative and computational overhead.

HTH...

-j

--
"Stewie: Baby needs to suck ash. Baby needs to suck ash. Not ass,
 you pervert.  Save it for the interns."
        --Family Guy

