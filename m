From: "John Black" <black@arbbs.net>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 08:13:00 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4034c46c.4a64.0@arbbs.net>
Reply-To: black@arbbs.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


>
>Okay, so that rule is going to hide your 192.168.0.0/24 >network behind the
public address of the firewall for all >packets going to addresses in the range
161.x.x.x/21 (ie 8 >Class C's in size).
8 Class C's?

>How are you testing this and deciding it doesn't work?
im testing it with my windows machine going to the msn chat rooms, because i
know i will show you what ip address you are coming from.  is there a better
way to check it.

>(By the way, why are you only translating packets which are >going to (presumably)
your ISP?   What about packets going >anywhere else on the Internet?).

I thought that translated all of the packets?  How is it only translating packets
to the ISP?

john
http://www.arbbs.net/

