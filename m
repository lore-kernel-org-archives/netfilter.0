From: raido <raido@elin.ttu.ee>
Subject: Re: Is there a filter for Ethernet packets ?
Date: Wed, 4 Aug 2004 22:30:08 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408042230.08200.raido@elin.ttu.ee>
References: <20040804185709.55744.qmail@web10708.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040804185709.55744.qmail@web10708.mail.yahoo.com>
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

> I'd like to write a filter for all the Ethernet
> frames recevied on an Ethernet interface.  I'm
> wondering if there is something in Netfilter for
> me to use.

I think ebtables (http://ebtables.sourceforge.net/) is for filtering non-ip 
ethernet traffic. Maybe you can get advice from there?

Raido

