From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Thu, 27 Jun 2002 00:14:18 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627001418.A13910@spawar.navy.mil>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil> <20020623080704.YEZE2755.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020623080704.YEZE2755.mta05-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sun, Jun 23, 2002 at 09:07:02AM +0100
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

> Reverse nat for replying packets is automatic, therefore replies get 
> destination natted when they come back in.


This scares me.  So you are saying that there are "implicit" NAT
rules for "replying packets" that are immune to iptables DROP rules?!

If a packet is part of an ESTABLISHED tcp connection then it
can by pass an "SSH only" firewall?!??

I *didn't* allow /any/ ESTABLISHED connections on FORWARD
chain?!?!? How is iptables
behaving as though I did!?!?!?  This is default hardcoded
behavior for iptables?!?!? 

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

