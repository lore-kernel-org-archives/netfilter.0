From: "patrick kuah" <patrickkuah@msn.com>
Subject: Re: VPN question
Date: Tue, 14 Oct 2003 15:25:13 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY4-F42tUqsLKqewA30000cc37@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cbrenton@chrisbrenton.org
Cc: netfilter@lists.netfilter.org

Thanks Chris :)

I'm using ipsec. Currently, my iptables is configured using stateful packet 
inspection.
Do i have to add the rules for port TCP/UDP 50 and TCP 50 ???
Thank you :)

patrick


>From: Chris Brenton <cbrenton@chrisbrenton.org>
>To: patrick kuah <patrickkuah@msn.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: VPN question
>Date: 14 Oct 2003 06:44:27 -0400
>
>On Tue, 2003-10-14 at 06:19, patrick kuah wrote:
> > Hi all,
> >
> > I have configured a SNAT rule in my iptables but after configuring, i 
>can't
> > VPN to my server which reside on another network.
>
>Do you see this traffic being dropped by your logs?
>
> > Do i need to add rule for VPN traffic to flow through the SNAT? If yes, 
>what
> > are the rule?
>
>VPN is a generic term. What kind of VPN are you talking about? IPSec?
>PPTP? SSL?
>
>If you mean IPSec, you need to open UDP/500 to UDP/500 as well as
>protocol 50. You also want to make sure that IPSec/IKE is only
>negotiating ESP as a security service, not AH.
>
>HTH,
>C
>
>
>
>

_________________________________________________________________
Take a break! Find destinations on MSN Travel. http://www.msn.com.sg/travel/


