From: "Alex" <alex@hackgod.org>
Subject: Re: Forking inside netfilter queue
Date: Thu, 3 May 2007 18:48:20 +0100 (BST)
Message-ID: <13098.213.106.233.77.1178214500.squirrel@xeentech.com>
References: <4635EC8E.4090905@saudi.net.sa>
	<002901c78d97$4f60f1c0$0a00080a@rhea> <463A3617.7050702@saudi.net.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <463A3617.7050702@saudi.net.sa>
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
To: Rayed Alrashed <rayed@saudi.net.sa>
Cc: netfilter@lists.netfilter.org

If you were to do this with the queue lib, then you'd ataualy have to
either let the client establish the connection OR fake that the connectio=
n
was established, before you get the HTTP request is sent to rule on.

Also keep in mind that the servers/client might want to do a Keep-alive o=
r
long lived HTTP session, with multiple HTTP requests. Keeping track of
that, from an NFNetlink/Queue based interface would be hecktic.
>
>> Unless there are a real lot of these addresses that are permitted, and
>> they change rapidly, then I'd expect it would be a better design to
>> get all the valid URIs from the MySQL query on init and store them in
>> a linked list.
> I am afraid this not an option, because my final goal is to integrate m=
y
> application with external vendor database using the vendor own API.
>
>
>> Also, people already do this type of thing with an HTTP proxy like
>> squid before the HTTPd.
>
> I've tested HTTP proxy before, but the overhead is very big, and I
> couldn't get the proxy to handle high loads.
>
> Another problem with proxy servers is using the proxy own IP for
> outgoing request, unfortunately using the same IP for many requests
> trigger many IDSes to block the proxy IP.
>
> What I am trying to do is a light weight HTTP filter, by searching for
> HTTP requests in packet traveling on the wire, with minimal TCP
> reassembly to find HTTP requests spanning more than one packet.
>


