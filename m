From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: P-O-M and string matching
Date: 04 Apr 2003 22:53:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049489589.25147.98.camel@tux.rsn.bth.se>
References: <20030404203815.99224.qmail@web40202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030404203815.99224.qmail@web40202.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: nml <netfilter@lists.netfilter.org>

On Fri, 2003-04-04 at 22:38, SBlaze wrote:

> Its not in the binary... The binary I use right now is from the iptables deb
> package pulled from the testing tree of Debian(doesn't really have any bearing
> on this since it runs fine but does not have string matching set up). Its in
> trying to set up the string matching in a downloaded kernel.org source that I
> have the problem. Other things that I applied with the patch of matic show up
> and I can select as modules fine. String matching just remains to not have the
> option in the netfilter configuration of a make menuconfig (for the kernel.org
> source sym linked to /usr/src/linux )

"Then using patch o matic I applied a very few changes (quote time and
string). Now the quote and time patches are selectable from a make
menuconfig from the /usr/src/linux directory. However the string
matching options are NO WHERE to be found. I don't understand why and
thats why I need help."

I'm _very_ confused here.

First you say you can select the modules and now you say you can't.

Things that's needed to get the stringmatch (and other p-o-m stuff
working):

1. a patched kernel
2. an iptables compiled against that kernel
3. that you actually use that iptables and not the one from debian
unstable.

The Debian iptables package installs the libs in /usr/lib/iptables , the
iptables you compiled installs the libs in /usr/local/lib/iptables.

dpkg -r iptables

-- 
/Martin

