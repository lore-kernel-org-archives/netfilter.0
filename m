From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Sun, 23 Jun 2002 00:13:02 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020623001302.A949@spawar.navy.mil>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020622173842.AGM19225.mta07-svc.ntlworld.com@there>; from Antony@Soft-Solutions.co.uk on Sat, Jun 22, 2002 at 06:38:40PM +0100
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

Antony

Thanks again.

Here is my rule set... it is preceded by the usual stuff
like flushing chains, dropping certain classes of packets, etc.

These are the *only* rules with "-j ACCEPT" in my entire firewall script
and somehow DNS sneaks thru...


$PROTECTED_NETWORK = 192.168.0.0/29
$PROTECTED_NETWORK_SPACE = 192.168.0.0/16

...

# Allow all thru loopback.
$IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE -j ACCEPT
$IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

# Only SSH from Internet but anything *to* Internet.
$IPTABLES -t filter -A FORWARD     -i $INTERNET_INTERFACE             \
          -s ! $PROTECTED_NETWORK_SPACE -d   $PROTECTED_PC_IP_ADDRESS \
          -p tcp --dport $SSH_PORT                                    \
          -j ACCEPT
$IPTABLES -t filter -A FORWARD     -o $INTERNET_INTERFACE             \
          -s   $PROTECTED_NETWORK       -d ! $PROTECTED_NETWORK_SPACE \
          -j ACCEPT

# Allow all thru priviate LAN NIC.
$IPTABLES -t filter -A FORWARD     -i $PROTECTED_NETWORK_INTERFACE    \
          -s $PROTECTED_NETWORK         -d ! $PROTECTED_NETWORK_SPACE \
          -j ACCEPT
$IPTABLES -t filter -A FORWARD     -o $PROTECTED_NETWORK_INTERFACE    \
          -s ! $PROTECTED_NETWORK_SPACE -d   $PROTECTED_NETWORK       \
          -j ACCEPT

# The usual NAT stuff here.
$IPTABLES -t nat    -A PREROUTING  -i $INTERNET_INTERFACE             \
          -s ! $PROTECTED_NETWORK_SPACE -d   $INTERNET_IP_ADDRESS     \
          -p tcp --dport $SSH_PORT                                    \
          -j DNAT --to-destination $PROTECTED_PC_IP_ADDRESS
$IPTABLES -t nat    -A POSTROUTING -o $INTERNET_INTERFACE             \
          -s   $PROTECTED_NETWORK       -d ! $PROTECTED_NETWORK_SPACE \
          -j SNAT --to-source      $INTERNET_IP_ADDRESS


I don't have *anything* with ESTABLISHED or RELATED that would allow
DNS to sneak in...... *but it does*!?!?!?!?

Chris


On Sat, Jun 22, 2002 at 06:38:40PM +0100, Antony Stone wrote:
> On Saturday 22 June 2002 6:30 pm, Christian Seberino wrote:
> 
> > My firewall *only* forwards SSH stuff to private LAN.
> >
> > It forwards *everything* _from_ private LAN to Internet however.
> >
> > How can the private LAN use DNS which it does????
> >
> > How is DNS server returning the info thru firewall
> > if it *only* allows SSH??!?!?!?
> 
> Do you have a rule allowing reply packets from, say, a website back to your 
> internal clients ?
> 
> Maybe:
> 
> iptables -A FORWARD -i $EXTIF -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> Same rule will allow replies to DNS requests.
> 
> If you don't have anything like that, post your ruleset and we'll have a 
> think about it.
> 
>  
> 
> Antony.

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

