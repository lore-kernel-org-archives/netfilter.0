From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Redirecting outgoing SMTP from LAN to another LAN server
Date: Sat, 15 May 2004 13:27:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040515122701.GA21149@acentral.co.uk>
References: <20040429095949.GB22172@acentral.co.uk> <20040429144757.GA6534@zion.homelinux.com> <200405131346.12621.gdh@acentral.co.uk> <200405131442.24566.Antony@Soft-Solutions.co.uk> <40A6021D.9030201@arava.co.il>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40A6021D.9030201@arava.co.il>
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
To: netfilter@lists.netfilter.org

On Sat, May 15, 2004 at 02:42:21PM +0300, Micha Silver wrote:
> Gavin:
> Why would your LAN users ever need to send SMTP to anywhere other 
> than your MTA?

Mostly as a convenience. We have dozens of LAN machines with an 
assortment of SMTP server settings. We also have some notebooks that 
roam between different sites, and I deemed it more appropriate to 
force everyone to use the local MTA than to have to manually reconfigure 
everything.

> With the above rules aren't you allowing an 1nside (I 
> like that 0 1 idea!) computer, infected with a worm to propagate the 
> virus?

Yes and no. Yes by allowing people to theoretically connect to any 
external MTA, the virus can propogate, but this is weighed against the 
monitoring I have in place so that the number of mails processed and 
load average on the MTA machine will spike up, and this allows me to 
quickly identify the offending machine and firewall it out completely 
whilst the virus is neutralised..

Thinking about it, I could simply firewall things more so that only
"our" MTAs are permitted... hmm I might do that actually - thanks for 
the train of thought.

I'm glad you like the 0utside/1nside thing... it even holds (to a lesser 
extent) when you have eth2 configured as the 'DM2' interface :)

Cheers,
Gavin.


