From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Gateway \ FW
Date: Tue, 20 Jul 2004 09:58:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407200958.51956.Antony@Soft-Solutions.co.uk>
References: <HAEOIFPIBBBLGLHOMLLIIELBCEAA.bclark@eccotours.biz>
Reply-To: "iptables" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIIELBCEAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

On Tuesday 20 July 2004 9:11 am, Brent Clark wrote:

> Hi Antony and all
>
> Thank you for reviewing my rule set and I kinda sorted out it out
> accordingly.
>
> If possible, could you please advise, forward a link or an example of what
> you mean by "very few FORWARD rules,". The intent of this machine is to be a
> gateway, link for me and my users to browse. access the internet. My
> connection is adsl.

Well, it's hard to give an example - what I meant by the comment was:

if this machine is primarily a gateway router between a LAN and the Internet, 
then I would expect most of the rules to be in the FORWARD chain (because 
that's the one which controls packets going through the machine), and 
relatively few in the INPUT/OUTPUT chains (because these only relate to 
packets going to/from the gateway system itself).

> In terms of your  2nd option on the list, your 100% in that the default
> policy is DROP. Therefore, im I correct in understanding you that there is
> NO need for any of these DROP rules and that I only need ACCEPT \ FORWARD
> rules.

Well, here's a standard approach to firewall ruleset design.

1. Allow ESTABLISHED & RELATED packets (first, for efficiency).
2. Allow any packets for traffic you want.
3. (default) Drop all other packets.

If you want to do some logging on packets which are being dropped:

1. Allow ESTABLISHED & RELATED packets (first, for efficiency).
2. Allow any packets for traffic you want.
3. Drop any packets you don't want to log.
4. Log any packets which get this far.
5. (default) Drop all other packets.

I hope this helps.

Regards,

Antony.

-- 
"It is easy to be blinded to the essential uselessness of them by the sense of 
achievement you get from getting them to work at all. In other words - and 
this is the rock solid principle on which the whole of the Corporation's 
Galaxy-wide success is founded - their fundamental design flaws are 
completely hidden by their superficial design flaws."

 - Douglas Noel Adams

                                                     Please reply to the list;
                                                           please don't CC me.


