From: xchris <lyra@fastwebnet.it>
Subject: Re: SNAT FTP - HELP ME
Date: Wed, 9 Apr 2003 16:18:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091618.56344.lyra@fastwebnet.it>
References: <006801c2fe9c$ee27bc50$1c01010a@PERUCCHI>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006801c2fe9c$ee27bc50$1c01010a@PERUCCHI>
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
To: Breno Cardoso Perucchi <brenol@omegatec.net>, netfilter@lists.netfilter.org

On Wednesday 09 April 2003 03:35 pm, Breno Cardoso Perucchi wrote:
> Hello,
>
> This is my first mail to the list.
> I've been trying to transport tcp 20:21 to out of my network with SNAT
> iptables -t nat -A POSTROUTING -p tcp --dst 200.200.200.201 --dport 20:=
21
> -j SNAT --to-source 192.168.2.1

you cannot use DNAT with ftp protocol due to the multi connection protoco=
l.
If you redirect port 21 you redirect only the control connection and not =
the=20
data connection.

Consider using sftp.
bye

xchris

