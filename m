From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat with mac instead of ip address?
Date: Tue, 13 Jul 2004 12:00:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407131200.03000.Antony@Soft-Solutions.co.uk>
References: <OF10BF823B.F4DC31CA-ONC1256ED0.0034E497-C1256ED0.0034FAB7@promon.cz>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF10BF823B.F4DC31CA-ONC1256ED0.0034E497-C1256ED0.0034FAB7@promon.cz>
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

On Tuesday 13 July 2004 10:38 am, a.ledvinka@promon.cz wrote:

> has anyone seen it yet and where?

What are you trying to do?

Change the destination MAC address on a packet, without changing the IP 
address?

Netfilter can't do this sort of thing for you - either you need to put some 
static entries in your ARP table, or you need to configure the required MAC 
address on the destination machine.

I'm puzzled as to why you think you want to do this, though - what's the 
application?

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


