From: Eric Leblond <eric@inl.fr>
Subject: Re: Dynamic change of iptables (building Wi-Fi hotspot)
Date: Sun, 04 Jul 2004 23:26:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088976350.3357.19.camel@coati>
References: <Pine.LNX.4.58.0407042011460.3513@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0407042011460.3513@localhost.localdomain>
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
To: Vladimir Mosgalin <mosgalin@VM10124.spb.edu>
Cc: netfilter@lists.netfilter.org

NuFW can be a solution to that problem (website : http://www.nufw.org).

NuFW is basically a authentication firewall suite : you can filter
access by user and not only by IP.
In your case you can use the following features of NuFW :
     1. NuFW users are stored in a ldap tree
     2. Users activities can stored in a SQL database (although the
        existing syslog can be enough)
     3. A mark corresponding to userid can be put on all packet coming
        from user.
With 1, you can create users and store all needed information, they can
only goes through your gateway (for selected flows or all flows) if
their account is available. 
With 2, you can determine when a user connects, so you're able to
determine their usage time.
With 3, you can account user traffic accuratly even if their IP change. 
Some constraints though :
- NuFW requires a software client on user computers. But it is light
ones. UDP traffic is not yet manage by existing nufw client, but it
could if there's a need ;-)
- persistent connections (with long duration) can not directly  be
stopped by nufw. Although it should be possible by using some tweaks
(send a paquet every N to nufw system for example).

BR,

> Hello everybody.
> 
> I want to build a Wi-Fi hotspot. The linux box with wireless AP
> connected to it which provides internet access to people with Wi-Fi
> cards.

> 2) All traffic is redirected to tun interface, and some C program
> analyzies each packed and decides whether to pass them or block them
...
> will have to pass through this program and it must be written really
> good if I don't want to have problems.

-- 
Eric Leblond <eric@inl.fr>
INL


