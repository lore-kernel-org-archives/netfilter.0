From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Thu, 27 Jun 2002 00:21:44 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627002144.B13910@spawar.navy.mil>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil> <20020623095351.M5183@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020623095351.M5183@oknodo.bof.de>; from bof@bof.de on Sun, Jun 23, 2002 at 09:53:51AM +0200
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
To: Patrick Schaaf <bof@bof.de>
Cc: netfilter@lists.samba.org

Patrick

Wow, were getting into the deep nitty gritty now!...


> 	   The "nat" table is NOT consulted for "second or more"
> 	   packet of an existing conntrack.

I needed to sit down and get a glass of water for this one.
This is one to lose sleep over....

I thought /ALL/ packets first went thru -t nat PREROUTING
and then -t filter and then -t nat POSTROUTING.

"of an existing conntrack" seems to be the same
as an ESTABLISHED packet....

*If I did not explicitly allow ESTABLISHED & RELATED
packets thru FORWARD chain then how can they pass?!?*

It almost seems like there is some hard coded ACCEPT
rules implied in iptables that you can't turn off!?!???

Is this correct to summarize?

0. conntrack = ESTABLISHED 

1. ESTABLISHED packets don't have to deal with -t nat table.

2. Somehow I don't have to ACCEPT these ESTABLISHED packets
   for them to go thru?!?!?

Chris


-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
53560 Hull Street
San Diego, CA 92152-5001
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-2836
Email: seberino@spawar.navy.mil
_______________________________________

