From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: IP Tunnel+IP Tables.
Date: Fri, 10 Oct 2003 09:54:24 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310100940410.11995@simba.math.ucla.edu>
References: <20031010160747.89303.qmail@web11408.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031010160747.89303.qmail@web11408.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kilho Kim <kilho8667@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Fri, 10 Oct 2003, kilho Kim wrote:
> The problem we're having is just changing the internal
> net addresses costs too much. It is not ordinary
> network but special network that has very limited
> resources ...

That kind of problem is seen a lot -- you get funding to buy equipment,
even buildings, but no funding for salaries to operate it.  If it's like a
student network, designing and setting it up may look like the biggest
challenge, but once that's done, the job of keeping it clean and
functioning is beyond what students can reasonably commit to.

> 3. Just don't allow client from accessing those public
> internet machines using the address we're using.
> This seems to be the easiest. Install firewall on
> machine B, and block anything that goes to the IP
> addresses that we're using. Well, but people who wants
> to contact the machines that has the same IP addresses
> as we do will complain.

Definitely the best solution -- and you don't have to mess with the
tunnels.  You say "just don't allow..."  Don't create special rules to
enforce anything.  All you need is a default route on every machine
pointing to its proper gateway.  (Plus firewall rules so a virus on one
internal machine has trouble to spread to others.  And keep up to date on
patches.)  Pretend there are no address conflicts, and if an internal
machine talks to another internal machine when they wanted an external one,
well, that's the price of not doing the addresses right.

In any case, it will not be possible for the global internet to contact
internal machines with stolen addresses.  For that, you could try the DNAT
thing, just for two or three special servers, not for every internal
machine.


James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

