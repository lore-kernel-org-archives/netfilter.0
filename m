From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: state ESTABLISHED,RELATED ignored within a bridge
Date: Thu, 05 Jan 2006 12:03:42 -0500
Message-ID: <1136480622.6374.184.camel@siren.chrisbrenton.org>
References: <200601051604.k05G4ATB028462@zig.murex.com>
Reply-To: cbrenton@chrisbrenton.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200601051604.k05G4ATB028462@zig.murex.com>
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
To: DELORT Stephane <Stephane.DELORT@murex.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2006-01-05 at 17:02 +0100, DELORT Stephane wrote:
>
>  when I use a rule :
>    $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>    $IPTABLES -A INPUT -j DROP
> 
>  The server cannot ping or telnet any other host ! 

This only lets replies back through. You need a rule that permits the
initial session establishment as well. (ICMP type 8 and TCP/23).

HTH,
Chris



