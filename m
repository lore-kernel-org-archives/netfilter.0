From: Willem Oldeman <willem@king-pin.nl>
Subject: Re: How to stop SPAM from Internal users
Date: Mon, 24 Feb 2003 21:57:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302242157.00312.willem@king-pin.nl>
References: <033201c2dbbf$92ef54b0$0b00000a@nocpc3> <07c601c2dbd4$5ab5aa80$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <07c601c2dbd4$5ab5aa80$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>, netfilter@lists.samba.org

On Monday 24 February 2003 08:14, hare ram wrote:
> Hi all
>
> I have One Public IP assigned to eth0
> i have Private network 192.168.1.0/24 connected to eth1
>
> how can stop, some one spamming from internal IP
> i get from lot queries from other host saying that
> my Public IP is spamming .....
>
> 1 ) how do i stop them spaming or relaying mails from internal PC
> 2) how to stop scanning from internal ip to any external IP
> 3) how do i kick the user who is infected with the virus and block them=
 and
> notify to admin
>
> thanks
> hare

You can start out logging forwarding port 25, the host that connects to m=
any=20
different mailhosts is the one causing the spam.
(BTW, don't you have a mailserver running yourself? If so, check it's log=
s.)

When you find the offending host, you should cut it off from your network=
 (by=20
blocking it's MAC address). No warnings, no excuses.
Spamming is IMO one of the worst breaches of the nettiquette.

HTH,
Willem


