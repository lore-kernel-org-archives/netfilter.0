From: Goetz Bock <netfilter@blacknet.de>
Subject: Re: pptp-conntrack-nat
Date: Mon, 1 Dec 2003 13:16:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031201121615.GT20753@shell.blacknet.de>
References: <13121614429.20031127183415@internetplustravel.ru> <396087453.20031201144322@internetplustravel.ru>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <396087453.20031201144322@internetplustravel.ru>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


On Mon, Dec 01 '03 at 14:43, Oleg Savostyanov wrote:
> OS> I tryed to install extra package - pptp-conntrack-nat
> OS> but failed to do this.
> ...
> OS> Could not find place to slot in ip_conntrack.h line
> OS> TEST FAILED: patch NOT applied.
> OS> [Press enter to continue]
> OS> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] f
> OS> Applying patch extra/pptp-conntrack-nat.patch...
> OS> Failed to patch copy of /usr/src/kernel-source-2.4.18
patch-o-matic works fine for me when i ask it to insert
pptp-conntrack-net. But I'm using 2.4.22 and 2.4.23. Maybe you should
try a more recent kernel :-)
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

