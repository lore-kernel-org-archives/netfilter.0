From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCP /MAC
Date: Sat, 8 Nov 2003 14:05:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311081405.hA8E59j15513@agate.rockstone.co.uk>
References: <20031108130517.88285.qmail@web60210.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031108130517.88285.qmail@web60210.mail.yahoo.com>
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

On Saturday 08 November 2003 1:05 pm, kannel sms wrote:

> As u said i did all , but it will not reach my
> requirement, because when i added that rule with a
> specific MAC address , according to ur mail it will
> allow  to get all the dhcp facilities .
> But other machines also doing samething . so seems to
> be somewhere has a small problem ,

1. What *exactly* is not working correctly with the rules I suggested?   I 
still do not understand whether you are saying that machines which should 
have access are being blocked, or machines which should not have access are 
being allowed.

2. Have you tried adding a LOGging rule as I suggested to check exactly what 
MAC addresses are on the packets coming in to your machine, just to make sure 
the machine is seeing what you think it should?

Antony.

-- 

Mahatma Gandhi was once asked what he thought of Western Civilisation.

He replied, "That would be a very good idea."
                                                     Please reply to the list;
                                                           please don't CC me.

