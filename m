From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Fwd: set up my DMZ
Date: Sun, 19 Sep 2004 11:12:41 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a040919011254781075@mail.gmail.com>
References: <web-3246067@infinito.it>
	<1095356390.2489.70.camel@wolfpack.ljm.dom>
	<1403218a0409190112632977da@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a0409190112632977da@mail.gmail.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

---------- Forwarded message ----------
From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Date: Sun, 19 Sep 2004 11:12:13 +0300
Subject: Re: set up my DMZ
To: Jason Opperisano <opie@817west.com>

On Thu, 16 Sep 2004 13:39:51 -0400, Jason Opperisano <opie@817west.com> wrote:
> On Thu, 2004-09-16 at 10:44, hamals@infinito.it wrote:
> > I've a DMZ with two server, I would like to acces them
> > through my iptables firewall.
> >
> > IP_serve1_DMZ =192.168.2.2
> > IP_serve2_DMZ =192.168.2.3
> >
> > IP_server1_public = x.x.x.52
> > IP_server2_public = x.x.x.53   (x is for privacy..)
> >
> >
> > My firewall has
> >
> > eth1 internet interface = x.x.x.50
> > eth0 dmz interface = 192.168.2.1
> >
> > I need to have my server access with their pubbic IP, but
> > I've only eth1 as inteface to internet.
> >
> > I read that I can't use alias in iptables rules (like
> > eth1:1 etc) , then what kind of rules have I to write to
> > solve my problem?
>
>   ip address add x.x.x.52 dev eth1
>   ip address add x.x.x.53 dev eth1
>

He really needs to do this step ????
The firewall is his gateway !!




> --
> Jason Opperisano <opie@817west.com>
>
>


--
Mohamed Eldesoky
www.eldesoky.net
RHCE




-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

