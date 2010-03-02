From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Packets ending up in wrong chain after DNAT
Date: Tue, 2 Mar 2010 10:12:44 +0000
Message-ID: <56378e321003020212t17cdec48m6e414d89da208af2@mail.gmail.com>
References: <4B8C69FF.7050400@concero.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0IsngFKyTJD4iLqqE4tZsshjxwReavFd9Pa7WWiJlhc=;
        b=MHpysqa1Lxtx5zAD1t2Nm7Kb/ZW9W5pQaKiluaVhDl5bllZo0lefJKvSZnFRfF7yu7
         Ps9tnC8SfXzPWv43aNFg6kHkyPg6ZJGKkMCPpde+2NHnOfhQUlFku8M6EpyIPHoyyIrq
         0iMunzyfp7EyXeXOYg5FJ0Ys0ZMXbUCChY9BI=
In-Reply-To: <4B8C69FF.7050400@concero.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dion Kant <msn@concero.nl>
Cc: netfilter@vger.kernel.org

On 2 March 2010 01:29, Dion Kant <msn@concero.nl> wrote:

> Mar =A02 02:03:55 erouter kernel: [527925.765439] LOG 25 Wrong =A0IN=3D=
eth2
> OUT=3D MAC=3D00:16:3e:78:4a:72:00:1d:45:8a:1b:2e:08:00 SRC=3D1.1.1.1
> DST=3D2.2.2.2 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D49 ID=3D0 DF PROT=
O=3DTCP SPT=3D53803
> DPT=3D25 WINDOW=3D0 RES=3D0x00 RST URGP=3D0

As I understand what you are trying to do is allow access to port 25
on your internal network from an external machine right?

If so that log looks odd - the originator of the connection is sending
a RESET flag. The Reset flag is sent by the destination (atleast from
my knowledge they are).

In which case that line is going to be classed as invalid state and so
won't work with conntrack as Matt points out.



=46rom RFC793 (TCP):-
If the connection does not exist (CLOSED) then a reset is sent in
response to any incoming segment except another reset. In particular,
SYNs addressed to a non-existent connection are rejected by this
means.

If the connection is in any non-synchronized state (LISTEN, SYN-SENT,
SYN-RECEIVED), and the incoming segment acknowledges something not yet
sent (the segment carries an unacceptable ACK), or if an incoming
segment has a security level or compartment which does not exactly
match the level and compartment requested for the connection, a reset
is sent.

If the connection is in a synchronized state (ESTABLISHED, FIN-WAIT-1,
=46IN-WAIT-2, CLOSE-WAIT, CLOSING, LAST-ACK, TIME-WAIT), any
unacceptable segment (out of window sequence number or unacceptible
acknowledgment number) must elicit only an empty acknowledgment
segment containing the current send-sequence number and an
acknowledgment indicating the next sequence number expected to be
received, and the connection remains in the same state.



--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
