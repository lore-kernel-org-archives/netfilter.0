From: "Garcia Ruiz" <gar_ruiz@teleline.es>
Subject: Re: load balancing?
Date: Tue, 17 Jun 2003 21:00:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c33502$c3672770$05001aac@breton1>
References: <1055479908.30352.7.camel@little.lethalwp>
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
To: Jean-Yves Simon <lethalwp@tiscali.be>, netfilter@lists.netfilter.org

Hello,

When nating a dest port to a server, if you tell iptables that there are two
dest servers instead of one, it sends requests to them in a round-robin
fashion (it sends one request -one TCP/IP connection- to the first server,
another to the second, etc. -you can even tell iptables that there are 3, 4
or even more servers).

The problem is that you don't have failure support, so I suggest you to look
for other products if you have time (in any case it is true that with
iptables you only need to set up one rule -easy- and there is no third party
software so problems and performance OK). Be careful also if session track
needed because the next connection that the external browser stablishes with
the http server may be done to the other server.

Regards.

JBGR



----- Original Message ----- 
From: "Jean-Yves Simon" <lethalwp@tiscali.be>
To: <netfilter@lists.netfilter.org>
Sent: Friday, June 13, 2003 6:51 AM
Subject: load balancing?


> Hello,
>
> I'm curious if load balancing can be done with iptables, like for
> example forwarding incoming web requests to one of the multiple web
> servers behind the firewall.
>
> Or is a third party software needed?
>
>
> Maybe it is this planned for the future (pkttables or don't know what
> name it will have)?
>
>
>
>
> PS: can you please crosscopy to my email address, since i'm not a member
> of this mailing list.
>
>
>
> -- 
> Jean-Yves Simon <lethalwp@tiscali.be>
>
>
>



