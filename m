From: Jason Opperisano <opie@817west.com>
Subject: Re: Nat Rule ( Req help ASAP)
Date: Tue, 9 Nov 2004 12:21:21 -0500
Message-ID: <20041109172121.GA15503@bender.817west.com>
References: <20041109070456.3723.qmail@web50506.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041109070456.3723.qmail@web50506.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Nov 08, 2004 at 11:04:56PM -0800, Nilesh wrote:
> Hello All, 
> 
> I am using Squid proxy and IPtables Firewall 
> through squid I am able to block Messenger and other
> sites but If I put this in firewall I couldnt able to
> block messenger 
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
> $EXTIP 

that's a NAT rule that translates the source IP address of all your
outbound traffic leaving $EXTIF to $EXTIP.

> In connection settings If I choose no proxies the
> Yahoo messenger easily get connected.
> 
> also we use CISCO VPN client to connect Outside VPN
> server If I want to connect VPN I need to put that
> rules otherwise I wont connect.
> 
> Could any one please tell How to solve my problem
> I want to block messengers also want to connect VPN
> server though client 

i'm going to assume that your FORWARD policy must be set to ACCEPT
(note:  i wouldn't have to assume if you had included your rules via:
 iptables -t mangle -vnxL; iptables -t nat -vnxL; iptables -vnxL).

if your FORWARD policy is set to ACCEPT, you can explicitly drop the
ports used by yahoo messenger:

  # yahoo messenger
  iptables -A FORWARD -p tcp --dport 5050 -j DROP
  # yahoo messenger voice chat
  iptables -A FORWARD -p tcp --dport 5000:5001 -j DROP
  iptables -A FORWARD -p udp --dport 5000:5010 -j DROP
  # yahoo messenger web cam
  iptables -A FORWARD -p tcp --dport 5100 -j DROP

if your FORWARD policy is set to DROP, and need to allow the VPN client,
you should be able to allow it with:

  # IKE
  iptables -A FORWARD -i $INT_IF -p udp --dport 500 -j ACCEPT
  # IPSec
  iptables -A FORWARD -i $INT_IF -p 50 -j ACCEPT
  # UDP Encapsulation
  iptables -A FORWARD -i $INT_IF -p udp --dport 4500 -j ACCEPT

the specific encapsulation ports/protocols may vary depending on your
client settings.

-j

--
"I saw weird stuff in that place last night. Weird, strange, sick,
 twisted, eerie, godless, evil stuff. And I want in."
        --The Simpsons

