From: "Aldo Lagana" <alagana@discmail.com>
Subject: Re: Packet Sniffing
Date: Tue, 15 Apr 2003 13:22:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011401c30373$9b64c220$6d64a8c0@discmail.com>
References: <ABEKJILKOKKGGDJKHKDFIEKJCAAA.patrick@vikus.com>
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
To: Patrick Ahler <patrick@vikus.com>, netfilter EMAIL <netfilter@lists.netfilter.org>

The way I do it: forward ports 80 & 443 to Squid and then report on it with
Sarg - which is then published to an internal web server.  The problem w/
straight netfilter data was that it contained too much - I don't care about
SYN versus RST (in my web usage reports) - just tell me who went where and
when they went there.

Sarg web reports are management-friendly too...you won't have to give him
the executive summary ;-\


----- Original Message -----
From: "Patrick Ahler" <patrick@vikus.com>
To: "netfilter EMAIL" <netfilter@lists.netfilter.org>
Sent: Tuesday, April 15, 2003 1:04 PM
Subject: RE: Packet Sniffing


> Know of any good packet sniffer's? tcp dump with Ethereal is great, but is
> it possible to set up reports from that? I need software that will be able
> to print a report of who was looking at what web pages... and then be able
> to print out weekly reports for each employee or "IP waster" as I call
them
> =). The boss is tired of employees lookin at porn during work =).
>
> Thanks,
> Patrick
>
>
>


