From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nat table
Date: Sat, 7 Sep 2002 20:06:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020907190623.JDLP25423.mta01-svc.ntlworld.com@there>
References: <000901c2568f$757ca410$0100a8c0@poste1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c2568f$757ca410$0100a8c0@poste1>
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

On Saturday 07 September 2002 5:56 pm, Guillaume wrote:

> I have a windows PC behind a linux gateway with iptables. Whit it, the
> default policy for all is DROP, but the two line "mangle" are ACCEPT.
> .....But, when I put policy for nat table "POSTROUTING, OUTPUT"
> to ACCEPT, it's work!

It is *strongly* recommended that you do not change the default policy for 
either the nat or mangle tables from the standard ACCEPT.

There are two reasons for this:

1. It will cause a lot of things not to work properly.

2. The nat and mangle tables are for natting and mangling, not for filtering, 
therefore you should not apply a filtering policy to them.

> Why when i put default policy of nat table to DROP, i can't connect? even
> with this rules? What i have to do against?

If you DROP packets in the nat table, they will not be able to go through 
your Firewall, even if you allow them in the FORWARD chain of your filter 
table.

All packets entering your firewall go through the PREROUTING chain (nat and 
mangle tables) before entering either the INPUT or FORWARD chain (filter 
table).

All packets going out of your firewall go through either the FORWARD or 
OUTPUT chain (filter table) and then the POSTROUTING table (nat and mangle 
tables).

If you block them at any one of these points they will not get to their 
destination.

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

