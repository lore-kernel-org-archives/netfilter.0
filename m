From: "info@beeplove.com" <info@beeplove.com>
Subject: Re: SSH Brute force attacks
Date: Thu, 19 May 2005 10:48:22 -0400
Message-ID: <36660-220055419144822808@M2W057.mail2web.com>
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

How about this:

1=2E You will keep one random high port to accept new connection, say 3245=
6=2E
You box wont listen on that port though=2E
2=2E If there have a request on that port, using recent match, you will
accpet new connection in different high port for 1 mintute=2E say port is
34521
3=2E You will send new connection request on 34521, again using recent mat=
ch
you will open port 22 to accept new connection for 1-3 minutes=2E
4=2E You will log into your box !!

Mohammmad




Original Message:
-----------------
From: Taylor, Grant gtaylor@riverviewtech=2Enet
Date: Thu, 19 May 2005 09:39:25 -0500
To: netfilter@lists=2Enetfilter=2Eorg
Subject: Re: SSH Brute force attacks


> I understand what you are saying, but what was hoping for=2E Was a=20
> solution whereby the src ip is not part of my whitelist=2E
>=20
> For example, I have a dialup account (dynamic ip) at home=2E If I need t=
o=20
> SSH into my linux box from home=2E I cant because the ip I have been=20
> allocted will not be in the whitelist=2E

Can I ask why you would not be able to get in from your dynamic IP at home=
?
The rule set will allow (how ever many NEW attempts you designate) to
connect for a specified number of times in a specified amount of time=2E  =
You
don't have to have your dynamic IP in the list as any IP will still be abl=
e
to initiate NEW connections a few times before the rule starts TARPITing /=

DROPing the connection=2E  There is also the fact that you could configure=

your SSH server to listen on a (2nd) port at a higher port number that you=

would know about that most people would not=2E  This port would not be
processed by this script and thus you would be able to connect from
anywhere=2E



Grant=2E =2E =2E =2E


--------------------------------------------------------------------
mail2web - Check your email from the web at
http://mail2web=2Ecom/ =2E



