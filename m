From: "Matthieu Turpault" <mt.netfilter@comelis.fr>
Subject: RE: ip_conntrack module, advanced routing and multiple ISP
Date: Wed, 17 Sep 2003 11:13:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MGEFIJGLOCLFFKBKAFEPEEEJEHAA.mt.netfilter@comelis.fr>
References: <1063714990.887.101.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063714990.887.101.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

OK, thanks for all these answers.

I am sorry if my previous mail is too agressive: my english is not
sufficiently rich to transmit exactly what I feel. I have spent a lot of
time to this "FTP problem" and still have no answer. Grrr.... ;)

It *is* a routing problem. I think that the CONNMARK module could resolve it
but I had to patch my kernel to test it. When I will have time, I try to do
that.

Best regards

Matthieu Turpault

> -----Message d'origine-----
> De : Cedric Blancher [mailto:blancher@cartel-securite.fr]
> Envoy=E9 : mardi 16 septembre 2003 14:23
> =C0 : Matthieu Turpault
> Cc : netfilter@lists.netfilter.org
> Objet : Re: ip_conntrack module, advanced routing and multiple ISP
>
>
> I do not have much time, but I'll give you my first thought about your
> problem.
>
> Le lun 15/09/2003 =E0 12:28, Matthieu Turpault a =E9crit :
> > 	The problem is that I can't connect from the internal network to
> > 	 a ftp server of the net. In fact, I can connect to a ftp server
> > 	 of the net but the "ls" command failed the most of the time (1/3).
> > 	 I use passive mode.
>
> I think command connection and data connection are not routed through
> the same ISP and thus are received by FTP server from 2 different IPs,
> which means data connection SYN is droped.
>
> This suppose you are load balancing using some round robbin like stuff,
> such as nth match (I really do not have time to examine your script
> now), and that 1/3 times data connection is set up with correct IP as
> source.
>
> >      If I add the route by the command
> > 	  ip route add <@ftpServer> via <@GATEWAY_ISP2>
> > 	  it is OK
>
> This tends to confirm the above. You should investigate this routing
> stuff.
>
>
> Btw, you should use CONNMARK target instead of MARK target to have your
> packets marked.
>
> cbr@elendil:~$ iptables -j CONNMARK --help
> iptables v1.2.8
> [...]
> CONNMARK target v1.2.8 options:
>   --set-mark value              Set conntrack mark value
>   --save-mark                   Save the packet nfmark on the connection
>   --restore-mark                Restore saved nfmark value
>
> The connmark is a mark you set for the whole connection. This means that
> once you've set a mark on a packet, every following packet identified by
> conntrack engine as belonging to the same connection (ESTABLISHED or
> RELATED) is marked with the same value. You also have corresponding
> match, connmark. With -save-mark and --restore-mark  you can switch
> between nfmark (MARK/mark target and match) and connmark. See :
>
> http://www.netfilter.org/documentation/pomlist/pom-extra.html#CONNMARK
>
> This mean you're sure that data connection is marked the same way as
> corresponding command connection, and thus is routed the same way.
>
> --
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>


