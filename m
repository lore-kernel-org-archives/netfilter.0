From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: ssh
Date: Mon, 24 Jun 2002 15:47:49 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0206241544220.11832-100000@dns.toxicfilms.tv>
References: <200206241331.OAA15709@slate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206241331.OAA15709@slate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

> 1. You can't.   Netfilter / IPtables works by port number, not by content, so 
> you can only filter by port number.
Hmm, maybe you could...
Look:
1. look for a openingpacket with ssh connection characteristics, say a
   version string and mark packets, use recent module, put them to a
   seperate chain. something like that.
2. filter by port number.

What do you think?

Maciej


