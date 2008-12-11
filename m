From: Philip Craig <philipc@snapgear.com>
Subject: Re: Using MARK and TOS to route traffic through different  	interfaces
 to the same destination
Date: Fri, 12 Dec 2008 09:54:02 +1000
Message-ID: <4941A81A.2010103@snapgear.com>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>	 <49410A7C.6010501@plouf.fr.eu.org> <1228999681.22977.13.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1228999681.22977.13.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

Thomas Jacob wrote:
> Didn't now that, does this always happen (so all locally generated
> packets are routed twice, when iptables is active) or only
> when netfilter changes things that might affect the destination
> of a packet?

Only when netfilter changes things.

