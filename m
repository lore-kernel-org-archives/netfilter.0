From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Tue, 9 Jul 2002 12:08:52 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709120852.A24804@spawar.navy.mil>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil> <20020623095351.M5183@oknodo.bof.de> <20020627002144.B13910@spawar.navy.mil> <20020627093730.C1873@oknodo.bof.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020627093730.C1873@oknodo.bof.de>; from bof@bof.de on Thu, Jun 27, 2002 at 09:37:30AM +0200
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

> On the other hand, if there is not yet a conntrack record in existence
> for the packet, the nat PREROUTING table is consulted

Patrick

I appreciate all your help and after thinking about this on my vacation
last week I think I got it now thanks to your feedback!
Can I ask you few questions to verify I got what you said regarding
how a private LAN can use DNS, HTTP, SMTP, etc. thru an SSH-only firewall?...

My main confusion I believe was that packets associated with preexisting
conntracks are handled differently than packets *not* associated
with a previous conntrack.

Q1: The conntrack is the "memory" of netfilter that allows it to make
decisions based on "history" of PC traffic right?

Q2: Packets with a previous associated conntrack are handled *differently* than ones
without previous conntrack... and any attempt to try to understand
behavior of firewall *without* this concept is doomed
to confusion right?

Q3: Is conntrack a new "iptables only" feature? I imagine ancient ipchains/ipfwadmin
would have had same issues and therefore would need something like
"conntrack" to work correctly right?

Sincerely,

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

