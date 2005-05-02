From: "Deepak Seshadri" <d_s123@hotmail.com>
Subject: Re: rules for skype
Date: Mon, 2 May 2005 13:01:41 -0400
Message-ID: <BAY107-DAV7808D3CABD608123BCF2CB7270@phx.gbl>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com><42764919.60507@lopsch.com>
	<42764E36.7080300@riverviewtech.net>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="response"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>, netfilter@lists.netfilter.org

Hi Grant,

My company requires me to block Skype too. There are 3 ways I have found=20
after a lot of research:

- Block the authentication servers' IPs. The last I knew there were only 2 =

servers for authentication. Their IPs are given in that pdf document. I am =

not aware if they have added new servers now.
- Use Layer-7 pattern. Again, the layer-7 pattern has worked for some and=20
not worked for many. It has worked for me.
My network scenario: The network I manage has private addresses throughout.=
=20
I think it has something to do with NAT and private addressing because in m=
y=20
case when the client tries to authenticate with the server the hex-pattern =

of those UDP packets stays the same throughout every session. This has not =

been true in every case. You can give it a shot.
- Use *tc* to choke the skype traffic. I have a list of apps to allow=20
through the network. The rest go into a default pipe of 2 Kbps. This=20
deteriorates the performance of the application. I think text chatting will=
=20
still go through but voice chatting, file sharing and all gets choked.
NOTE: I have had better success not blocking its default ports. That way I =

can keep it away from the standard Internet ports and thus easily classify =

it into the default pipe.

Now given the nature of this application, some things might work for you an=
d=20
some might not. I thought I would share my knowledge on this ....

Good luck,
Deepak


----- Original Message -----=20
From: "Taylor, Grant" <gtaylor@riverviewtech.net>
To: <netfilter@lists.netfilter.org>
Sent: Monday, May 02, 2005 11:58 AM
Subject: Re: rules for skype


> I can also block https by blocking port 443 that=B4s not the point. The=20
> point is to block "bad" 443 port traffic and let "good" traffic pass.

One thing that might be able to be done is to limit on the amount of traffi=
c=20
that can pass through any given HTTPS (443) connection.  Namely if an HTTPS=
=20
connection is on going and has carried a meg of data or more (any thing tha=
t=20
would be more than any legitimate HTTPS web submit would be) you could=20
probably know that the traffic was not standard HTTPS traffic and thus safe=
=20
to shut down.  This might trap some STunnel (?) (SSL tunneling) but then yo=
u=20
would know the IP of the other end and you could explicitly allow ongoing=20
HTTPS connections to that IP.  This amount of data match could possibly be =

matched via the "connbyes" match extension from Patch - O - Matic Extra=20
Repository.



Grant. . . .




