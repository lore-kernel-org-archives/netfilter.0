From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: RST instead of FIN?
Date: Mon, 12 Apr 2004 12:33:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081798416.6513.169.camel@ranjeet-pc2.zultys.com>
References: <05c301c41f2a$4a6ef650$9701a8c0@office>
	 <1081677639.2013.11.camel@grendel>  <06fa01c41fee$fe77d440$9701a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <06fa01c41fee$fe77d440$9701a8c0@office>
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
To: Jay Levitt <lists-netfilter@shopwatch.org>
Cc: netfilter@lists.netfilter.org


Jay,

you can use tethereal instead of ethereal and then its very easy to cut
and paste the textual output.

Ranjeet.

On Sun, 2004-04-11 at 11:01, Jay Levitt wrote:
> Chris Brenton wrote:
> 
> > On Sat, 2004-04-10 at 14:33, Jay Levitt wrote:
> > >
> > > sourceforge: [SYN]
> > > me: [SYN, ACK]
> > > sourceforge: [ACK]
> > > [SMTP conversation ensues, switches to TLS, sends me an e-mail.  at
> > > the end..]
> > > me: [RST]
> >
> > Weird. Are you sure this is not a RST/ACK?
> Yep.  It's an RST only.
> 
> >
> > > sourceforge: [FIN, ACK]
> >
> > Looks like the RST was ignored (although hard to say since you did not
> > include time stamps). Does the source MAC on the RST match your system?
> 
> Sorry about that - I can't figure out how to get an abbreviated output from
> Ethereal so I just retyped it.  I've included the full output of the last
> few packets below, although I see now that timestamps are still missing!...
> The RST was sent within microseconds of the last packet received.  The
> source MAC is my own....
> 
> OOH!  Looks like I read this wrong the first time.  The first RST is me, for
> reasons unknown, and the second two are sourceforge.  That's even weirder.
> With timestamps:
> 
> #753 17:20:34.230099 sourceforge: last data packet of message body
> #754 17:20:34.230181 me: RST
> #755 17:20:34.230538 sourceforge: FIN, ACK
> #756 17:20:34.318588 sourceforge: RST
> #757 17:20:34.319745 sourceforge: RST
> 
> > When I've seen this in the past its been an IDS or IPS attempting to
> > reset the session due to a suspicious payload, but they get the sequence
> > numbers wrong. Thus the RST/ACK gets ignored and the session continues.
> 
> Interesting.  I'm not running an IDS/IPS.  Perhaps sourceforge is, but that
> doesn't explain my sending the RST...
> 
> > > me: [RST]
> > > me: [RST]
> >
> > If this is an RST rather than a RST/ACK, it could be your system is
> > losing session info and handling the ACKs like they are new packets
> > (maybe some kind of broken IP wrapper application?).
> 
> No wrappers installed here.. just iptables.
> 
> > The second RST is
> > *really* odd as its an error packet without any stimulus. That's not
> > suppose to happen.
> 
> Agreed..
> 
> > I'm guessing this is not the kernel or Sendmail, but I'm honestly not
> > sure what it is.
> 
> Any ideas where I might seek out other experts?
> 
> Thanks for the help...
> 
> Jay
> 
> -------------------------
> 
> Frame 753 (95 bytes on wire, 95 bytes captured)
> Ethernet II, Src: 00:20:78:d0:44:8f, Dst: 00:50:2c:01:62:8e
> Internet Protocol, Src Addr: 66.35.250.206 (66.35.250.206), Dst Addr:
> 192.168.1.150 (192.168.1.150)
> Transmission Control Protocol, Src Port: 42185 (42185), Dst Port: smtp (25),
> Seq: 2495007464, Ack: 3573134794, Len: 29
>     Source port: 42185 (42185)
>     Destination port: smtp (25)
>     Sequence number: 2495007464
>     Next sequence number: 2495007493
>     Acknowledgement number: 3573134794
>     Header length: 32 bytes
>     Flags: 0x0018 (PSH, ACK)
>     Window size: 14480
>     Checksum: 0x4684 (correct)
>     Options: (12 bytes)
> Simple Mail Transfer Protocol
> 
> Frame 754 (54 bytes on wire, 54 bytes captured)
> Ethernet II, Src: 00:50:2c:01:62:8e, Dst: 00:20:78:d0:44:8f
> Internet Protocol, Src Addr: 192.168.1.150 (192.168.1.150), Dst Addr:
> 66.35.250.206 (66.35.250.206)
> Transmission Control Protocol, Src Port: smtp (25), Dst Port: 42185 (42185),
> Seq: 3573134794, Ack: 0, Len: 0
>     Source port: smtp (25)
>     Destination port: 42185 (42185)
>     Sequence number: 3573134794
>     Header length: 20 bytes
>     Flags: 0x0004 (RST)
>     Window size: 0
>     Checksum: 0x8109 (correct)
> 
> Frame 755 (66 bytes on wire, 66 bytes captured)
> Ethernet II, Src: 00:20:78:d0:44:8f, Dst: 00:50:2c:01:62:8e
> Internet Protocol, Src Addr: 66.35.250.206 (66.35.250.206), Dst Addr:
> 192.168.1.150 (192.168.1.150)
> Transmission Control Protocol, Src Port: 42185 (42185), Dst Port: smtp (25),
> Seq: 2495007493, Ack: 3573134794, Len: 0
>     Source port: 42185 (42185)
>     Destination port: smtp (25)
>     Sequence number: 2495007493
>     Acknowledgement number: 3573134794
>     Header length: 32 bytes
>     Flags: 0x0011 (FIN, ACK)
>     Window size: 14480
>     Checksum: 0x877f (correct)
>     Options: (12 bytes)
> 
> Frame 756 (60 bytes on wire, 60 bytes captured)
> Ethernet II, Src: 00:20:78:d0:44:8f, Dst: 00:50:2c:01:62:8e
> Internet Protocol, Src Addr: 66.35.250.206 (66.35.250.206), Dst Addr:
> 192.168.1.150 (192.168.1.150)
> Transmission Control Protocol, Src Port: 42185 (42185), Dst Port: smtp (25),
> Seq: 2495007464, Ack: 0, Len: 0
>     Source port: 42185 (42185)
>     Destination port: smtp (25)
>     Sequence number: 2495007464
>     Header length: 20 bytes
>     Flags: 0x0004 (RST)
>     Window size: 0
>     Checksum: 0xac2e (correct)
> 
> Frame 757 (60 bytes on wire, 60 bytes captured)
> Ethernet II, Src: 00:20:78:d0:44:8f, Dst: 00:50:2c:01:62:8e
> Internet Protocol, Src Addr: 66.35.250.206 (66.35.250.206), Dst Addr:
> 192.168.1.150 (192.168.1.150)
> Transmission Control Protocol, Src Port: 42185 (42185), Dst Port: smtp (25),
> Seq: 2495007464, Ack: 0, Len: 0
>     Source port: 42185 (42185)
>     Destination port: smtp (25)
>     Sequence number: 2495007464
>     Header length: 20 bytes
>     Flags: 0x0004 (RST)
>     Window size: 0
>     Checksum: 0xac2e (correct)
-- 

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely
those of the author. The message contents have not been reviewed or
approved by Zultys.



