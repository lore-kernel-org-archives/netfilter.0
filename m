From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Problem with routing decisions, and multihop
Date: Mon, 4 Jul 2005 10:07:06 -0500
Message-ID: <200507041007.06513.rob0@gmx.co.uk>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<45219fb00507040732192b77e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb00507040732192b77e0@mail.gmail.com>
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
To: NetFilter <netfilter@lists.netfilter.org>

On Monday 04 July 2005 09:32, Lluis Batle wrote:
> I have many problems getting this thing to work. There's a host with
> two network interfaces, where there are two routers to Internet in
> two separated networks. The host uses multihop routing for deciding
> to which router send the packets... but the routing decision is wrong

Does your kernel have the routes patch by Julian Anastasov?
http://www.ssi.bg/~ja/

> Please, help... I'm desperate.

You'll be more likely to get help on the LARTC mailing list.

Why RFC 1918 addresses on these interfaces? Do you have extra router 
equipment between you and the Internet?

Are multiple "ip route get ip.add.re.ss" commands in sequence showing 
routes out the same interface?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

