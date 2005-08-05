From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: SYN only packets
Date: Fri, 5 Aug 2005 10:26:10 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCA86@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Be careful rate-limiting SYNs too much as you can (ironically) degrade
performance quite a bit. I would set a high burst limit and a reasonable
average limit. I mention this because I did some SYN-limiting on a
firewall once and while it protected me from DDoS attacks it also slowed
down Apache somewhat.

You may be better served attempting to identify SYN floods from specific
hosts (-m recent?) and dropping those connections...

Derick Anderson

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Grant Taylor
Sent: Friday, August 05, 2005 1:51 AM
To: James Harrison
Cc: netfilter@lists.netfilter.org
Subject: Re: SYN only packets

Try taking a look at SYN-Cookies in the Linux kernel.  This code was
written explicitly for this type of situation.

You can not stop SYN packets as they are the very first packet in the
three way handshake to start a TCP connection.  About all you can do
(other than SYN-Cookies) is to rate limit the number of packets per
source IP.



Grant. . . .

James Harrison wrote:

> Hi,
>
> I've been trying to calm down some DDoS attacks on my server, but i've

> been stymied on how to block them- however, as APF's AntiDOS plugin=20
> captured and reported to root, the really vigorous ones (The ones it
> catches) have no ACK in their headers. SYN, but no ACK. I've read that

> this is a common technique used by DDoSers, but i'm unsure if anything

> else depends on it.
>
> The plan i'm looking at is possibly blocking all packets with SYN=20
> alone, no ACK.. would this be possible with iptables, and how would=20
> this affect other web services?
>
> Here's one of the captured packet messages (MAC/IPs are removed
> obviously)
>
> Aug  4 21:02:30 ukdsl21 kernel: ** IN_TCP DROP ** IN=3Deth0 OUT=3D =
MAC=3D**
> SRC=3D** DST=3D** LEN=3D48 TOS=3D0x04 PREC=3D0x00 TTL=3D116 ID=3D53191 =
DF PROTO=3DTCP
> SPT=3D4122 DPT=3D4899 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0 OPT=20
> (020405B401010402)
>
>
> Any ideas?
>
> Sorry if this sounds completely barmy- if it does, do tell :-)
>
> Thanks in advance,
> James Harrison
>



