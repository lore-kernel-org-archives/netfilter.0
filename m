From: Axel Heinrici <axel.foley-beverly-hills@gmx.de>
Subject: Re: migration to iptables
Date: Thu, 13 Jun 2002 14:38:15 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131238.OAA02077@axpmgr.physik.rwth-aachen.de>
References: <200206101942.43007@.> <200206101431.g5AEVpU08614@vulcan.rissington.net> <200206110754.14398@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206110754.14398@.>
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

Hi

On Tuesday 11 June 2002 04:26, Payal wrote:
> Hi,
> Thanks for the mails.
>
> iptables -A POSTROUTING -o $EXT_IF -j MASQUERADE
> Warning: wierd character in interface `-j' (No aliases, :, ! or

Is it possible that EXT_IF is not set? This really looks like 
EXT_IF="". Try expicitly iptables -A POSTROUTING -o ppp0 -j 
MASQUERADE (or eth1 or whatever).
But I think it should be iptables -t nat -A POSTROUTING -o ..... -j 
MASQUERADE.

From info iptables:
  MASQUERADE
       This  target  is  only  valid  in  the  nat  table, in the
       POSTROUTING chain.


> *). Bad argument `MASQUERADE'
> Try `iptables -h' or 'iptables --help' for more information.

Same problem. May you should have a look at man iptables.

> and this gave,
> iptables -A forward -j MASQUERADE
> iptables: No chain/target/match by that name

Correct. MASQUERADE is not valid there.

> My aim is very simple, I just wanted the equivalent command for
> ipchains -A forward -j MASQ
> in iptables.
> Thanks a lot in advance and eagerly waiting for the help.
> -Payal


greetings 
	Axel

