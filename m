From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 22:30:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094956251.3969.123.camel@grendel>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<1094941410.3925.20.camel@wolfpack.ljm.dom>
	<200409111726.53499.bulliver@badcomputer.no-ip.com>
	<1094950452.5506.4.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094950452.5506.4.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-09-11 at 20:54, Jason Opperisano wrote:
>
> On Sat, 2004-09-11 at 20:26, Darren Kirby wrote:
> > I will look into this. I assume however that I would need to keep port 23 open 
> > for everyone on the public side for this to work. I was hoping to drop the 
> > packets from everyone except my notebook, hence the original question. Is 
> > there no way to do this?
> 
> if you're looking for a secure way to manage your firewall from the
> internet without allowing "-s 0/0 --dport 22" type access; you probably
> want to setup some sort of VPN access for yourself.

A VPN is probably overkill as SSH is already a VPN (strong built in
authentication and encryption. Heck, I'll take Blowfish over 3DES or AES
for privacy any day of the week :). Two other options come to mind:

1) Bind SSH to a non-standard port
Yes someone doing a full port scan can still find it, blah, blah, blah.
I've been running this for years and have yet to receive a single
non-authorized connect to the port that has actually performed an SSH
handshake.

2) Setup port knocking
http://www.linuxjournal.com/article.php?sid=6811
I know a few people that have set this up with great success. Sure its
vulnerable to replay, but since we're talking SSH that's not really a
problem. Great way to expose ports to only certain users.

So with either option you still want to use public/private keys or
strong passwords with SSH. They are designed to simply mask the service
from all the SSH scanning that's running around the Internet.

HTH,
Chris



