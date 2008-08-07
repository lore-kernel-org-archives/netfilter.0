From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NETMAP of destination *after* routing
Date: Thu, 7 Aug 2008 12:03:28 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808071202200.8323@fbirervta.pbzchgretzou.qr>
References: <g7da9g$21r$1@ger.gmane.org> <alpine.DEB.1.10.0808071340480.31237@mercury.sdinet.de> <g7f2ch$tbm$1@ger.gmane.org> <489B11EA.6020700@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <489B11EA.6020700@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Thursday 2008-08-07 11:16, Grant Taylor wrote:
> On 08/07/08 09:55, Charles Duffy wrote:
>
>> Perhaps I could also also add a rule setting an appropriate mark
>> in OUTPUT. Not being able to communicate with the hosts from the
>> local system is a showstopper, however, and I'd prefer to avoid
>> munging the routing tables if possible to keep the patch to
>> libvirt implementing this functionality minimal. (Robust
>> infrastructure is already in place for modifying iptables rules
>> for libvirt-managed networks; routing, not so much).
>
> If you did get the rules in the PREROUTING and OUTPUT to work and
> they were the same, I'd suggest you put them in a common sub-chain
> and jump to it from both the PREROUTING and OUTPUT chains.  This
> will make maintenance much easier down the road.

That of course won't work because Xtables does chain inspection and
spots the illegal use of SNAT in a chain which is referenced from
PREROUTING.
