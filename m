From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: iptables with nat problems
Date: Thu, 25 Sep 2003 09:34:32 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309250927330.1579@simba.math.ucla.edu>
References: <1064462286.4179.72.camel@rh-possum>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064462286.4179.72.camel@rh-possum>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gb <gillian.bennett@celentia.com>
Cc: netfilter@lists.netfilter.org

On Thu, 25 Sep 2003, gb wrote:
> I am running RH8 firewalls with iptables 1.2.6a. The firewalls work just
> fine, but on reboot the nat part doesn't start up. It will not let
> internal traffic out or external traffic in until I do a restart.

Is it possible that some source or destination addresses are alphabetic,
and not in /etc/hosts?  Or that network names are resolved through NIS (YP)
and are not in /etc/networks?  (I didn't notice in the man page that
iptables actually honors networks, but if it did...)  These services start
after the iptables rules are installed.

Fixes: make sure names are in /etc/hosts and /etc/nsswitch.conf is
configured to fall back to files if DNS or YP is unavailable.  Of course,
Real Sysadmins hard-code all IP addresses and networks numerically.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

