From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ULOG: invalid argument
Date: Fri, 5 Mar 2004 11:01:18 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0403051059070.6328-100000@blackhole.kfki.hu>
References: <BAY15-F22EuZFkTEPcO000027e1@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F22EuZFkTEPcO000027e1@hotmail.com>
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
To: "T. Take" <t_takejp@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 5 Mar 2004, T. Take wrote:

> Thank you for replying to me, and I'm sorry that I'm late fo answer to you.
>
> As you explained to me, I have made the version of ulogd up to 1.02.
> # apt-get build-dep ulogd
> # .....
> # apt-get -b source ulogd
>
> But, I cannot use target "ULOG".
> # iptables: Invalid argment (the same error)

Please make sure there is no iptables binary from your distribution which
precedes in PATH the iptables binary installed from source.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


