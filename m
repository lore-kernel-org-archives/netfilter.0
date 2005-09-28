From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Newb here,
	I need help opening port 1723 and setting a public IP address to a
	private IP
Date: Wed, 28 Sep 2005 18:05:22 -0500
Message-ID: <200509281805.22763.rob0@gmx.co.uk>
References: <fd2d54f80509281502596ad06b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fd2d54f80509281502596ad06b@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 2005-September-28 17:02, Ron Powell wrote:
> Ok I very little firewall knowledge and really know nothing about
> Linux\Unix so go easy on me.

We like "/" as our path separator. "\" is an escape character. So that 
should be "Linux/Unix." :)

Yes I'm teasing. But FWIW this is one of few places it's safe to say 
"Linux" because netfilter is Linux only.

>  What I need to know is this, I have setup a VPN connection on our
> Windows 2003 server. I need to configure our iptables firewall to
> allow this connection,

You mentioned 1723 in $SUBJECT. 1723/tcp is used to negotiate the 
connection, but the actual VPN traffic is GRE, "--protocol 47".

> also if anything is different on a 2000 server I will need to know
> what to change in case we decide to use it in the future.

Hmmm, I would advise anyone to move away from PPTP in particular and 
from Windows in general. PPTP has known vulnerabilities. OpenVPN is a 
real winner with multiplatform support and using OpenSSL for crypto 
code ... as opposed to MPPE ... ugh!

I'll spare the list any OS advocacy, but I do believe you can do much 
more on Linux, and more safely, and without the uncertainty which is 
built-in to proprietary junkware.

Anyway, this list is probably not a good place to find out about 
features in Windows.

> I need the vpn's Public IP to point to the private IP of our 
> VPN server

That part doesn't parse for me.

> and open any ports to that IP that need to be opened for 
> the vpn connection to work, Im guessing just 1723.

Don't guess.

> I think that some rules have already been created that point the
> Public IP to the Private address but not port 1723.

I would not know what your iptables rules are.

> Thanks in advance for any advice you can give.

I would suggest that you get a ready-made firewall script or rules 
generator to get this thing working. Don't try to learn all of this 
right now. If you want to learn TCP/IP and firewalling, by all means 
set up a sandbox and play with it and hang around here.

There are dozens of such projects available. I used to use Monmotha's 
myself. The way it works is that you edit a configuration section to 
tell it about your network configuration and the services to allow. 
Then you run it and it generates your rules. You might want to save 
them using iptables-save(8).
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

