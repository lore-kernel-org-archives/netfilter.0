From: "hard__ware" <hard__ware@hotmail.com>
Subject: Getting rid of the masses of ip_conntrack messages
Date: Mon, 2 Dec 2002 09:22:30 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE28J3Ih7jtrSByh133000043af@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Othmar Pasteka <pasteka@kabsi.at>
Cc: netfilter <netfilter@lists.netfilter.org>

have you made sure that the ip_conntrack_ftp module is loaded as well , #>
lsmod

If so the only thing i can suggest is disableing DROP on
your output for a while and remove the output rules.
(set its CHAIN to default of ACCEPT)

did this stop the messages ? other than that im not sure .
ive tried to follow the entire Kernel Source .c kode,
and to me it looks like you may have a problem in your output and maybe
contrack_ftp problems ...

cya...

