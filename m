From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what do the contents of /proc/net/ip_tables_names mean?
Date: Thu, 24 Oct 2002 22:19:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021024211932.XLJJ17202.mta01-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210241437140.1620-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210241437140.1620-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Thursday 24 October 2002 7:44 pm, Robert P. J. Day wrote:

>   in looking through the system script for iptables under red hat 8.0,
> i notice the occasional reference to the file
> /proc/net/ip_tables_names, which contains, one per line, the names
> of one of more of the possible netfilter tables (filter, nat
> and/or mangle).
>
>   what does it mean for a table to have its name in this file?

It means that this particular netfilter system supports rules in those tables.

If you compile netfilter without mangle table support and then try to add 
rules to the mangle table, you will get errors.

By reading this file you can find out which tables are supported on a given 
machine.

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

