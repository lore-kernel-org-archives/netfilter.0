From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Grammar in a bash script
Date: Tue, 18 Aug 2020 12:11:25 +0200
Message-ID: <20200818101125.GA10691@salvia>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
 <20200817085658.GA3677@salvia>
 <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mario V Guenzi <jclark@tiscali.it>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Tue, Aug 18, 2020 at 07:12:38AM +0200, Mario V Guenzi wrote:
> Il 17/08/20 10:56, Pablo Neira Ayuso ha scritto:
> > Hi,
> 
> > You can set default policy to drop wehn defining the chain (in the
> > same go), no need to call it twice, my suggestion for your ruleset is
> > to place this in ruleset.nft:
> > 
> > add table inet firewall
> > add table inet nat
> > add table netdev noddos
> > 
> > add chain inet firewall INPUT { type filter hook input priority 0; policy drop; }
> > add chain inet firewall OUTPUT { type filter hook output priority 0; policy drop; }
> > add chain inet firewall FORWARD { type filter hook forward priority 0; policy drop; }
> > ...
> > 
> > my rules
> > my rules
> > my rules
> > 
> 
> At first many thanks.
> another question given your kindness,
> I can use bash only to define my variables eg
> EXTIF = "eth0"
> LAN = "192.168.2.0/24"
> etc
> use the variables defined in writing the rules.nft file as per your
> example and then write
> nft -f /path/rules.nft in my bash script?

You can define variables in nftables, e.g.

  define EXTIF = "eth0"

  add rule inet firewall INPUT iifname $EXTIF accept
