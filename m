From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: some body hacked my system
Date: Tue, 8 Oct 2002 14:36:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021008183622.GA26919@alcove.wittsend.com>
References: <001e01c26edc$73aca530$8c01a8c0@sundaram>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001e01c26edc$73aca530$8c01a8c0@sundaram>
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
To: Sundaram Ramasamy <sun@percipia.com>
Cc: netfilter@lists.netfilter.org

On Tue, Oct 08, 2002 at 11:07:37AM -0400, Sundaram Ramasamy wrote:
> Hi,

> I am allowing ftp connection in my firewall, some body used ftp port, filled
> my hard disk space. He logged-in from 68.65.58.159 IP (/var/log/message)

> Oct  8 00:57:03 linux2 ftpd[25101]: FTP LOGIN FROM
> va-staff-u1-c5a-159.frbgva.adelphia.net [68.65.58.159]

> he created directory named WC3 and transfed follwoing files.

> bash-2.04# cd WC3
> bash-2.04# ls
> wc3.part01.rar.gz  wc3.part07.rar.gz  wc3.part13.rar.gz  wc3.part19.rar.gz
> wc3.part02.rar.gz  wc3.part08.rar.gz  wc3.part14.rar.gz  wc3.part20.rar.gz
> wc3.part03.rar.gz  wc3.part09.rar.gz  wc3.part15.rar.gz  wc3.part21.rar.gz
> wc3.part04.rar.gz  wc3.part10.rar.gz  wc3.part16.rar.gz
> wc3.part05.rar.gz  wc3.part11.rar.gz  wc3.part17.rar.gz
> wc3.part06.rar.gz  wc3.part12.rar.gz  wc3.part18.rar.gz

> Is anybody knows what this file used for?

> How will i block this IP Address in my firewall?

> How will i check what else he did on my machine?

	1) He did not "hack" your box.  You invited him in by leaving
anonymous ftp enabled.  He's just using you as a warez drop site.  I
guess he could have told you "thanks".

	2) Never never NEVER allow both read and write access to any
directories under ftp home directory.  You are useless as a warez
site if his buddies can't download what he uploaded.  If you want
people to be able to upload stuff, have a writable upload directory
that can not be read.  Then move the stuff you want to be available for
download to a readable directory.

	3) Blocking his IP isn't going to do diddley worth of good once
he tells his 10,000 buddies on IRC that he just found a fat disk with
an IP address.

	4) If you want to check your system for tampering, run an rpm
verify run to check the installed system.

	5) If you think he really did hack your system, run ckrootkit,
<www.chkrootkit.org> on it (read the instructions - it's very noisy
and has some false alarms - don't panic if it complains about hidden
processes, just rerun it and verify).

	6) If you think he's REALLY GOOD (and he's not if he's just
flicking his bic playing with warez) then reinstall.  You won't find
the good ones unless you have offline databases of your installed base
and verify using a bootable CD and verifiable software.

> Thanks
> SR

	Mike
-- 
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=mhw=|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

