From: Unknown <unknown@unknown.invalid>
Subject: Re: secure remote management
Date: Sat, 24 Jan 2004 10:41:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2869.01640142805$1074959037@news.gmane.org>
References: <20040124132219.14068.qmail@mail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <20040124132219.14068.qmail@mail.com>
Content-Disposition: inline
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
To: "Emre CELEB&#304;" <emre22@europe.com>, netfilter@lists.netfilter.org

On January 24, 2004 08:22 am, Emre CELEB&#304; wrote:
> Hi,
> im in responsible for managing 6 iptables firewalls with all in different
> locations, normally i use ssh and scripting to manage those boxes -and very
> happy at the moment -.but unfortunetly my firewall rules are going to be
> too long and compilcated and also -cause of customers checkpoint habits -
> im requied to documantate the rules regularly in an object oriented shame
> like in fwbuilder - which i know have no remote access. What i want is to
> securely manage my iptables remotely and need a tool for this (with a web
> interface, or a java interface cause clever customers also want to see them
> in an interface not with vi or not with ssh login and  a X-forwarding.) Im
> trying to decide whether i use Webmin iptables module or bifrost tool but
> hesitating about their security issues. wondering if there are any other
> netfilter users who manage their boxes remotely with an interface and want
> to hear their opions and security experiences. thanks in advance.
>
> Emre CELEBI


	Where I've used webmin in the past, I've changed the port that
	it listens on, and filtered access to that port to a specific list of ips.
	Given some configuration, it can be relatively secure.  
	Question -- you don't want to do X11 forwarded sessions because? .. 
	at a guess the users want to be able to see the rules from a winders 
	box downstream from the firewall?  -- at that point I can ses why ..
	webmin is a bit of overkill for this, but is granular enough that you
	can let your clients review the firewall rules and not allow them to 
	muck with them too much.
	
	There is a java project you might look at: http://sourceforge.net/projects/jwall
	but I've never used it -- I do know one person who has and finds it useful,
	how useful it would be for you I don't know.

	Alistair

