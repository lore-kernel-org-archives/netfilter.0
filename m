From: Magnus Solvang <magnus@solvang.net>
Subject: Re: lan users surfing on lan webserver
Date: Mon, 3 Mar 2003 15:47:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303144733.GA1404@first.knowledge.no>
References: <20030225215326.GA30804@first.knowledge.no> <20030227123531.GA26259@first.knowledge.no> <20030303133701.GD7199@first.knowledge.no> <200303030859.45430.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200303030859.45430.netfilter@newkirk.us>
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
To: netfilter@lists.netfilter.org

Quoting Joel Newkirk (netfilter@newkirk.us):
[...]
| It should be:
| 
| $IPTABLES -A FORWARD -p tcp -d $INTWEBSERVER1 --dport 80
| -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Yes, I quoted the wrong part. Sorry about that. I had the line you
mention in my script.

| FORWARD because after DNAT has done its job this traffic is no longer 
| addressed to the firewall box.  $INTWEBSERVER1 for the same reason.

Yes...:

| And 
| skip the "-i $EXTIF" to ensure it matches connections from the LAN as 
| well as 'outside' clients.

Doh!!! :)

There I have for copying a line that would forward connections from
the internet to an internal webserver, and leaving it like that when
trying to forward traffic from the internal net as well. So obvious
(now).

| > PREROUTING:
| > $IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTWEBSERVER1 -p tcp \
| > --dport 80 -j DNAT --to $INTWEBSERVER1
| 
| Again, you might want to drop the "-i $EXTIF" part...

:)

| > $IPTABLES -t nat -A POSTROUTING -d $INTWEBSERVER1 -s $INTRANET -p tcp
| > \ --dport 80 -j SNAT --to-source 192.168.1.20
| 
| This part looks fine as-is.

And now the rest looks fine too. Thank you, Joel for seeing what
I couldn't!  :)

And thanks to Pavan Gokarn, for helping me to debug my script!

- M

