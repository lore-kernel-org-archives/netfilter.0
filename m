From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 15:10:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406101510.54483.Antony@Soft-Solutions.co.uk>
References: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv> <200406101428.46072.Antony@Soft-Solutions.co.uk> <0bb501c44ef1$996deee0$49caa8c0@caris.priv>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0bb501c44ef1$996deee0$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 10 June 2004 2:48 pm, Peter Marshall wrote:

> Thank you very much for the help.
>
> Is IDS a packet sniffer ?

Most IDSs do operate by packet sniffing, yes (although you can run them on a 
gateway router if that's what you want to monitor).

IDS means Intrusion Detection System, and such things are used to look out for 
known attack patterns or anomalous behaviour on your network.

Many people monitor both the outside and inside of a firewall, so they know:
a) what probes/attacks were attempted (from outside) and got blocked
b) what probes/attacks got through
c) what probes/attacks originated from the inside
d) what strange traffic is happening on the network (eg from viruses / worms / 
trojans)

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


