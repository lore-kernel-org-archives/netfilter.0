From: "info@beeplove.com" <info@beeplove.com>
Subject: Re: SSH Brute force attacks
Date: Thu, 19 May 2005 11:31:08 -0400
Message-ID: <203610-22005541915318418@M2W027.mail2web.com>
Reply-To: info@beeplove.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I don't agree with you=2E
See this:
http://portknocking=2Eorg/view/details


Port knocking can be made even more secure by using 'recent' match and
TARPIT target=2E

If you send any packet to a port of my server that is not listening to
(other than secret port), you will have to stay quite for 5 minutes to sen=
d
another try=2E
Now, if there have 3 sequential port to get in my server using port
knocking technique, how easy it will be if you fail to provide the sequenc=
e
correctly=2E
You will have just one chace to provide the sequence in every five minutes=
=2E
This can be make even harder by having 5 or more sequence of port or by
using TARPIT target=2E
At the end, if you really can get 22 port open, I will suggest you to spen=
t
one night in Las Vegas and share the winning money at morning with us! :p

Mohammad



Original Message:
-----------------
From: Andrew Schulman andrex@alumni=2Eutexas=2Enet
Date: Thu, 19 May 2005 11:01:24 -0400
To: netfilter@lists=2Enetfilter=2Eorg
Subject: Re: SSH Brute force attacks



> How about this:
>=20
> 1=2E You will keep one random high port to accept new connection, say 32=
456=2E
> You box wont listen on that port though=2E
> 2=2E If there have a request on that port, using recent match, you will
> accpet new connection in different high port for 1 mintute=2E say port i=
s
> 34521
> 3=2E You will send new connection request on 34521, again using recent m=
atch
> you will open port 22 to accept new connection for 1-3 minutes=2E
> 4=2E You will log into your box !!

Port knocking is the same as a plaintext password=2E
http://software=2Enewsforge=2Ecom/software/04/08/02/1954253=2Eshtml



--------------------------------------------------------------------
mail2web - Check your email from the web at
http://mail2web=2Ecom/ =2E



