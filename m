From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: redirecting traffic
Date: Tue, 26 Jul 2005 05:27:57 -0500
Message-ID: <42E6102D.50304@gmx.co.uk>
References: <200507260941.01656.chadley@pinteq.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200507260941.01656.chadley@pinteq.co.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Chadley Wilson wrote:
> As I progress with my firewall skills, I would like to know if there 
> is a way to take all traffic aimed at a certian machine for certain 
> services and redirect them directly to another server.

How far have you progressed? To the point of reading the NAT HOWTO yet?

> Could some-one offer a few suggestions and possibly some examples on 
> how to achieve this ?

"-j DNAT", documented in "man iptables", examples in the NAT HOWTO.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

