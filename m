From: "Kashyap Ashwin" <Ashwin.Kashyap@thomson.net>
Subject: RE: [OT] Was: ESP does not hit the nat table
Date: Thu, 5 Aug 2004 10:26:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8FC831532CEE564AB88AC1D999C29DEBD06F6B@prinsmail01.am.thmulti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Ming-Ching Tiew <mingching.tiew@redtone.com>, netfilter@lists.netfilter.org

I am sorry, this was my mistake, man page:

nat    This table is consulted when a packet that creates a new connec-
       tion is encountered.  It consists of three built-ins: PREROUTING
       (for  altering  packets  as  soon  as they come in), OUTPUT (for
       altering  locally-generated   packets   before   routing),   and
       POSTROUTING  (for altering packets as they are about to go out).


This is what happened:
	1. I put a ACCEPT rule in PREROUTING for ESP traffic when client
connects. There is also MASQUERADE rule in the POSTROUTING chain.
	2. The client can now do ipsec vpn
	3. The client logs out and I remove the ACCEPT rule. There is
catch-all DROP rule in the PREROUTING chain. I was expecting the ESP
"connection" to be terminated.
	4. Since the ESP "connection" is already in established state,
later packets never hit the catch-all DROP rule in the PREROUTING chain.

	5. The client is happy, since he gets free access:)

I just put some rules in the filter table, FORWARD chain (each and every
packet hits this). Things seem to work OK.

Thanks for all the replies!
Ashwin


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ming-Ching
Tiew
Sent: Thursday, August 05, 2004 12:36 AM
To: netfilter@lists.netfilter.org
Subject: Re: [OT] Was: ESP does not hit the nat table


Did you patch the kernel using NAT-T patch ? And=20
did you turn on the nat_traversal ?

It happens to my system too where I have
nat-t patch, but nat_traversal is disabled (default) in=20
freeswan configuration, then I put in a rule like this :-

     iptables -t nat -I PREROUTING -p esp

When I list the rule, I can't see any packet going thru' it.

Regards.








