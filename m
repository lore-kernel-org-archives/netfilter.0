From: cldavis@speakeasy.net
Subject: Re: Final IPTables script (hopefully)
Date: Wed, 29 Dec 2004 02:20:03 +0000
Message-ID: <W856975398238081104286803@webmail1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Jason Williams <jwilliams@courtesymortgage.com>, netfilter@lists.netfilter.org


> -----Original Message-----
> From: Jason Williams [mailto:jwilliams@courtesymortgage.com]
> Sent: Tuesday, December 28, 2004 11:48 PM
> To: netfilter@lists.netfilter.org
> Subject: Final IPTables script (hopefully)
> 
> Hello everyone.
> 
> Back from a much needed vacation today and started back at IPTables. Af=
ter 
> reading up on a lot of documentation and taking some very good advice f=
rom 
> this list, here is what i have come up with, in hopes of getting it rig=
ht, 
> to act as a personal firewall for my home network.
> 
[...]
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
[...]
> $IPTABLES -A OUTPUT -j ACCEPT
> 
[...]
Looks pretty good...except you have the policy for OUTPUT set to DROP, bu=
t you are allowing all unmatched traffic on OUTPUT to pass through.  If y=
ou want to allow all traffic outbound you may want to eliminate the line:=
 $IPTABLES -A OUTPUT -j ACCEPT and change your OUTPUT policy to ACCEPT.

If you want to really tighten the belt so to speak and leave the policy f=
or OUTPUT to drop, you might want to consider using nmap, strace, and log=
 all dropped packets for a while and set rules specifically for outbound =
traffic.

I say looks good otherwise...if you plan on admining the box via remote i=
nterfaces make sure to leave yourself a way in :)

~Regards,
Chris



