From: Michael <mutk@iprimus.com.au>
Subject: Re: Nobody can help me ???   :(
Date: Mon, 30 Sep 2002 19:54:00 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D981F38.9080709@iprimus.com.au>
References: <20020930082725.79600.qmail@web40007.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hanz F. wrote:

>HI
>I've posted an email asking for help, but got no
>answer !! Isn't this mailing list usefull for new
>members or what ??
>All I need is to run all kind of softwares (IRC, ICQ,
>yahoo messenger ,.....) through Netfilter , isn't that
>possible ???
>Thanks to whom will answer me.
>
Possible modules to load : 


modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe ip_nat_ftp
modprobe ip_nat_irc

I suggest you go look for IPtables Howtoo as this stuff is covered there 
somewhere. A good book might help too.

Some applications may not work without effort, and some may never 
work...Some applications need setting up from client end to work through 
firewall.

In all cases, since you are in control, you need to investigate what is 
needed (Ports, protocols supported by applications etc).

Another way to do it is to search for some firewalls already setup 
(sourceforge has some projects..) and use that. But always test the 
firewalls first...

Cheers,
Michael






