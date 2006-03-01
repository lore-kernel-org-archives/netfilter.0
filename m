From: Philip Craig <philipc@snapgear.com>
Subject: Re: How to make portforwarding work properly with two ISPs
Date: Wed, 01 Mar 2006 10:16:06 +1000
Message-ID: <4404E7C6.301@snapgear.com>
References: <200602282233.59855.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602282233.59855.tommy@svearike.sytes.net>
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
To: Tommy W <tommy@svearike.sytes.net>
Cc: netfilter@lists.netfilter.org

On 03/01/2006 07:33 AM, Tommy W wrote:
> Hi
> I'm having some trouble with getting my portforwarding to work.
> Basically what I do is check for   destination ip and port, if they match my 
> server's, then to DNAT to the correct box.
> This works perfectly, unless the request is done on the "wrong" interface.
> Meaning if a request comes in on my secondary interface.
> I take it that ALL SENT to the GATEWAY will be redirected to the correct BOX 
> BEHIND.. but it's when the BOX BEHIND starts talking back, it goes out on the 
> standard interface instead of the secondary.
> I use --set-mark 0x2 in the mangle table for getting traffic out on the 
> secondary interface.

The solution here is to remember that a connection was initiated on the
secondary, and set the mark on replies so that they go out the secondary.
I've had success doing this with something like this:

iptables -t mangle -A PREROUTING -i $BOSTREAMIF -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x2
iptables -t mangle -A PREROUTING -i $INTIF -m conntrack --ctstate ESTABLISHED,RELATED -j CONNMARK --restore-mark


