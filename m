From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 17:45:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069886704.23423.187.camel@alpha.newkirk.us>
References: <1069853846.3fc4ac966be15@paris-hme1>
	 <20031126151015.GB4486@cannon.eng.us.uu.net>
	 <1069879109.3fc50f45e7331@paris-hme1>
	 <200311262048.49827.Antony@Soft-Solutions.co.uk>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311262048.49827.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

zynkx - AFAIK most if not all of yahoo's mailservers are in
66.218.78.0/23 ip block.  Hotmail I don't know, though.

On Wed, 2003-11-26 at 15:48, Antony Stone wrote:
> On Wednesday 26 November 2003 8:38 pm, zynkx wrote:

> > i have a smtp running and i need to allow traffic
> > coming from these two, (hotmail and yahoo).
> 
> I'm not quite sure why you want to accept email only from Hotmail and Yahoo, 
> and from nowhere else (a lot of people I know do the exact opposite!), 
> however I still think an easier solution to your erquirement is to accept all 
> email through your firewall, and then accept only mail from Hotmail / Yahoo 
> on your mail server - because that can select based on the sender's address, 
> without needing to know the IPs of their mail servers (which may change one 
> day without you knowing).
> 
> Antony.

Ah, but the point is that while lots of spam claims to be from
*@yahoo.com, if it comes to us from a known yahoo IP then we at least
know it's a legitimate source address.  The problem regarding yahoo and
spam is NOT that yahoo is the source of so much spam, but that so much
spam forges a yahoo.com source.  The 'ideal' filter would reject any
email claiming a yahoo sender that doesn't come from a yahoo mailserver.

Examining the source IP of incoming '-p tcp --dport 25 -m state --state
NEW' packets can be quite handy.  I'm not locking down as hard as zynkx
is, and I've taken a different approach, but I can appreciate what he's
trying to do.

On the director node of our mailcluster I have 3 ULOG target rules -
incoming SMTP, incoming POP3, and filtered SMTP (after a chain of DROP
rules have done their job).  I've been writing a script that analyzes
these logs and auto-generates DROP rules based on the reverse DNS
records (dig -x a.b.c.d +short) for the top [cutoff#] sources, IF the
record matches specific patterns, (like regexp "pcp.{5,30}comcast\.net",
which are all comcast cable modems, or no DNS record) and IF there are
more than [threshold#] new SMTP connections within a given time-frame
from that source IP.

Now, just based on the ~3000 source IP's currently in the DROP list, our
daily dose of spam claiming to be from yahoo.com has dropped from 60% of
the server's traffic, to 20%.  Not too damn shabby so far, and I'm
creating new rules as I observe patterns in the blockscript's log of
what it does NOT block.  (logs IP, reverse DNS, and decision)

This would have been a pointless exercise a few years ago, but now with
such treats as SoBig and Fizzer out in the world, that's changed.  (for
any not aware, SoBig functions as a spam relay, and Fizzer as a mini web
host for spammer sites, on infected machines)

j




