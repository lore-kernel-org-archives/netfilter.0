From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Netfilter and SCTP
Date: Wed, 30 Apr 2003 17:12:02 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304301709270.18203@dns.toxicfilms.tv>
References: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com>
 <1051711484.1690.121.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051711484.1690.121.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi,

> Isn't SCTP just a sub-protocol of TCP/IP?
Well, i do not know about SCTP, but if the SCTP protocol stores
IP/port information inside the packet (like eg. FTP PORT), then
this information has to be rewritten by a clever conntrack module.

I have to read on SCTP, i do not even know what is it for :-D

Regards,
Maciej Soltysiak


