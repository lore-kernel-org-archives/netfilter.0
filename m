From: "eNet" <nt@enet.org.al>
Subject: Re: rules for ssh
Date: Sun, 20 Jul 2003 21:09:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c34ef2$7baa0ce0$8101a8c0@tani>
References: <007001c34e9e$8ecd14b0$0401000a@sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org


----- Original Message -----
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, July 20, 2003 11:09 AM
Subject: RE: rules for ssh


> > Is there any other rule to allow ssh from an internal network
> > to the server.
> >
> > till now i have used a rule like this:
> >
> > $iptables -A tcp-packets -p TCP -s xxx.xxx.xxx.xxx -allowed
>
> I guess this rule is not working, worse : it should generate an error as
> I don't think "-allowed" will be recognized.
> And if it would work then it would open all tcp services, not just ssh.

There is my typing mistake here,but on my server it is written correctly :
'-j allowed' . And I tried this way, just to be sure that all services are
allowed in that privat IP.

It is solved now, I was so tired that day and I forgot that this privat IP I
mentioned was behind another real yyy.yyy.yyy.yyy IP that was not allowed to
use ssh port. So I couldn't enter to my destination zzz.zzz.zzz.zzz IP.

> Let's say your internal network is 192.168.1.0/24. Try this :
> (You can subtitute INPUT for tcp-packets if you like.)
> $iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 22 -j ACCEPT

Yeah. This is careful rule for one service. It's time to see more on
security now.

>
> Gr,
> Rob

Thanks for your help
Tani


