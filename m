From: "Winanjaya - PBXSoftwares" <winanjaya@pbxsoftwares.com>
Subject: Re: IP and MAC Address check
Date: Wed, 5 Oct 2005 12:31:59 +0700
Message-ID: <007a01c5c96e$1b8406b0$580110ac@HO.lippogeneral.com>
Reply-To: Winanjaya - PBXSoftwares <winanjaya@pbxsoftwares.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Ruben Cardenal <ruben@ruben.cn>, netfilter@lists.netfilter.org

Ok .. thanks, is it also impossible to read a textfile thru iptables?
..please confirm

TIA
Winanjaya




----- Original Message -----
From: "Ruben Cardenal" <ruben@ruben.cn>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, October 05, 2005 12:23 PM
Subject: RE: IP and MAC Address check


> Hi,
>
> > what I need is to configure iptables to read maclist file when there is
> > incoming trafic from the IP address 172.16.2.241 to 172.16.2.250 ..if
the
> > MAC Address listed then the traffic will allowed otherwise the traffic
> > will
> > be dropped or rejected..
>
>   That's were you were showed to implement.
>
> > > while read mac; do
> > >   iptables -A INPUT -m mac --mac-source $mac -m iprange --src-range \
> > >    172.16.2.241-172.16.2.250 -j ACCEPT
> > > done < /path/to/maclist
> > > iptables -A INPUT -m iprange --src-range 172.16.2.241-172.16.2.250 -j
> > DROP
>
>   You can't create "condicional" rules with iptables, you only create the
> rules you need, and if such condition ever exists, the rule will be
applied.
> If it never does, the rule will never be applied.
>
> -Ruben
>
>
>
>


