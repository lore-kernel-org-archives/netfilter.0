From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: layer 7 netfilter not working
Date: Fri, 9 Jul 2004 22:18:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407092218.40995.Antony@Soft-Solutions.co.uk>
References: <40EF0666.9010902@flintz.de>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40EF0666.9010902@flintz.de>
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

On Friday 09 July 2004 9:56 pm, FB wrote:

> (BTW: when I use the setting from the NETFILTER HOWTO page:
>
> iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j MARK
> --set-mark 1
>
> and change it (as written in the howto under "blocking") to:
> iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j REJECT

I'm not too impressed with a HOWTO which recommends the REJECT target for a 
rule in the mangle table...

REJECT should be done in the filter tables.   mangle tables are for modifying 
strange things about packets (such as MARKs).

Sorry I can't offer any specific help regarding the layer7 patch, but I've not 
used it.

Maybe some LOGging rules would help you?

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


