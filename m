From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: LAN accessing DMZ
Date: Mon, 19 Jul 2004 07:13:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040719111327.GB26450@tranquility.scriptkitchen.com>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181859.47417.Antony@Soft-Solutions.co.uk> <20040718185129.GA679@tranquility.scriptkitchen.com> <200407182012.13539.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407182012.13539.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sun, Jul 18, 2004 at 08:12:13PM +0100, Antony Stone wrote:
> > >
> > > I do not understand how you can connect through this ruleset to TCP port
> > > 10000
> >
> > I have squid on this machine. Is it because of that?
> > Is it passing thru' squid cos' I enter in my browser
> > https://10.10.10.2:10000
> 
> Yes.   A web proxy running on the same machine means that the INPUT and OUTPUT 
> rules apply, not the FORWARD rules.

Oh! got it now. But now the problem I faced was that my users could not
use hotmail. But once I allowed FORWARD for port 443 they could easily.
Now, if you say FORWARD rules are not applied for web proxy on same machine,
why do i need to open port 443 for hotmail, where as I have declared 443 as
Safe_port in squid's configuration file.

With warm regards,
-Payal

