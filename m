From: SBlaze <dagent.geo@yahoo.com>
Subject: Fwd: The witty worm
Date: Sat, 20 Mar 2004 16:34:55 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040321003455.20211.qmail@web61009.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: nf <netfilter@lists.netfilter.org>

Got this in...thought I would forward it on to the nerfilter list in the
interest of security.

According to the link.. "Witty is a network worm that spreads through direct
network connections, targeting machines that are running BlackIce security
software."  

It exploits ICQ apparently... "Witty uses a vulnerability in ICQ instant
messaging protocol parsing routines of the ISS Protocol Analysis Module (PAM)."

It might be a good idea to start LOG lines for a source of port 4000 for
unusual traffic(for iptable secured gateways). This would be effective in Even
beter; block or limit these for awhile?

Good Luck to everyone.

--- Gadi Evron <ge@egotistical.reprehensible.net> wrote:
> From Gadi Evron Sat Mar 20 09:25:22 2004
> Date: Sat, 20 Mar 2004 19:25:22 +0200
> From: Gadi Evron <ge@egotistical.reprehensible.net>
> To: bugtraq@securityfocus.com
> CC: full-disclosure@lists.netsys.com
> Subject: The witty worm
> 
> Information can be found at: http://www.f-secure.com/v-descs/witty.shtml
> 
> According to that link the worm sends itself to 20K random IP's,
> 
> It's also on a repeat though.
> 
> To block it you need to block packets coming from UDP source port 4000.
> 

> I'd suggest blocking local port 4000, as well. This thing spreads fast 
> and many networks probably send it out now too.
> 
> Example Cisco rule which shows how fast this thing spreads (from a 
> network ran by a friend of mine, Scott McHenry):
> 
> deny udp any eq 4000 any (65 matches)
> <20 seconds>
> deny udp any eq 4000 any (77 matches)
> 
> 	Gadi Evron.
> 


=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
http://taxes.yahoo.com/filing.html

