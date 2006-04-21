From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: packets loging
Date: Fri, 21 Apr 2006 09:22:15 +0200 (CEST)
Message-ID: <60102.193.173.147.3.1145604135.squirrel@webmail.sterenborg.info>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin>
	<4447F34C.6030500@yahoo.com.mx>
	<000d01c6650d$99afe6e0$0e01050a@CyberAdmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000d01c6650d$99afe6e0$0e01050a@CyberAdmin>
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

On Fri, April 21, 2006 08:34, robee wrote:

> my rules looks like this:
>     iptables -I FORWARD -p tcp -i ! eth0 --dport 80 -m state --state NE=
W -j
> LOG --log-prefix HTTP_ --log-level info
>
> and i get something like this in /var/log/kernel
>     Apr 21 04:09:20 master kernel: HTTP_IN=3Deth2 OUT=3Deth0 SRC=3D10.1=
1.9.2
> DST=3D213.54.82.29 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D57962=
 DF PROTO=3DTCP
> SPT=3D3636 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
>
> but i want only this:
>     Apr 21 04:09:20 master kernel: HTTP_IN=3Deth2 OUT=3Deth0 SRC=3D10.1=
1.9.2
> DST=3D213.54.82.29
>
>
> any sugestion?

AFAIK that isn't possible.
Why would you want to anyway ?


Gr,
Rob



