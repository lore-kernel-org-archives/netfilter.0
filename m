From: Michael <mutk@ozemail.com.au>
Subject: Re: IPTables not available
Date: Thu, 27 Jun 2002 03:09:35 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D19F54F.2070404@ozemail.com.au>
References: <731E36372B5FD248AF790189519A32C19E4F88@mailhub.cgtime.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Daniel Curry <dcurry@cariocas.com>, IPtables Users <netfilter@lists.samba.org>

An easy way, exclusively to Redhat as root in terminal:

type    setup   , select system services scroll down, you will find (if 
bog standard RH install) both ipchains and iptables checked. Uncheck 
ipchains, and leave iptables as is.

Precautionary, do
service ipchains stop   as well...
BTW, IPtables is actually iptables , note lower case,

ipchains seems to take presedence over iptables, default RH feeble fire 
wall is ipchains based. Expect that to change !!!

Cheers,
Michael


Daniel Curry wrote:

>On fresh RH7.2 and RH7.3 installs  IPTables executables are installed,
>but will not execute.  I get Kernel errors.  Can someone please direct
>me to a listing of what steps and option I need to enable this?  I wish
>to put firewalling with NAT services on a machine running an Apache web
>server, with PHP and Perl scripts connecting to a localhosted MySQL DB,
>as well as offering sendmail, POP(S)/IMAP(S), ftp, and PPTP VPN
>services.  Or a compatible ipchains script for this would also be
>appreciated.
>



