From: "Walter Dnes" <waltdnes@waltdnes.org>
Subject: Can I use iptables instead of hosts to block adservers?
Date: Fri, 13 Oct 2017 21:02:04 -0400
Message-ID: <20171014010204.GA1316@waltdnes.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfliter list <netfilter@vger.kernel.org>

  I downloaded a large hostfile blocking list recently.  Out of
curiousity, I ran it through a bash script, which fed each hostname to
the "host" command.  Approximately 95% of the host queries returned...

Host <hostname> not found: 3(NXDOMAIN)

  Think about it for a minute.  The people who run adservers *KNOW*
about hostfiles.  It's trivial to set up a script to rotate subdomain
names like a.doubleclick.net, b.doubleclick.net, c.doubleclick.net,
abc.doubleclick.net, etc, etc.  Even domain names can be rotated
through, and aliased.  All the names in the downloaded hostsfile were
probably valid at one time or another, but they age out rather quickly.
This strategy...
a) gets around hostfile-based blocking
b) penalizes hostfile-based blocking by slowing users' computers as they
   scan through an oversized list full of dead subdomain names

  Rather than blocking by ephemeral names, howsabout blocking by IP
address?  I don't think IPV4 addresses are plentiful enough for jumping
around.  This is where iptables comes in.  Let's start off with a
script that uses the 5% of valid addresses that I found.  Setup...

* create chain ADBLOCKLOG with rules
  iptables -A ADBLOCKLOG -j LOG --log-prefix "ADBLOCK:" --log-level 6
  iptables -A ADBLOCKLOG -j DROP

* create chain ADBLOCK with rule
  iptables -I -j ACCEPT

* list adserver addresses as follows...
iptables -I ADBLOCK -d <ipaddress1>/32 -j ADBLOCKLOG
iptables -I ADBLOCK -d <ipaddress2>/32 -j ADBLOCKLOG
iptables -I ADBLOCK -d <ipaddress3>/32 -j ADBLOCKLOG
etc, etc

* if adjacent IP addresses show up, we can aggregate them to /31 or /30
  or /29, etc.

  The last rule in the OUTPUT chain is changed to a jump to the ADBLOCK
chain so that all output is filtered.  If a packet "runs the gauntlet"
successfully, it hits the ACCEPT rule.

Questions...
1) Has this been done before, and am I re-inventing the wheel?
2) Is there a major showstopper problem with this idea?
3) Any suggestions for improvements?

-- 
Walter Dnes <waltdnes@waltdnes.org>
