From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem behind my DMZ
Date: Fri, 9 Jan 2004 10:57:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401091057.19282.Antony@Soft-Solutions.co.uk>
References: <Law9-F354jsKlkag7KO00012b91@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law9-F354jsKlkag7KO00012b91@hotmail.com>
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

On Friday 09 January 2004 9:54 am, Martin Leduc wrote:

> > Is your IP forwarding turned on?
>
> Yes, it is.  Can you explain to me why /32 against /28 netmask, or tell me
> where I can get the documentation?

The /32 and /28 netmasks operate quite simply:

On one interface you use a /32 netmask, which means there is only one 
accessible IP on that network - that of the router leading to the Internet.

On the other interface you use a /28 netmask, which means there are 16 IP 
addresses (14 usable) accessible on that network.

Linux uses its routing table entries from most specific to least specific, so 
if a packet for the one IP address on the /32 network needs to be routed, it 
will go in the direction of the Internet.   If a packet for any other address 
in your public IP range needs to be routed, it won't match the /32 but it 
will match the /28, so it will go to the internal network.

The fact that the two network ranges overlap does not matter (despite what you 
may read in introductory networking books - this is beyond introductory 
networking).

Regards,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


