From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: Core Linux Router - NO NAT
Date: Fri, 21 Mar 2003 09:23:07 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030321152307.GA25317@placemark.com>
References: <200303201723.50161.marks@crvinc.com> <200303210140.48570.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200303210140.48570.netfilter@newkirk.us>
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
Cc: Mark Seamans <marks@crvinc.com>

On Fri, Mar 21, 2003 at 01:41:22AM -0500, Joel Newkirk wrote:
> On Thursday 20 March 2003 06:23 pm, Mark Seamans wrote:

> > I wish to protect the box itself, while it preforms it's duties as a
> > Router allowing only ssh from the ip's that I wish for management. 
> > This way I can also setup rules to protect it form DOS attacks etc...
> >
> > So any suggestions would be great.
> >
> Another approach might be to have only one or two IPs from which you 
> allow SSH connections.  Then if you need to connect from a remote 

I've seen the argument made that ssh should be configured only to
authenticate with rsa keys.

(PasswordAuthentication no)

It makes it impossible for someone to try guessing passwords.
Whether or not you can keep your key secure is another matter.
Also, running ssh on another port, say port 25 or 80 will help you
evade some of the automated scanning tools.

Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)

