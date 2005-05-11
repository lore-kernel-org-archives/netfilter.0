From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables and port 25
Date: Wed, 11 May 2005 10:55:29 -0400
Message-ID: <20050511145529.GA12831@bender.817west.com>
References: <6.2.1.2.0.20050511160801.01e6e430@domino.offis.uni-oldenburg.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <6.2.1.2.0.20050511160801.01e6e430@domino.offis.uni-oldenburg.de>
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

On Wed, May 11, 2005 at 04:10:58PM +0200, Ludger Zachewitz wrote:
> In addition I have already used tcpdump to search for the error. On the 
> host X    I have executed
> the following commands:
> 
> "telnet my.domain.de 24"
> "telnet my.domain.de 25"
> "telnet my.domain.de 26"
> 
> Before, I have executed the command "tcpdump -i ppp0 dst host my.domain.de 
> and host X"  on
> the host "my.domain.de". The results of the command are:
> 
> 12:07:02.059587 IP X.48985 > my.domain.de.24: S 1047882620:1047882620(0) 
> win 5840 <mss 1460,sackOK,timestamp 319295859 0,nop,wscale 0>
> 12:07:31.167614 IP X.48987 > my.domain.de.26: S 1064293298:1064293298(0) 
> win 5840 <mss 1460,sackOK,timestamp 319296869 0,nop,wscale 0>
> 
> Again there is no log of any connection or traffic to port 25.
> I don't understand why. Could anyone help, please?

looks like the port 25 packet is getting dropped by something between
your test machine and host X.  either the ISP of client machine or your
ISP filters TCP port 25 traffic (not uncommon).

-j

--
"Chris: Yo, did y'all check me when that hottie was all up in my
 Kool-Aid? Yeah, I was looking to break off a little somethin' somethin'
 but my crew gave me the 411 on that skank and she's all about the
 bling-bling."
        --Family Guy

