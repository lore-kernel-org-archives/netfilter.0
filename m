From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: Various questions
Date: Mon, 28 Jul 2003 23:50:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F259A89.7D9CC24F@danbbs.dk>
References: <7C9884991ADAE0479C14F10C858BCDF5122E0D@alderaan.smgtec.com>
Reply-To: monz@danbbs.dk
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: =?iso-8859-1?Q?Ant=F3nio?= Godinho <to@mail.isec.pt>, netfilter@lists.netfilter.org

Daniel Chemko wrote:
> 
> 
> >       Is it possible to DROP all those IP's in one rule? ( I don't
> >need to log them since they are invalid anyway )
> 
> Ideally this is done for you with /proc/sys/net/ipv4/conf/*/rp_filter == 1 or 2.

Do note that the rp_filter code will check only for zero (0) or
non-zero.
It changed sometime in the kernel 2.2 tree. Up until that point we could
use 1,2, or 3 to achieve ingress, egress or both. Nowadays it'll do
ingress and egress when using any non-zero value.

-- 
Kind regards / venlig hilsen,
Mogens Valentin, Mr Dev

IT Networking, Security, Server Setup
www.danbbs.dk/~monz   mrdev@danbbs.dk
Phone +45 32 525 878  Cell 51 227 668

