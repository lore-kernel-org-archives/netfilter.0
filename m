From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mac match
Date: Sat, 24 Apr 2004 09:18:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404240918.46402.Antony@Soft-Solutions.co.uk>
References: <BAY12-F64endgjvM9Kf000022d7@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY12-F64endgjvM9Kf000022d7@hotmail.com>
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

On Saturday 24 April 2004 1:02 am, Robert Gil wrote:

> when using the -m mac match.... does it match the mac address based on the
> last hop... or the source of the sender's mac?

MAC addresses are always the last hop.

> is the mac address stored in
> the header of a packet from the original sender?

No - it is in the ethernet frame header, which only exists between two 
machines directly connected using ethernet.

If two machines A and B are connected via a router, then the router will know 
the MAC addresses for A and B, and A will know the MAC address of the router, 
but not the MAC address of B.

If you don't have an ethernet link (or something very similar, such as 
802.11b) then there aren't any MAC addresses at all (eg: PPP).

Regards,

Antony.

-- 
"I estimate there's a world market for about five computers."

 - Thomas J Watson, Chairman of IBM

                                                     Please reply to the list;
                                                           please don't CC me.


