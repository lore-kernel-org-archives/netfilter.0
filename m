From: Victor Julien <victor@nk.nl>
Subject: best way of knowning what matches and targets are available
Date: Thu, 29 Jul 2004 12:06:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407291206.59046.victor@nk.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi list,

I'm developing a netfilter front-end (http://vuurmuur.sourceforge.net) and i 
was wondering what the best way is to determine which targets and matches are 
loaded. Just looking at the output of 'lsmod' won't cut it, since not 
everyone uses modules.

I have found /proc/net/ip_tables_matches and /proc/net/targets. Is reading 
those 'files' the way to go? Can i be sure that if a match is listed 
in /proc/net/ip_tables_matches i can really use it?

Regards,
Victor

