From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple Netmeeting Sessions
Date: Sun, 25 Apr 2004 18:26:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404251826.38016.Antony@Soft-Solutions.co.uk>
References: <408BE248.4030302@rd.arkonnetworks.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408BE248.4030302@rd.arkonnetworks.com>
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

On Sunday 25 April 2004 5:07 pm, Norman Zhang wrote:

> Hi,
>
> I was wondering if it is possible to setup iptables to allow multiple
> Netmeeting sessions originated from internet to local net? So far I map
> the port in /etc/shorewall/rules
>
> DNAT net loc:10.0.0.10 tcp 1720
> DNAT net loc:10.0.0.10 tcp 1503
>
> But it only goes to a single machine? Or do I need gateway for this?

I believe you need H.323 helper modules for netmeeting.   Patch-O-Matic should 
have these.

Regards,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


