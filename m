From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: OT: iptables-like firewall for windows?
Date: Fri, 22 Aug 2003 21:14:46 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308222103330.3988@xena.cft.ca.us>
References: <3F461A22.90300@bus.okstate.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F461A22.90300@bus.okstate.edu>
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
To: Jason Joines <joines@bus.okstate.edu>
Cc: netfilter@lists.netfilter.org

On Fri, 22 Aug 2003, Jason Joines wrote:

>   We have a completely Linux back-end environment but unfortunately
> hundreds of windows desktops.  I'm pretty tired of all the attacks on
> the unprotected windows boxes but don't have the authority to put up a
> network firewall.  We protect all of our Linux servers with iptables.
> Does anyone know of a similar tool for windows, particularly w2k?  The
> built-in stuff seems to be virtually worthless.

The native filter in WinXP can be configured to totally block or totally
open selected ports.  Unfortunately you have to open 135 etc. if you expect
to have outsiders mount your filesystems or (I think) if you want to mount
theirs.  Not much help there.  3rd party products might be more flexible.

I think you have a social engineering problem.  Has your department
chairman or dean or whatever gotten hit by MSBlaster, SoBig, etc?  Explain
to him/her that a virus could ruin his whole day.  Here at UCLA several
other departments were essentially shut down because they had no firewall.
My department has a very effective one, plus a pretty aggressive policy on
patches, and we evaded MSBlaster, but due to the lack of internal barriers
and some machines that were missed, SoBig got us yesterday.  The campus
telecom service has taken the "unprecedented"  step of blocking relevant
ports at the campus perimeter, to protect our less clueful departments from
the worms and to protect the outside world from our less clueful
departments.  Tell that to your chairman.

James F. Carter (postmaster)         Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

