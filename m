From: zeus@ix.netcom.com
Subject: Re: SSH Brute force attacks
Date: Wed, 11 May 2005 12:49:42 -0700 (GMT-07:00)
Message-ID: <17707180.1115840986997.JavaMail.root@fozzie.psp.pas.earthlink.net>
Reply-To: zeus@ix.netcom.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: iptables <netfilter@lists.netfilter.org>


> iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 
> -m recent --hitcount 4 --set --name SSH -j RETURN
> 
> this what I get back:
> =====================
> [root@abc root]# iptables -A SSH_Brute_Force -m recent --name SSH ! 
> --rcheck --seconds 60 -m recent --hitcount 4 --set --name SSH -j RETURN
> iptables v1.2.9: Unknown arg `4'
> Try `iptables -h' or 'iptables --help' for more information.
> [root@ns root]#

Try it with a different target.  For some reason the recent module doesn't like some targets (or no target) when matching on hitcount or seconds.

-Bob

