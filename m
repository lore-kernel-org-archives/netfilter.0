From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Can anyone tell me how to do this?
Date: Wed, 22 Sep 2004 13:29:22 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409221329.22258.Alistair@nerdnet.ca>
References: <7C9884991ADAE0479C14F10C858BCDF591E375@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E375@alderaan.smgtec.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On September 22, 2004 12:59 pm, Daniel Chemko wrote:
> > learning more about iptables is a nice goal to have.  sometimes i wish
> > it was just as glamorous for people to want to learn more about
> > routing and the OSI model, before becoming super l33t firewall
> > gurus...but i digress...
>
> Problem is: Neither of these topics can easily be approached by network
> newbs without a lot of setup. There aren't many visiting this list with
> routing more complicated than ip route add x via y
>
> As for OSI, any casual admin wouldn't find much real world value in it.
> I'd say OSI influences programmers more than admins. Experienced admins
> do need to understand programming and OSI's a good practical example of
> basic layered approaches, etc.. Plus, since others use OSI as a mindset
> when developing, its good to know where they get their ideas from.

	Trust me -- when troubleshooting a distributed application you *really* need 
to know OSI.  I've found often that developers like to yell that the network 
is the problem.  Lots of developers have no idea about networking, and seem 
to believe that it can magically disappear, mangle, harrass, alter and chew 
up their data.  Now .. that might happen on some networks, but not on ours, 
or at least not without setting off a bunch of nasty alerts.... 


> Firewalls are an inevitability these days. You either: Don't use a
> firewall and get viruses, or you do use a firewall and you're forced to
> fiddle with it when one of your programs doesn't work. See, your forced
> to learn it if you like networking and administration or not.

	Using a firewall that blocks certain ports may prevent certain virii from 
being able to connect and spread, but it wont STOP virii, -- they seem to be 
getting multitalented these days.  Security as allways is very much like OSI.  
Layered, purpose driven components.  Each component must do its job, and 
scream blue bloody murder when it can't/doesn't or fails.

	Alistair.

