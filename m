From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Re: redirecting traffic
Date: Tue, 26 Jul 2005 18:36:24 +0200
Message-ID: <200507261836.24400.chadley@pinteq.co.za>
References: <200507260941.01656.chadley@pinteq.co.za>
	<42E6102D.50304@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E6102D.50304@gmx.co.uk>
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

Thanks good answer mate,
I needed to know what to use, and NAT is the one.
I will read up on it!

Chad

On Tuesday 26 July 2005 12:27, /dev/rob0 wrote:


> Chadley Wilson wrote:
> > As I progress with my firewall skills, I would like to know if there
> > is a way to take all traffic aimed at a certian machine for certain
> > services and redirect them directly to another server.
>
> How far have you progressed? To the point of reading the NAT HOWTO yet?
>
> > Could some-one offer a few suggestions and possibly some examples on
> > how to achieve this ?
>
> "-j DNAT", documented in "man iptables", examples in the NAT HOWTO.

-- 
--
Chadley Wilson
Production Line Superintendant
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================

