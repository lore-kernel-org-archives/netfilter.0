From: "Ulrich Walcher" <uw@walcher.co.at>
Subject: AW: Masquerading on 2 ppp's
Date: Tue, 21 May 2002 11:40:12 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <GPEAINGJFHKOHJPGOJLJEEODCLAA.uw@walcher.co.at>
References: <0d2301c20019$e8d1ef50$6801a8c0@dirkgently>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0d2301c20019$e8d1ef50$6801a8c0@dirkgently>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Adam Mitz <ahm1@express.cec.wustl.edu>, netfilter@lists.samba.org

Although I didn't take a closer look at it, I guess that

http://www.samag.com/documents/s=3D1824/sam0201h/0201h.htm

(posted on the list a few days ago) is interesting for you...

Cheers, Uli

-----Urspr=FCngliche Nachricht-----
Von: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]Im Auftrag von Adam Mitz
Gesendet: Montag, 20. Mai 2002 18:18
An: netfilter@lists.samba.org
Betreff: Masquerading on 2 ppp's


I haven't seen this addressed in any FAQ or HOWTO on netfilter.samba.org so
I hope this is an appropriate place.
I'd like to do Masquerading on to 2 different ppp interfaces.  So when a
packet reaches the gateway from the internal LAN (the first packet of its
connection) the gateway should choose the least-used ppp (or pick one at
random, whatever) and do NAT masquerading for the duration of that
connection, sending all packets to the same ppp with the same source ip/port
modification.  Think of it as running 2 standard masquerading set-ups in
parallel, transparent to the client LAN.  The 2 ppp connections are standard
ISP dialups, dynamically assigned IPs.  Has anyone done this?  Is it
possible?  Stupid?

Thanks,
    Adam


