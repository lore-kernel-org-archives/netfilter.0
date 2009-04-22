From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Re: still can't route using fwmark
Date: Wed, 22 Apr 2009 11:53:54 +0200
Message-ID: <145d4e1a0904220253w73af0297w15c21af27c9fc407@mail.gmail.com>
References: <op.uslkl80px1lyi3@localhost> <op.uslqwresx1lyi3@localhost>
	 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
	 <145d4e1a0904200148p23d66274h8c0eb0a28ccf568b@mail.gmail.com>
	 <1240227862.27336.43.camel@enterprise.ims-firmen.de>
	 <145d4e1a0904200608i45d9cf09sce1c38ab42cd316@mail.gmail.com>
	 <1240234658.27336.66.camel@enterprise.ims-firmen.de>
	 <145d4e1a0904200815q3176c9e2m2dfef314b205f348@mail.gmail.com>
	 <20090420185918.GA1158@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0DazTEY31RTqkz8akcxxmToCN4uihc3Wz64yGHShx0Q=;
        b=TJkkJcfs8RvbxVa303w6ZjhjeY1Ht8RQIpWuec4eoiZv3/t71LdiWdSC3TBGKPxu4M
         2zn9bfF1M8RQZtO/MDyrPRjJsGnYS8U3NlHChij5+VxFDg1fgNK5kLwsznnkkDrXGrCc
         gcXC/2fpzGQPXfV3sjc4IbpW6PtQ7QI6en87U=
In-Reply-To: <20090420185918.GA1158@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

I've switched to Debian Lenny 5.01 (kernel 2.6.26-2, iptables 1.4.2)
and Jan's suggestion has worked out-of-the-box: the old streams are
stable when changing the default route in the main table =3D).

Anyway, I would like to know if you have any clue about what could be
happening in Ubuntu 8.10 (kernel 2.6.27-11, iptables 1.4.0), since it
would be very helpful in case I need to develop some iptables-related
stuff in the future.


Thank you so much for your help,
Javi

El d=EDa 20 de abril de 2009 20:59, Thomas Jacob <jacob@internet24.de> =
escribi=F3:
> On Mon, Apr 20, 2009 at 05:15:21PM +0200, Javier G=E1lvez Guerrero wr=
ote:
>> $ sudo iptables -L -t mangle
>> Chain PREROUTING (policy ACCEPT)
>> target =A0 =A0 prot opt source =A0 =A0 =A0 =A0 =A0 =A0 =A0 destinati=
on
>> CONNMARK =A0 tcp =A0-- =A0anywhere =A0 =A0 =A0 =A0 =A0 =A0 anywhere =
=A0 =A0 =A0 =A0 =A0 =A0state NEW
>> tcp spt:rtsp CONNMARK set 0x1
>
> If you are forwarding packets via this host you need the CONNMARK res=
tore
> here as well, then you can also drop the CONNMARK restore from the IN=
PUT chain,
> PREROUTING is also traversed for packets destined for the local host.
>
>> With this environment I get the same results. I send the first TCP
>> packet (SYN, dport 8554) through the interface ra1 (OK) with the IP
>> bound to this interface (SNAT OK) and I get the (SYN,ACK) to the sam=
e
>> IP and through the same interface (OK!), but my application does not
>> send the final acknowledgement to the TCP connection establishment
>> (ACK), so the RTSP messages are not sent and the client retries over
>> and over again the TCP session establishment.
>
> Your application does not send the ACK in the 3 way handshake, the
> client kernel does. Somehow it doesn't receive the SYN,ACK or
> the ACK does not reach the point where you're tcpdumping packets.
> Try to sniff as =A0close to your client app as possible. Could be
> a NAT issue. Or maybe rp_filter or something else is breaking
> it for you, you could try to enable /proc/sys/net/ipv4/conf/*/log_mar=
tians
> to see any issues.
>
>> messing up old connections with other videos. I can't understand how
>> this can be so difficult to configure. I must be missing something i=
n
>> my rules...
>
> Find another general purpose OS where you can do this AT ALL without =
additional
> products. Then we'll talk about what is difficult or not ;=3D)
>
>
