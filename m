From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: off topic - hope somebody can help
Date: Fri, 11 Jun 2004 12:42:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406111242.10060.gdh@acentral.co.uk>
References: <000901c44f53$44b9be80$0200000a@heretic> <200406111229.36397.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406111229.36397.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On Friday 11 June 2004 12:29, Antony Stone wrote:

> Why shouldn't it?   The interface is still fully functioning even if you
> choose to disconnect it - I think plenty of people would get upset if the
> interface went down on its own just because the cable got unplugged (or the
> hub had a short power failure)...

This is definately one of the biggest no-brain decisions Microsoft made with 
Windows 2000 - as soon as the link on an Ethernet adapter disappears, all 
open TCP sessions from the workstation are immediately reset.

Multiply that by power-cycling a 48-port switch, and you have a headache :/

gdh

