From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTABLES + IPROUTE2
Date: Sat, 24 Jan 2004 14:54:00 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401241454.00973.Antony@Soft-Solutions.co.uk>
References: <EHENIKBEJAMHPLPJOJBPIEDNDIAA.lucho@galix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EHENIKBEJAMHPLPJOJBPIEDNDIAA.lucho@galix.com>
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

On Saturday 24 January 2004 12:57 pm, L.Malinov wrote:

> Hi Antony,
>
> In my situation is not possible to set router1 as a default route because
> the machine acts as a mail server as well and the mail needs to go through
> router1.

Okay then - in that case I suggest you use iproute2 to route all TCP port 80 
packets via router2, all TCP port 25 packets via router1, and decide what you 
want to do with everything else such as DNS.   I don't see that there should 
be any need to MARK packets - just route based on the destination port 
number.

see http://lartc.org for more details of iproute2 and what it can do.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


