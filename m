From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Kazaa Ports
Date: Mon, 8 Sep 2003 10:01:51 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030908170151.21523.qmail@web40205.mail.yahoo.com>
References: <3F5CA520.6060102@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5CA520.6060102@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, netfilter@lists.netfilter.org


--- Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
> Hi All,
> 
> I am trying to provide a modest amount of security for a home LAN using 
> NAT and filtering. My family insists on using Kazaa Lite on their 
> Windows boxes (aaahhh!!).
> 
> My (other) problem is that Kazaa insists on using sequential source 
> ports and seemingly random destination ports to make connections. I 
> already have a rule to allow ESTABLISHED,RELATED through, but these 
> packets must be new connections (connecting to supernodes maybe?). No 
> matter how many ports I open I can't seem to open enough ports to make 
> it run.
> 
> I'm rapidly becoming unpopular in my house. Any ideas how I can make 
> Kazaa Lite work and still maintain some security? Are these mutually 
> exclusive goals?
> 
> Jeff
> 
> 

Are you using NAT? This is probably your best soloution.

SBlaze

=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

