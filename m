From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Expanation needed for Connection Tracking with NAT One-Way
Date: Thu, 10 Jun 2004 08:32:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C862EE.6010304@pbl.ca>
References: <40C3B3E9@webmail.wichita.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C3B3E9@webmail.wichita.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tish Best <tish.best@wichita.edu>
Cc: netfilter@lists.netfilter.org

Tish Best wrote:
> I am able to see the first TCP SYN packet travel from A through B to D.  At 
> this point Router B has an ip_conntrack entry from A to D.  I then see the 
> reply travel from D to C.  C successfully performs NAT translation, and the 
> packet is sent to Router B with a source of C and a destination of B.  I added 
> logging to the iptables entries in Router B, and I see the packet get 
> translated in both the PREROUTING and the POSTROUTING tables, but the packet 
> is never sent.  I never see a new conntrack entry for this packet.

Sounds logical to me that you don't see new conntrack entry for return 
packet.  B never saw SYN sent with IP src B and dst C, so it can't 
relate the return packet with IP src C and dst B to anything.  I don't 
think connection tracking works at all with asymentric routing.  My 
guess is that return packet would end up in INVALID state (try logging 
"-m state --state INVALID", I guess you'll see it there).

Theoretically, connection tracking could work for asymentric routing, 
but it would require B and C exchanging information about states of 
connections (which is not possible with iptables, and I don't know of 
any product that has this functionality), and they would have to have 
insight of each others configuration (which they don't).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

