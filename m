From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 16:41:38 -0500 (CDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.43.0206271638290.4084-100000@netmonster.pakint.net>
References: <Pine.LNX.4.21.0206272145310.15727-100000@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0206272145310.15727-100000@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, Patrick Schaaf <bof@bof.de>, Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

On Thu, 27 Jun 2002, Maciej Soltysiak wrote:

> > > How to TCP keepalive packets look like? Also, isn't it possible that the
> > > third packet already carries data, in the general (read TCP protocol as
> > > it is written) case? You probably won't get that with the normal socket
> > > interface from userlevel, but does TCP forbid it? I don't think so.
> >
> > Correct. And besides when you receive data and have nothing to send
> > you'll ack with a zero-length packet.
> I agree.
>
> But that reminds me something.
> I had a problem once (not solved) with a novell server that used to send
> TCP packets with 2 bytes of data, then 52, then 2, then 52.
> It never sent packets filled to the MSS size as negotiated at the
> beginning.

Ummm - was this a 3.x or 4.x server (reason I ask is that I had a 3.x
server do this and I had to force the LIP option ON as well as fix an
intermediate router)? In 4.x this is fixed with a combo of the LIP and
some of the WAN link options (I forget which - have to go look).

> That caused the pop3 traffic to go terribly slow, and finally the server
> decided to close the connection due to timeout of not sending a mail
> message in time.

Yep - in my case it was actually the FTP session that did this...

> I tcpdumped the session, and did not see any, in my opinion, valid cause,
> like advertising a smaller tcp window.
>
> Also some (but not all) modem connection to the server had full 576 byte
> packets
>
> Any ideas on the cause?
>
> Regards,
> Maciej Soltysiak
>
>
>

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 932-7250 x101
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------


