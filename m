From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Wed, 10 Jul 2002 09:34:18 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710093418.A27977@spawar.navy.mil>
References: <20020709144309.A25835@spawar.navy.mil> <Pine.LNX.4.33.0207101903030.1723-100000@dodobirdy.nestac.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0207101903030.1723-100000@dodobirdy.nestac.com>; from kluivert@tm.net.my on Wed, Jul 10, 2002 at 07:03:55PM +0800
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
To: Julian Gomez <kluivert@tm.net.my>
Cc: netfilter@lists.samba.org

> ipchains is a simple packet filter. it looks at per packet header
> information and passes that through the ruleset for analysis and whether
> it gets forwarded or not.
> 
> there is no 'keeping of header info' unlike iptables which is stateful.

Thanks for the help.  I think this must be right.  However, can you
explain the mechanism that allows a PC on the private LAN to
do DNS, HTTP, etc. thru an SSH-only ipchains firewall???

The *must* be *some* mechanism to allow return packets of an 
existing TCP connection to bypass firewall!

CS

