From: George Georgalis <georgw@galis.org>
Subject: Re: IPTables not available
Date: Wed, 26 Jun 2002 08:55:20 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020626085520.A13115@trot>
References: <20020625174406.9A4D9489B@lists.samba.org> <004601c21cb9$a9482400$2400a8c0@inq7.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Resent-Message-Id: <200206261302.g5QD2PX13330@trot.galis.org>
Content-Disposition: inline
In-Reply-To: <004601c21cb9$a9482400$2400a8c0@inq7.net>; from jdelima@inq7.net on Wed, Jun 26, 2002 at 10:32:02AM +0800
Resent-To: netfilter@lists.samba.org
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "jesse.linux" <jdelima@inq7.net>

On Wed, Jun 26, 2002 at 10:32:02AM +0800, jesse.linux wrote:
>
>Date: Tue, 25 Jun 2002 08:20:43 -0700
>From: "Daniel Curry" <dcurry@cariocas.com>
>To: "Netfilter (E-mail)" <netfilter@lists.samba.org>
>
>On fresh RH7.2 and RH7.3 installs  IPTables executables are installed,
>but will not execute.  I get Kernel errors.  Can someone please direct
>me to a listing of what steps and option I need to enable this?  I wish
>to put firewalling with NAT services on a machine running an Apache web
>server, with PHP and Perl scripts connecting to a localhosted MySQL DB,
>as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP VPN
>services.  Or a compatible ipchains script for this would also be
>appreciated.
>
>Thanks
>
>Daniel Curry
>IT Manager
>Cariocas
>625 Second Street=20
>Suite 201
>San Francisco, CA 94107=20
>ph: 415-348-6516
>fx: 415-348-6505=20
>cell: 510-579-6680
>
>"If A equals success, then the formula is: A =3D X + Y + Z,=20
>X is work. Y is play. Z is keep your mouth shut."=20
>  - Albert Einstein
>
>maybe ipchains is your problem.....
>try to unload ipchains then execute your iptables rules......
>

yeah, I think rh72 ships with an ipchains kernel. if you apply system
updates, the new kernel is an ipchains one. don't know about rh73, which
would be odd if it's the same reason. ...send the error?

// George

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


