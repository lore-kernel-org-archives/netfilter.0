From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: OT: Pings phenomen :)
Date: 29 Aug 2004 18:58:33 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093798236.23474.34.camel@nostromo.bgsecm.com>
References: <213736141.20040828221628@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <213736141.20040828221628@op.pl>
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

El sáb, 28 de 08 de 2004 a las 22:16, Marcin Sura escribió:
> Hi
> 
>   I have 512/128 adsl. I wonder why, when I download files at full
>   speed, pings to site X are about 2000ms. But when I upload files at
>   full speed, pings to X are about 3000 to 5000ms. Can someone explain
>   this to me from tcp/ip point of view? ;)

I think it's just a matter of how many occasions the ICMP packets have
of going out or into your system. All the packets are put in a queue
and if the queue it's more full then the packets have to wait more to
have your ICMP packet sent or received. You are talking about uploading
files, so your ICMP packets have to wait in the queue to be sent, and
the time you get it's the time from when you sent the packet to when the
packet it's received, as you have 512 of download and 128 of upload it's
normal the queue when you are uploading it's more full and the packets
have to wait more.

It's just my guess. I'm not an expert in this kind of things and I could
be wrong.

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


