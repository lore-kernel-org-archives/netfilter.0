From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 12:58:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040718165830.GA30303@tranquility.scriptkitchen.com>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181610.52327.Antony@Soft-Solutions.co.uk> <20040718162409.GA30107@tranquility.scriptkitchen.com> <200407181739.05377.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407181739.05377.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sun, Jul 18, 2004 at 05:39:05PM +0100, Antony Stone wrote:
> This one:
> > > > $IPTABLES -A FORWARD -d 10.10.10.2 -p tcp --dport 25 -j ACCEPT

I have pasted my FORWARD rules at, (they are small and simple),
http://payal.staticky.com/fw1.txt

> > > > $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> > > > $IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 3128 -j ACCEPT
> > > > $IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 53 -j ACCEPT
> > > > $IPTABLES -A FORWARD -s 192.168.0.0/16 -p udp --dport 53 -j ACCEPT
> 
> These rules do not say "but only to the Internet", therefore they allow 
> packets to the DMZ as well.

It is still very confusing. Forget port 25 for a moment. I have never 
mentioned port 10000, the webmin port at all. Still I can access it
from my LAN machine? HOW? Afterall the FORWARD policy is DROP. It should
DROP what it cannot find.
If I do a specific DROP like 
$IPTABLES -A FORWARD -s 192.168.0.0/16 -p tcp --dport 10000 -j DROP 
the packets are dropped, but not otherwise.

What must be wrong?

With warm regards,
-Payal

