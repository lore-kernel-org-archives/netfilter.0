From: "Scorched" <scorched1@btinternet.com>
Subject: Re: Multiple Port Forwarding
Date: Fri, 20 Aug 2004 08:03:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002e01c48683$c16a6670$0400a8c0@icbmwxph>
References: <7C9884991ADAE0479C14F10C858BCDF591E35A@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Umm. Damn.
Linux only... I don't think my router is linux, I don't think it has any
standard OS, just firmware. It is a Netgear DG824M router :/ Usually only
way to set it up is through the web-based interface accessable through
192.168.0.1 for computers connected to the network, but I was wondering if
there was any way to get past that.

I just looked at netfilter.org and well... I see I may have the wrong
newsgroup :s But you all seem pretty knowledgeable about the subject so
maybe you can help me still, I'm not sure.

Here's a screenshot to give you an idea..

www.berzerker.net/blizzard/port_foward.gif

I hope anyone is able to help :/ maybe there's some way to get around it..


----- Original Message ----- 
From: "Daniel Chemko" <dchemko@smgtec.com>
To: "Scorched" <scorched1@btinternet.com>; <netfilter@lists.netfilter.org>
Sent: Friday, August 20, 2004 1:23 AM
Subject: RE: Multiple Port Forwarding


Scorched wrote:
> I found this group on google looking for how to do multiple port
> forwarding (I'm trying to setup so me and a friend can play Starcraft
> together on the same connection [with different CD keys though, got
> two copies of the game.. is all legit])
>
> I have exactly the same problem as this guy, so here's a copy of the
> thread I found, that no one ever replied to to help with (I checked)
> :/

The following article described a way to accomplish it. I'm not sure if
its fresh:
http://www.mplug.org/phpwiki/index.php/NetfilterStarcraft


Me ---------|
            |--- Firewall -- battle.net / Server
My Friend --|

Each user wants to send their source port as 6112, but since only one
guy can have that port, we have to change our source port. Ex.

Outgoing:
ip-me:port-5112 -> dest:5112 >> FW >> ip-fw:port-5112 -> dest:5112
ip-friend:port-5112 -> dest:5112 >> FW >> ip-friend:port-5113 ->
dest:5112

Return:
dest:5112 -> ip-fw:port-5112 >> FW >> dest:5112 -> ip-me:5112
dest:5112 -> ip-fw:port-5113 >> FW >> dest:5112 -> ip-friend:5112

I can't see what's wrong with this picture unless Starcraft uses other
messed up port assignments. If you really want to help us diagnose this,
please run the game and list the ports that the program is using with
the following details:

protocol src_ip src_port dst_ip dst_port

Please do this on the inside interface of the firewall, not the outside.


