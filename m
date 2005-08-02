From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Blocking a range of source IPs to a specific port
Date: Tue, 02 Aug 2005 10:26:49 +0200
Message-ID: <42EF2E49.5030302@mnemon.de>
References: <42EE63E6.6070801@blackicehosting.com>	<Pine.LNX.4.60.0508011635250.3645@darkstar.sysinfo.com>	<42EE9539.4070800@gmx.co.uk>	<Pine.LNX.4.60.0508011801000.3645@darkstar.sysinfo.com>
	<42EE9CA0.5020805@blackicehosting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EE9CA0.5020805@blackicehosting.com>
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
To: netfilter@lists.netfilter.org

James Harrison schrieb:
> However i'm still completely confused on the whole 0/9 issue- what does
> this specify?

We're talking about the notation 172.128.0.0/9 or shorter 172.128/9 or
similar. The part after the slash is the subnetmask (netmask). It is the
number of binary 1s starting from the left. 9 means the same as
255.128.0.0. The first octett has all bits set to 1 => 255, the second
only the first bit => 128 and all others are 0 => 0 ;)

HTH,

Joerg


