From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: change tos
Date: Fri, 30 Jan 2004 10:27:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301027.01304.Antony@Soft-Solutions.co.uk>
References: <1075450963.23350.1.camel@ns.ipip.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075450963.23350.1.camel@ns.ipip.ro>
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

On Friday 30 January 2004 8:22 am, tiberiu wrote:

> Hi all,
>
> Is there a way to change the TOS to whatever value?

Yes, you can use -j TOS --set-tos in the mangle table.

iptables -h or iptables -j TOS -h for details.

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


