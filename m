From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: DNAT problem
Date: Sat, 29 May 2004 22:00:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c445e1$711ab3b0$0200000a@heretic>
References: <20040529172536.6df75cca.leslie.polzer@gmx.net><000701c44592$bb254460$0200000a@heretic> <20040529180330.6ec3d567.leslie.polzer@gmx.net>
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
To: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Cc: netfilter <netfilter@lists.netfilter.org>

to filter some ports is becoming a new "fashion" by the ISP.

The reason is "why he will serve a webserver if i can do this and charge some
fresh money for it"

just that


----- Original Message ----- 
From: "Patrick Leslie Polzer" <leslie.polzer@gmx.net>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, May 29, 2004 1:03 PM
Subject: Re: DNAT problem


> On Sat, 29 May 2004 12:36:37 -0300
> "Alexis" <alexis@tpys.com.ar> wrote:
>
> > i think it could be
> >
> > - that the isp (if you're connecting to one isp trough ppp0) has a filter
for
> > port 80 (it seems strange)
> Hm, possible. I just noticed 81 works, too! What crap is this?
>
> > are you mangling some packets? what is the output for iptables -t mangle -L?
> No rules at all, I generally try to stay away from mangling when testing:
>
>
> ### <snip> ###
>
> stronghold:~# iptables -t mangle -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
>
> ### </snip> ###
>
>
> So I guess all facts are pointing at my crappy ISP...
>
> Leslie
>
>


