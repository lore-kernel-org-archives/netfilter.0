From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Tue, 12 Apr 2005 10:41:57 -0400
Message-ID: <1113316917.2007.26.camel@grendel>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
	<425AF2B7.2050402@riverviewtech.net> <1113266214.2111.46.camel@grendel>
	<425B3354.2030807@riverviewtech.net> <1113278818.2151.87.camel@grendel>
	<425B779B.60907@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425B779B.60907@riverviewtech.net>
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
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2005-04-12 at 03:24, Taylor Grant wrote:
>
> In short, deciding if the ACK and RST flags to together or not is about like deciphering the English language.

Luckily I speak native English and Hex. ;-) Try this: 

In one terminal window run:
tcpdump -nn -v -i lo

In another terminal window run:
hping -A -c 1 -p 5 127.0.0.1
hping -S -c 1 -p 5 127.0.0.1

You'll see the first packet causes a RST only to be returned. The second
will cause a RST/ACK to be returned. So either condition is a
possibility and a Netfilter rule base needs to handle both of them
appropriately. 

HTH,
Chris



