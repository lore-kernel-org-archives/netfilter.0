From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: P-O-M and string matching
Date: 04 Apr 2003 22:32:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049488336.25147.91.camel@tux.rsn.bth.se>
References: <20030404201402.67633.qmail@web40205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030404201402.67633.qmail@web40205.mail.yahoo.com>
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

On Fri, 2003-04-04 at 22:14, SBlaze wrote:

> azkerban:~/iptables-1.2.7a# make KERNEL_DIR=/usr/src/linux | grep string
> Extensions found: IPv4:quota IPv4:string IPv4:time
> 
> It appears that the p-o-m is doing its job.... Mayb I am wrong but this leads
> me to believe it might be a problem with the string matching files/code ?

iptables installs in /usr/local/ by default.
You don't have an old install (maybe an old installed package?) in /usr
?

-- 
/Martin

