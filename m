From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: iptables NAT routing issues
Date: Wed, 9 May 2007 00:48:06 +0200
Message-ID: <20070508224806.GD23200@outback.rfc2324.org>
References: <4640E893.1010206@bserved.nl>
	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>
	<4640FAD0.9050301@plouf.fr.eu.org>
	<Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>
	<4640FDA9.5000706@bserved.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4640FDA9.5000706@bserved.nl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Wednesday, den  9 May hub Bas Verhoeven folgendes in die Tasten:

> Jan Engelhardt wrote:
> >
> >>Assuming that the outbound server is the default gateway for the web 
> >>server and
> >>receives the return traffic, of course.
> >>    
> >
> >You'd be kinda screwed if that was not the case. Because the 'nat' table
> >is only consulted for NEW connections afaics, the reply packets do _not_
> >get SNATed, since the _first_ packet was the TCP SYN, which makes the
> >connection ESTABLISHED when input processing is done.

  
> The webserver has its own gateway, and that's not the outer box. You 
> seem to be describing the exact problem i'm seeing in tcpdump; new 
> connections get snat'ed, 'forwarded' connections do not.

> Is there really no solution for this?

The solution is to use OUTBOUND SERVER as default gateway or do the
DNATing on the gateway.

Or stop DNATing and use "normal" rules to only allow traffic to
WEBSERVER 80/tcp and reject the remaining traffic.

Ciao
Max
-- 
	Follow the white penguin.

