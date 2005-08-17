From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Filtered address in can login
Date: Wed, 17 Aug 2005 07:43:07 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508170742530.14769@yvahk01.tjqt.qr>
References: <1124203482.8177.18.camel@localhost>
	<4302C5C3.4090605@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4302C5C3.4090605@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org


> The only thing that comes to mind is that 168.79.113.141 might be getting in
> under the "--state RELATED" rule if you had an outgoing connection to that IP
> it would possibly be able to get back in.

Heh, webserver hacked?

>> iptables -A INPUT -s 0/0 --protocol tcp --destination-port 80 -j ACCEPT



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

