From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Mon, 18 Apr 2005 13:09:05 -0700
Message-ID: <1113854945.3544.219.camel@seberino.spawar.navy.mil>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>
	<20050413211349.GA31336@bender.817west.com>
	<425DC2DA.7010608@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425DC2DA.7010608@riverviewtech.net>
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
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Grant

I tried to understand this attack but it was over my head.
The message is simply that
I should only allow loopback traffic whose source
and destination addresses are 127.0.0.0/8 right??

e.g.

$IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE
              -s 127.0.0.0/8 -d 127.0.0.0/8 -j ACCEPT
$IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE
              -s 127.0.0.0/8 -d 127.0.0.0/8 -j ACCEPT

This is safe Right?

chris


On Wed, 2005-04-13 at 18:09, Taylor Grant wrote:
> > allow traffic on the loopback interface unconditionally,  and allow the
> > linux routing code 'martian' checks to drop 127.0.0.0/8 packets received
> > 'on the wire' as it does by default.
> 
> I don't think this is such a good idea.  I could reconfigure my system such that it's loop back interface was not in the 127.0.0.0/8 network and set a route to the 127.0.0.0/8 network to be via your IP on the LAN.  Assuming that your system and my system were on the same LAN and subnet and we could ping each other I would be able to access your 127.0.0.1 address as your kernel would forward traffic to the loop back network in your system.
> 
> 
> 
> Grant. . . .
> 


