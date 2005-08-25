From: David Madore <david.madore@ens.fr>
Subject: is ip6t_REJECT dead? stable?
Date: Thu, 25 Aug 2005 02:53:42 +0200
Message-ID: <20050825005342.GB5106@clipper.ens.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing-List <netfilter@lists.netfilter.org>

Hi,

I'd like to know about the status of the ip6t_REJECT patch which is
found in patch-o-matic-ng.  I'm not sure I know how to read subversion
logs, but it appears not to have changed in nearly a year, which, when
it comes to software, generally means "dead and possibly bitrotten".

So: is it dead?  Or has it simply reached a point of stability and
maturity such that it no longer needs to be updated?  If so, is it
stable enough to be in production use?  When is there a hope of seeing
it in mainline kernels?  (I'm currently doing my IPv6 firewall with
the DROP target, which is in all respects very unsatisfactory.)

PS: It would be highly useful if the iptables/ip6tables man pages
tried to indicate which targets, matches and whatnots are available in
mainline kernels and which need a special patch.  Especially as the
error messages are - uh - unhelpful.

Happy hacking,

-- 
     David A. Madore
    (david.madore@ens.fr,
     http://www.madore.org/~david/ )

