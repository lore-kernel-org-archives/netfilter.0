From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: displaying connections recognized by the conn.-tracking module possible?
Date: Sun, 22 Aug 2004 18:16:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408221816.53845.Antony@Soft-Solutions.co.uk>
References: <200408211759.50531.shirai@kawo1.rwth-aachen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408211759.50531.shirai@kawo1.rwth-aachen.de>
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

On Saturday 21 August 2004 4:59 pm, Andrej Stender wrote:

> Hi,
>
> is there a tool which is able to print out a list of all tcp-connections
> currently recognized by the connection-tracking module? (on a router doing
> nat) I mean perhaps a similar output than "netstat -t" does, when showing
> all current tcp-connections on a host. Or perhaps is this listed somewhere
> in the /proc filesystem?

cat /proc/net/ip_conntrack

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


