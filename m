From: Art Reisman <astormchaser2002@yahoo.com>
Subject: Re: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 17:43:18 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604004318.60104.qmail@web10403.mail.yahoo.com>
References: <20020603231340.R27307@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020603231340.R27307@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org


--- Nick Drage <nickd@funkyjesus.org> wrote:
> On Mon, Jun 03, 2002 at 06:36:12AM -0700, Art
> Reisman wrote:
> 
> > Yes I know this is not quite on topic , but I'm
> geting there, before I can
> > use iptables the way I wanted , this was sort of
> background work.
> 
> Fair enough :)
> 
> > Here is my topology
> > 
> > 
 T1----->Gateway---->Hub-------Wireless----->PC1
                      |                     
                      |------>eth0---->PC2--->TCPDUMP
> >                                      (SUSE Linux)
> > 
> > 
> > The hub is stupid, not switched.
> 
> Are "Hub" and "Wireless" the same device?  If so I'm
> wondering if it's not
> quite as stupid as you think.

They are totally seperate sorry , but good question.
> 
> > I see ARP packets, but nothing specific for host
> PC1 in the tcpdump on
> > PC2.
> > 
> > PC1 and PC2 have static IP addresses.
> 
> Like you say, maddening :)
> 
> -- 
> FunkyJesus System Administration Team
> 
> 

__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

