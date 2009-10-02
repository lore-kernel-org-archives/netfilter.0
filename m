From: John Little <jlittle_97@yahoo.com>
Subject: Re: Using iptables with high volume mail
Date: Fri, 2 Oct 2009 12:04:52 -0700 (PDT)
Message-ID: <316073.66697.qm@web53106.mail.re2.yahoo.com>
References: <594040.85734.qm@web53111.mail.re2.yahoo.com>  <1254412984.11386.63.camel@enterprise.ims-firmen.de>  <4AC4DB93.6060707@freemail.hu>  <900981.20015.qm@web53108.mail.re2.yahoo.com> <1254486676.19832.20.camel@enterprise.ims-firmen.de> <150303.95092.qm@web53112.mail.re2.yahoo.com> <4AC6175D.4020600@unipex.it>
Reply-To: John Little <jlittle_97@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254510293; bh=FiLmueeK3CeFpXrgZvScSGVcXfXXz/CEimXMzo/gvSk=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=qgHq1hKAzy0E5xV0nH0t6/CPtY2aiU9aGAeTmJooNTCYSMFzWm0IH3YelpOsKjz5d3OEkvMNFUidJW51L3AES3kb5nKxTAgWInRGcMAh1WmWRAEhouUC900cZhyWLouKYFDncMH+L+4CnPfm9eb/pfy5JA6VFrKk8cz3gNYbAgg=
In-Reply-To: <4AC6175D.4020600@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: Thomas Jacob <jacob@internet24.de>, =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter@vger.kernel.org



----- Original Message ----
> From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
> To: John Little <jlittle_97@yahoo.com>
> Cc: Thomas Jacob <jacob@internet24.de>; G=E1sp=E1r Lajos <swifty@free=
mail.hu>; netfilter@vger.kernel.org
> Sent: Friday, October 2, 2009 11:08:13 AM
> Subject: Re: Using iptables with high volume mail
>=20
> John Little wrote:
> >> What matters most is what happens in each time slice, not so much
> >> how many connections you have in the connection hash table (you ca=
n
> >> tune that table with with
> >> /proc/sys/net/ipv4/netfilter/ip_conntrack_max and
> >> /sys/module/ip_conntrack/parameters/hashsize).
> >>=20
>=20
> Except that if the table fill up you'll see some "table full" kernel
> messages and the connections will be refused!
>=20
> >> However, emails per time should be pretty much the same as
> >> connections per time, unless you open several tcp connections over
> >> the nat box for each email, and I see no reason why you would need
> >> to do that ;)
> >=20
> > We have some stats now:
> > Packets per second:  avg 6221 max 41,810
> > Connections peak: avg 7263  max 22,981
> >=20
> > New connections per second: avg 102 max 1029
>=20
> > If I allocate 500 bytes per connection at the max
> > connections I would need ~87Mb + machine overhead.  That's not much
> > in today's world of servers.
>=20
>=20
> Only for add some real numbers that hope pacify your heart, with the
> lnstat tool (lnstat -f ip_conntrack) I have here:
>=20
> 100k entries into ip_conntrack, about 700 new conn/sec, 8k iptables
> rules, 0.5/0.8 cpu load, with a xeon 4 cores and 2 gb ram and e1000e
> card and no problems at all.
> The unique think that I can say you to do with this cards it's to
> _update_ the drivers with the last one found on the site because that=
 on
> the kernel vanilla aren't so stable and can (who say for sure?) *oops=
*
> your server.
>=20
> > Thanks, John
> >=20
>=20
> Michele
Thomas, Michele and Gaspar,
That is some good information.  From what I can see what you guys are d=
oing is in the realm of where we are with our connections per second, m=
achine sizes/resources etc.  Thank you all for your responses.  We are =
going to compile the information that we have learned with your help an=
d present it to management.  It certainly looks like the way we want to=
 go.

Thank you very much for your help!
John


     =20
