From: Willi Dyck <wdyck@gmx.net>
Subject: Re: iptables and ftp
Date: Sat, 22 Feb 2003 00:51:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030221235133.GC412@tekilla.homeip.net>
References: <023001c2daaf$cd19fe80$020010ac@romio>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <023001c2daaf$cd19fe80$020010ac@romio>
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
To: Roman Gavrilov <romio@netvision.net.il>
Cc: netfilter@lists.netfilter.org

On Sat, Feb 22, 2003 at 10:20:11PM +0200, Roman Gavrilov wrote:
> Hello,
> 
> My question is about ftp and ftp data connections.
> I know this subject has been heavily discussed but still ...
> 
> I set up my firewall to allow connections to 21 and 20 ports.
>  I also allowed connections to high ports from outside from port 20.
> and of course I enabled all established and related connections.

Have you loaded 'ip_nat_ftp' and 'ip_conntrack_ftp' ?

Regards,

Willi

-- 
the three great virtues of a programmer:
laziness, impatience and hubris.
        Lary Wall

