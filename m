From: Thorsten Scherf <tscherf@web.de>
Subject: Re: Multiple -d flags
Date: Sat, 11 Jan 2003 22:37:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301112237.10799.tscherf@web.de>
References: <3E20855F.9040006@mattiamartinello.com>
Reply-To: tscherf@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E20855F.9040006@mattiamartinello.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Mattia Martinello <mattia@mattiamartinello.com>, netfilter@lists.netfilter.org

> iptables -A FORWARD -s 0.0.0.0/0 -d 213.21.136.8/255.255.255.255 -dport
> 80 -j ACCEPT
> shows me the following error:
> iptables v1.2.5: multiple -d flags not allowed
> Try `iptables -h' or 'iptables --help' for more information.

You have to specify a protocol with the -p option, then you can use --dpo=
rt!
Try this one:

iptables -A FORWARD -s 0.0.0.0/0 -d 213.21.136.8/255.255.255.255 -p tcp=20
--dport 80 -j ACCPET



