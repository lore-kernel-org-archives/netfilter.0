From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Logging NAT Translations
Date: Tue, 22 May 2007 22:09:56 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Craig Bernstein <cbernstein@cbernstein.com>
Cc: netfilter@lists.netfilter.org


On May 18 2007 20:15, Craig Bernstein wrote:
>
> I can't believe this isn't a FAQ; I apologize if I missed something in
> my searches.
>
> Is there a way to log connections along with all of their NAT translation
> data?

iptables -t nat -N yes_do_me_1
iptables -t nat -A yes_do_me_1 -j LOG ...
iptables -t nat -A yes_do_me_1 -j SNAT ...

iptables -t nat -s 134.76.0.0/16 -d whatever -p tcp -j yes_do_me_1

Or you could use `conntrack -E`... or conntrack -L for a momentary
state.


>
> I am using a Debian (Sarge) system to SNAT guest users from private
> address space to the Internet, and I need to keep a record that
> includes both their internal and external addresses.
>
> Simply logging before the SNAT rule leaves out the external address,
> leaving me only with the original RFC1918 source address.
> /proc/net/ip_conntrack has the information I need, but no way to send
> it to the log it at the beginning and/or end of the session.
>
> There HAS to be an easy way to do this!  Right?
>
> Thank you...
>
> -- 
> ...Craig
>
>

	Jan
-- 

