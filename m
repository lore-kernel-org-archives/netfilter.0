From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Source NAT
Date: Wed, 31 Aug 2005 06:37:33 -0500
Message-ID: <200508310637.33322.rob0@gmx.co.uk>
References: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <58867.212.100.225.55.1125487119.squirrel@webmail.*>
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

On Wednesday 2005-August-31 06:18, Jimmy wrote:
> I currently have a situation that I am hoping iptables can resolve.
> The issue is that I need to NAT the source address based on the
> destination address. Is that possible with IPTables ?

Trivial.

> if dst = 1.1.1.1 src = 10.1.1.1

iptables -vt nat -A POSTROUTING -d 1.1.1.1 -j SNAT -to 10.1.1.1

> Can anyone give me any advice on completing that?

"man iptables"

Order matters. If you have a catchall SNAT rule before the specific 
destination ones, the catchall is the one used.

NAT != routing. If your SNAT'ed IP addresses need to go out different 
interfaces, this won't work. See the LARTC HOWTO.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

