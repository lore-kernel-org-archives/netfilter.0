From: "Pawel Staszewski" <pstaszewski@artcom.pl>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 01:34:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005801c3d7da$afe66460$0d04460a@orion>
References: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com> <003801c3d7d7$ba8ed850$0d04460a@orion> <200401110025.25675.Antony@Soft-Solutions.co.uk>
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


----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, January 11, 2004 1:25 AM
Subject: Re: source-mac filtering


On Sunday 11 January 2004 12:13 am, Pawel Staszewski wrote:

> Hello
>
> Maybe try to block broadcast to the "blocked" client....
> "-m pkttype --pkttype broadcast ........."
>
> I use it and this work fine...

You can use a rule with this match in it to stop your DHCP server giving out
addresses?

I thought DHCPD caught the packets before they ever got to netfilter,
therefore you couldn't block the traffic with any sort of rule.

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the
list;
                                                           please don't CC
me.

Hmm...
iptables -t raw ??
Maybe this helps...

Paol


