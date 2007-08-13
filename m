From: "Morten Egelund Rasmussen" <morten.egelund.rasmussen@gmail.com>
Subject: How to NAT Cisco's "Skinny" (SCCP) protocol?
Date: Mon, 13 Aug 2007 10:51:50 +0200
Message-ID: <d60af9b90708130151n2ee6dbfdtb8dabac9c0bea1cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=tXuS0DZsIoKiVxWB6X0nsQ7i2P7HjqrWO0KJpObZ4v3ntFEJKbt/OFG+Jftb+OzdhyeaL4MwTgemn0tBtHDqQHcgk3g808lk90J3gnnUptTa13GOiy7u2ilVw9JXLlyyDK35QEEu3nXc2ug/51gTib3J4fRhxHvzic4hk/qUcq0=
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi all!

Seems like I'm getting out on the deep water here, but how do I NAT
Cisco's SCCP protocol?

I'm trying to do this on a Linksys (WRT54G) router with a Linux kernel
installed. -- Not that the hardware matters anyways...

Seems like "Hipster" has similar problems as I have here:
http://openwrt.org/logs/wrt54g.log.20050819

Should there be an "ip_nat_sccp" module somewhere?

Any ideas?

~Morten

