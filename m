From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Stateful firewalling via IPTABLES fails to track FTP passive connections?
Date: Mon, 7 Oct 2002 10:48:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210070948.g979mqL13972@vulcan.rissington.net>
References: <000a01c26d18$2e24c6c0$0500000a@widgets>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c26d18$2e24c6c0$0500000a@widgets>
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
To: netfilter@lists.netfilter.org

On Sunday 06 October 2002 10:10 am, Hubris_1 wrote:

> I'm setting up a basic IPTables filter (IPTables v. 1.2.5 running on a
> RedHat Linux 7.3 machine).  Configuring the IPTABLES is pretty
> straightforward, except that IPTABLES does not detect the port change that
> occurs just after the server accepts the clients PASV request.
>
> My firewall setup is listed below

Please post your ruleset in the form of the commands which create the rules.  
We don't have enough information from the listing output you've provided here.

Maybe it's just me, but I find understanding rulesets from the commands I 
would type in to make it work much easier than looking at the listing output 
from iptables -L

Thanks,

Antony.

-- 

KDE 3.0.3 contains an important fix for handling SSL certificates.  Users of 
Internet Explorer, which suffers from the same problem but which
does not yet have a fix available, are also encouraged to switch to KDE 3.0.3.

http://www.kde.org/announcements/announce-3.0.3.html

