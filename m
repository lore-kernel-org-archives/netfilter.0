From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: Default routing setup
Date: 04 Sep 2004 00:13:26 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094249597.20893.8.camel@nostromo.bgsecm.com>
References: <200409032138.i83Lc6cn011411@melmac.stargate.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409032138.i83Lc6cn011411@melmac.stargate.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 03 de 09 de 2004 a las 23:38, Sunny Shum escribió:
> Hi all,
>  
> I am a newbie into the Linux world, and I recently built a firewall box (2
> NICs, internal network as 192.168.1.xxx) with RedHat 9.  Everything works
> fine, except the routing table.  Every time when the system has reboot, I
> have to do the following command:
>  
> prompt>route del default
>  
> prompt>route add default gateway xxx.xxx.xxx.xxx [external gateway IP]
>  
> Because I don't do that, and if I just type "route" at the prompt, the
> default is point back to the internal NIC.  Is there a way to make this
> permanent?  I tried to edit the file /etc/sysconfig/network by adding the
> line "GATEWAY=xxx.xxx.xxx.xxx" but it doesn't work.
>  
> Thanks!
>  
> Sunny Shum
>  

Maybe you should edit /etc/sysconfig/static-routes, I have there two
default routes for two networks with their gateways.

-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


