From: valerio balbi <valerio.balbi@gmail.com>
Subject: Re: GRE protocol .
Date: Sat, 1 May 2010 11:09:14 +0200
Message-ID: <w2tedd0054b1005010209g74470681vc4bb4895b2a60ef7@mail.gmail.com>
References: <1291704212-1272660052-cardhu_decombobulator_blackberry.rim.net-422468553-@bda240.bisx.produk.on.blackberry>
	 <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5MFXNYJjQyP/dBhWHzZNeE+zNz2ev721fk8Gzr0cBPw=;
        b=pIbs5wza84Tz0ETJSWVusp35yjbVEro8wK5d5Mpe11v+lWFTXySrC3E+yXKN98zpgc
         wUpt97ep1ZqE01DBuOlvfICegNLYj0KDvQr02vC5BUDpqU68SUbsclwKoU2yKJWdQLdV
         T+OWgKUWJPBR3RBfaN3DwsqhTrttBmrtnkaEk=
In-Reply-To: <AANLkTimBkNBrvVM7H5_W3fFy4X48sUK6aDQzY_0JyX0X@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, May 1, 2010 at 6:54 AM, ratheesh k <ratheesh.ksz@gmail.com> wro=
te:
> On Sat, May 1, 2010 at 2:11 AM, =A0<valerio.balbi@gmail.com> wrote:
>> It's not clea r (sorry).
>
> iptable rules configured in my gateway machine ( which act as a route=
r
> ) =A0has no rule to allow GRE packet coming from wan side to pass thr=
u .
> There is no ALGs loaded . Still i am able to establish a pptp
> connection . I can see GRE packet reached client machine using a
> wireshark .
>


if the problem where in my lan I will probably proceed in this way
trying to isolate the fenomena:

check the global policy of my FORWARD chain implementing DROP default

creation of a new chain:
/sbin/iptables -N pptp
/sbin/iptables -A pptp -p tcp --destination-port 1723 --dst
$SERVERPPTP -j ACCEPT
/sbin/iptables -A pptp -p 47 --dst $SERVERPPTP -j ACCEPT

plug of the new chain into FORWARD one like first:
/sbin/iptables -I FORWARD 0  -j pptp

repeat the same for nat PREROUTING
/sbin/iptables -t nat -N pptp
/sbin/iptables -t nat -A pptp -p tcp --dport 1723 -j DNAT --to $SERVERP=
PTP:1723
/sbin/iptables -t nat -A pptp -p 47 -j DNAT --to $SERVERPPTP
/sbin/iptables -t nat -A PREROUTING -j pptp


this way you can control if the new rules were matched or not
if where matched you can stop the connection
if not I will gather more information from my network topology looking
for an alternate router machine.

I hope this will help you
bye
