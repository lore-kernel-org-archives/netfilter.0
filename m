From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: Firewall workaround
Date: Fri, 16 Jan 2004 18:38:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401161838.09129.Antony@Soft-Solutions.co.uk>
References: <357895CFC8CB7C44900D6A4F46D08AA90459CF@exchangeserver.IAT.local> <200401161810.29026.Antony@Soft-Solutions.co.uk> <20040116182408.M27061@tkevans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040116182408.M27061@tkevans.com>
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

On Friday 16 January 2004 6:24 pm, Tim Evans wrote:

> On Fri, 16 Jan 2004 18:10:29 +0000, Antony Stone wrote
>
> > I thought you meant you wanted to bypass the firewall filtering and
> > access some (specific) machines using protocols which were being
> > blocked, but if you want to have a more general routing solution
> > then I agree that a VPN is the way to go.
>
> And you do, of course, mean to observe your organization's Internet
> security policies, right?  Organizations put firewalls in place for a
> reason.

I am, of course, assuming that the original poster of the question is 
complying with the relevant Acceptable Use Policies, however if he wants to 
use the services which are made available (such as SSH on port 22) to access 
other services out on the Internet, then I'm not going to say he can't do it.

Any sysadmin who thinks that a firewall which allows SSH is secure doesn't 
understand enough about common protocols.

If the AUP specifies what the end user is allowed to do with SSH, then of 
course that's a different matter.

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


