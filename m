From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Is ip_conntrack_ftp needed for 1:1 nat?
Date: Wed, 07 Jun 2006 17:16:39 +0200
Message-ID: <4486EDD7.2040002@plouf.fr.eu.org>
References: <A78C6C481BFAE949BC5990E1EEB2FE1257BF@q.LeBlancNet.us>	<4486CCFF.2070903@plouf.fr.eu.org>
	<02BB8A4AC86C564C89C7F14CF98CE0C4012795@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C4012795@knowledge.wizdom.nu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Sietse van Zanen wrote :
> BZZZZZZZZT

Huh ?

> You have just missed the 1.000.000 dollar question. The short answer is indeed: NO.
>  
> When you do pure 1:1 NAT and don't filter any traffic, you do not need
> to track connections, as any packet will just get NATted between the two
> addresses.

Packets will. But addresses in PORT commands or PASV replies won't. So 
when the sender of this information is masqueraded, the other side will 
try (and mostly fail) to connect to the given private address or simply 
refuse to connect because it does not match the apparent address 
(protection against abuse).

Possible workaround in passive mode : use the command EPSV instead of 
PASV, because unlike the PASV reply, the EPSV reply does not contain the 
(useless because already known) server address.
Limit : it works only for a masqueraded server, but the use of EPSV is 
up to the client, and not all FTP clients support it.

I repeat, FTP will work without tracking control connections nor special 
setup on the NATed host only in the following conditions :

- active mode with a non NATed client, so PORT commands contain the 
expected address (the server may be NATed) ;
- passive mode with a non NATed server, so PASV replies contain the 
expected address (the client may be NATed) ;
- passive mode with a NATed server when the client uses EPSV (client may 
also be NATed) ;

