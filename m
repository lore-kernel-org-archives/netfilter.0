From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: Packet Inspecting Filter with IPTables
Date: 26 Aug 2004 21:54:00 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093536477.1053.19.camel@nostromo.bgsecm.com>
References: <200408260450.i7Q4ooX5078698@jkcpub.iserver.net>
	<005101c48b5d$7b612540$0200a8c0@floydian>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005101c48b5d$7b612540$0200a8c0@floydian>
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

El jue, 26 de 08 de 2004 a las 13:11, Deepak Seshadri escribió:
> Hi Jeremy,
> You can either use Snort or there is a patch available to do layer7 filtering. The link is
> http://l7-filter.sourceforge.net/
> 
> After patching your kernel & iptables you will be able to create your own script to catch the packets and take action on them. It is a very good tool. I have been using this a lot to track p2p traffic, messenger traffic that disguise themselves and run on port 80.
> 
> I hope this helps.
> Good luck,
> Deepak
>   ----- Original Message ----- 
>   From: Jeremy Andrew 
>   To: netfilter@lists.netfilter.org 
>   Sent: Thursday, August 26, 2004 1:50 AM
>   Subject: Packet Inspecting Filter with IPTables 
> 
> 
>   I wish to implement a feature on a linux box which I explained with detail
>   in the following text;
> 
>   I have read about many different articles on how to take actions based on
>   the contains of a packet. I think netfilter/iptables has support of what I
>   wish to deploy on a Linux machine (kernel 2.4.20) acting as a gateway
>   network node. I have not found enough information about the exact steps to
>   be taken in order to;
> 
>   - Inspect each and every incoming packet for a specific port (ftp as an
>   example), and then if the data packet contains a specific set of bits (ascii
>   characters "GLOB" e.g), take actions based on a predefined rule (send a
>   message to syslog) and then "drop" this packet.
> 
>   Should I install a newer version than I currently have (iptables  v1.2.6a)
>   or does this version contain the feature I require? Indeed, I do not wish to
>   make an upgrade to iptables since this is a "production" environment, but I
>   can add another box only for this purpose, so even alpha / beta versions are
>   accepted. 
> 
>   I would be glad if I see exact steps to take since I really do not have much
>   time to make a research on the matter right away. 
> 
>   Regards...

I think what you are looking for it's snort-inline using the QUEUE
target with iptables-Netfilter.


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


