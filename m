From: "Alexander Noack" <alex@aiesec.wiwi.uni-rostock.de>
Subject: AW: PPTP/GRE NAT patch for 2.4.20 kernel
Date: Thu, 13 Feb 2003 10:53:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NFBBLIMCOLBEDAIPJPDMIEHLCHAA.alex@aiesec.uni-rostock.de>
References: <20030213092522.GE28593@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030213092522.GE28593@sunbeam.de.gnumonks.org>
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi Harald,

> It seems to be working for most people in most cases,
> though there are still some problems with big-endian
> and 64bit systems.
>
> Please use the patch from the 'extra' repository of
> patch-o-matic from
> cvs.

Is it possible that there are problems when the PPTP-Server also has
pptp_nat installed (acting as a gateway for a NATed network and as a
PPTP server for the outside - including NATed connection requests from
other Linux pptp_nat gateways)?

I saw the same error message many times on the list now (Client gets
stuck while "Verifying Username and Password"). The most recent CVS
Snapshot I experienced this problem with was as of February 3.

Thank you so much for your work.

Ciao,
Alex




