From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Forward internal packets as though they're external
Date: Thu, 27 Oct 2005 09:38:19 -0500
Message-ID: <200510270938.19458.rob0@gmx.co.uk>
References: <436051E9.2050701@jonheese.com> <200510262351.06929.rob0@gmx.co.uk>
	<4360D12E.4000509@jonheese.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4360D12E.4000509@jonheese.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 2005-October-27 08:07, Jon Heese wrote:
> > Change your DNAT rule to match all the packets you want to match:
> >
> > iptables -vt nat -A PREROUTING -d 65.9.134.4 -p tcp --dport 6969 \
> >     -j DNAT --to 192.168.0.100
>
> Except for the --verbose, that's exactly what I'm already doing to
> DNAT everything from the outside through to castor's 6969.  This rule
> does not seem to be catching traffic from the inside.  Do I have to
> do something special to get internal traffic into the PREROUTING

After I sent this (and went to bed :) ) I realised what must be 
happening: it's getting the original packet there, but replies are 
going direct to the IP of the originator.

Suppose 192.168.0.129 connects to 65.9.134.4:6969 ... the router passes 
it faithfully on to 192.168.0.100. Now 192.168.0.100 has a packet from 
192.168.0.129, and it won't send the reply to 65.9.134.4. The client at 
192.168.0.129 is going to be confused. This cannot be a reply to my 
65.9.134.4:6969 connection attempt, go away, Castor.

Perhaps you need a SNAT rule in POSTROUTING:
iptables -vt nat -A PREROUTING -p tcp --dport 6969 -s 192.168.0.0/24 \
    -d 192.168.0.100 -j SNAT --to 65.9.134.4

A cleaner solution (not sure if applicable to BitTorrent) would be an 
alternate DNS view, so that external clients resolve the name to 
65.9.134.4 whilst internal ones resolve to 192.168.0.100.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

