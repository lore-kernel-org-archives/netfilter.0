From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding (continued)
Date: Mon, 8 Jul 2002 16:28:00 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207081528.g68FS6807279@vulcan.rissington.net>
References: <004b01c2263b$9812cc90$1606d6d1@nebuchadnezza> <20020708075428.SHXU2755.mta05-svc.ntlworld.com@there> <000601c226ab$d5394ac0$8f01d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000601c226ab$d5394ac0$8f01d6d1@nebuchadnezza>
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
To: iptables-list <netfilter@lists.samba.org>

On Monday 08 July 2002 5:23 pm, Tim wrote:

> > I don't quite understand why you have the line
> > 172.16.0.0      *               255.255.255.0   eth1
> > in the table ?
>
>  I have no idea how this got here to begin with, I certainly did no
> such configuration. (??)

Ah.   In that case you can blame the entire failure of this firewall to do 
what it's supposed to on the dreaded Firewall Reconfiguration Fairy, who 
comes along when you're not looking and messes with your routing table :-)

> Here is what Im going to do, Im going to remove all routes (except local)
> and re-establish a table that makes  more sense.

Sounds good to me.

> > By the way, can you ping from the firewall to either/both of the
> > machines ?

> Only if I have INPUT and OUTPUT rules in place.

Sounds like that would be a good thing to do (temporarily) just to make sure 
that A can talk to B, and B can reply to A, that B can talk to C, and C can 
reply to B, before taking the daring step of seeing whether A can talk to C 
through B and getting the reply back again as well :-)

 

Antony.

