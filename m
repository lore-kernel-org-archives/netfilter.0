From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: pop3 and dns
Date: Thu, 13 May 2004 16:49:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405132349.i4DNntou022561@server5.bandwidthco.com>
References: <W123333069650381084412429@webmail2>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <W123333069650381084412429@webmail2>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: cldavis@speakeasy.net, netfilter@lists.netfilter.org

=20

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
cldavis@speakeasy.net
Sent: Wednesday, May 12, 2004 6:40 PM
To: netfilter@lists.netfilter.org
Subject: Re: pop3 and dns


> -----Original Message-----
> From: Dick St.Peters [mailto:stpeters@NetHeaven.com]
> Sent: Wednesday, May 12, 2004 09:21 PM
> To: 'Cedric Blancher'
> Cc: 'Netfilter Mailing List'
> Subject: Re: pop3 and dns
>=20
> Cedric Blancher writes:
> > Le mer 12/05/2004 =E0 21:14, Dana Bourgeois a =E9crit :
> > > >>tcp for zone transfers
> > > > and large answers ...
> > > ...where a 'large answer' is usually taken to be a UDP packet of=20
> > > more than 512 bytes.
> >=20
> > I don't quite understand the meaning of this answer... So, I =
clarify.
> >=20
> > When a DNS server has to reply on UDP with more than 512 bytes of=20
> > data, it sends back an answer with TC bit (truncated) set to let=20
> > client know answer is not complete and have him send it again using =
TCP.
>=20
> To add my own bit of clarification, it's not large answers that need=20
> TCP open, it's requests that have large answers.  If the client gets a =

> UDP answer with the TC bit set, it should send the query again using a =

> TCP connection ... and the server must listen for such connections ... =

> and its firewall must let them through.
<snip>

In following this post...

I currently only allow port 53/udp through my wall for dns. I haven't
noticed many=20

In the even that someone is able to comprimise a dns server, what would =
be
the best way to restrict tcp zone transfers at the firewall? Rate =
limiting
comes to my mind, any suggestions on the actual limits?

Other suggestions?

Thanks!
Christopher Davis

Christopher - You should never rely on your firewall to restrict zone
transfers. You should create an ACL in your named.conf file for hosts
permitted to request zone transfers, and then apply this against the
allow-transfers parameter.  Example below:

# Allow zone transfers from these name servers
acl "xfers" {
	192.168.1.1;
	192.168.2.1;
	localhost;
};

##########################
# ZONE TRANSFER
##########################
# Only allow hosts in the "xfers" acl do zone transfers
allow-transfer { xfers; };



