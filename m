From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Strange MAC address
Date: Tue, 20 May 2003 11:34:57 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0305201132580.17800@dns.toxicfilms.tv>
References: <Pine.OSF.3.91.1030518215213.1714B-100000@delta.ntu.ac.sg> 
 <Pine.LNX.4.51.0305192026090.897@dns.toxicfilms.tv>
 <1053411035.2024.14.camel@kermit.spenneberg.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053411035.2024.14.camel@kermit.spenneberg.de>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

> > > MAC=00:a0:cc:28:56:c4:00:09:b6:13:9a:7c:08:00
> > There are 12 octets here, so it is:
> > Source MAC: 00:a0:cc:28:56:c4:00
> > Dest   MAC: 09:b6:13:9a:7c:08:00
> Unfortunately this is not fully correct. The first 12 octetts are the
> MAC addresses. The last two specify the protocol. All in all it is the
> *whole* ethernet header:
> Source MAC 00:a0:cc:28:56:c4
> Dest MAC   00:09:b6:13:9a:7c
> Protocol   08:00  (see RFC894)
Thanks, i knew there was something wrong about these MACs.

Regards,
Maciej


