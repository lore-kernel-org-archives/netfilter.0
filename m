From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Sat, 22 Jun 2002 18:38:40 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020622173842.AGM19225.mta07-svc.ntlworld.com@there>
References: <20020622103055.B32585@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020622103055.B32585@spawar.navy.mil>
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
To: netfilter@lists.samba.org

On Saturday 22 June 2002 6:30 pm, Christian Seberino wrote:

> My firewall *only* forwards SSH stuff to private LAN.
>
> It forwards *everything* _from_ private LAN to Internet however.
>
> How can the private LAN use DNS which it does????
>
> How is DNS server returning the info thru firewall
> if it *only* allows SSH??!?!?!?

Do you have a rule allowing reply packets from, say, a website back to your 
internal clients ?

Maybe:

iptables -A FORWARD -i $EXTIF -m state --state RELATED,ESTABLISHED -j ACCEPT

Same rule will allow replies to DNS requests.

If you don't have anything like that, post your ruleset and we'll have a 
think about it.

 

Antony.

