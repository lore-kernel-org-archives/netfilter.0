From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple IPSec sessions
Date: Sat, 17 Jan 2004 13:44:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401171344.24184.Antony@Soft-Solutions.co.uk>
References: <000101c3da34$232e0940$e964da9e@gtgjhrm31>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c3da34$232e0940$e964da9e@gtgjhrm31>
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

On Wednesday 14 January 2004 12:19 am, mukesh Kumar wrote:

> Hi All,
>
>    I am trying to extend conntrack/NAT to allow multiple IPsec(ESP)
> tunnels to pass through.

I'm not sure I understand why you need to "extend" it.

> The purpose is to allow multiple lan clients to have sessions with the
> same server.

This is possible anyway.   Standard connection tracking distinguishes 
independent connections by source & destination IP address (and also source & 
destination port in the case of TCP / UDP), therefore so long as at least one 
of the addresses involved in each connection is unique you should have no 
problem supporting mutliple sessions.   You say you wish multiple clients to 
access one server - the clients will all have different IP addresses, 
therefore they will be treated as independent connections.

Regards,

Antony

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


