From: cldavis@speakeasy.net
Subject: Re:  pop3 and dns
Date: Thu, 13 May 2004 01:40:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <W123333069650381084412429@webmail2>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: Dick St.Peters [mailto:stpeters@NetHeaven.com]
> Sent: Wednesday, May 12, 2004 09:21 PM
> To: 'Cedric Blancher'
> Cc: 'Netfilter Mailing List'
> Subject: Re: pop3 and dns
> 
> Cedric Blancher writes:
> > Le mer 12/05/2004 =E0 21:14, Dana Bourgeois a =E9crit :
> > > >>tcp for zone transfers
> > > > and large answers ...
> > > ...where a 'large answer' is usually taken to be a UDP packet of mo=
re 
> > > than 512 bytes.
> > 
> > I don't quite understand the meaning of this answer... So, I clarify.=

> > 
> > When a DNS server has to reply on UDP with more than 512 bytes of dat=
a,
> > it sends back an answer with TC bit (truncated) set to let client kno=
w
> > answer is not complete and have him send it again using TCP.
> 
> To add my own bit of clarification, it's not large answers that need
> TCP open, it's requests that have large answers.  If the client gets a
> UDP answer with the TC bit set, it should send the query again using a
> TCP connection ... and the server must listen for such connections
> ... and its firewall must let them through.
<snip>

In following this post...

I currently only allow port 53/udp through my wall for dns. I haven't not=
iced many 

In the even that someone is able to comprimise a dns server, what would b=
e the best way to restrict tcp zone transfers at the firewall? Rate limit=
ing comes to my mind, any suggestions on the actual limits?

Other suggestions?

Thanks!
Christopher Davis




