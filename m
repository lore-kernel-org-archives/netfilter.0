From: "olivier" <netfilter.org@olivier.us>
Subject: Re: How to run iptables insert command  on linux  box as non root user?
Date: Fri, 30 May 2003 15:13:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019901c326f8$b9c646f0$16199340@xpc>
References: <20030530213702.19708.93703.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

How about using "sudo", and specifying your apache user into the
/etc/sudoers ?

> From: "Israel Zavalza Bahena" <izavalza@hotmail.com>
> To: netfilter@lists.netfilter.org
> Subject: How to run iptables insert command  on linux  box as non root
user?
> Date: Fri, 30 May 2003 16:18:59 -0500
>
>
>
> Hello
>
>
> I need to run IPTABLES on a linux box from a CGI on apache web server, but
i
> need to run as apache user, not as root user, to avoid a secure
> vulnerability over the apache web server.
>
> Do i need to recompile iptables or the kernel ?
>
> Someone has done it before ?
>
> Thanks for your comments.
>
>
> Ing. Israel Zavalza Bahena
> Technology Strategic Manager of
> INTERTIENDAS Network Center



