From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 17:17:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c3d6cc$191fc210$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net>
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

> I'm sorry. I tried to read and understand your problem several times but
> I'm lost. Can you explain a bit more what the problem is?

oh, of course. in short terms:

if using the inbuilt "ip rule add from .." directive of iproute for advanced
routing everything is working fine. but if i try to use netfilter marks to
do the exact same thing using "ip rule add fwmark ..." outgoing packets find
their way through my routing stuff and out of the net, but incoming replies
just get lost between PREROUTING and FORWARD, probably during the routing
process, for just no reason and without any icmp error messages or
something.



