From: Michael <mutk@ozemail.com.au>
Subject: Soliciting User's Experiences with NewNat patch...
Date: Tue, 09 Jul 2002 11:22:42 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D2A3AE2.6050203@ozemail.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: IPtables Users <netfilter@lists.samba.org>

Hi all,

I am asking for some personal experiences among users regarding 
the"NewNat" patch.

Particularly:

How stable is it?

Is it production ready, any crashes lately?

Any known security problems?

I seem to recall reading that the general feeling amongst developers of 
Netfilter is that H323 support should never have been done, and it's 
inclusion in the Netfilter release schedule is not definate (It may be 
dropped).

I need to consider (Yet again) using the patch, as our users are wanting 
to use Web cam and Netmeeting etc.. I have a system setup that uses 
iptables, and pam_iptables that add's and deletes iptables rules as 
users log in. The purpose is to share a single xADSL link to internet, 
NAT'ing etc. Actually in one server/gateway I have another Firewall that 
does support Netmeeting protocols, and I use my iptables firewall to 
just filter. I have used all statefull (state NEW for outgoing, state 
RELATED,ESTABLISHED for incomming etc) so Netmeeting breaks in this 
situation anyway.

I have considered using Open gatekeeper  but the way I see it, Open323 
is an abomination, and more dificult than NewNat patch to set up...And 
yet another daemon to keep running, support and keep up to date....

Any thoughts, suggestions as to the best way to go? My personal feeling 
is to to say no to H323 support , and weather the complaints for another 
year :| At until the future of NewNat is clear...


Cheers,
Michael


