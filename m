From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables limit-burst trouble
Date: Tue, 10 Jun 2003 13:25:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E05@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Tsuyoshi Takada <acroyear@gmx.ch>
Cc: netfilter@lists.netfilter.org

my example:

  $IPTABLES -A PREROUTING -i $EXTDEV -t nat -d $DESTIP -m limit --limit =
3/minute --limit-burst 3 -j ACCEPT
  $IPTABLES -A PREROUTING -i $EXTDEV -t nat -d $DESTIP -j DROP


work with that(add ports for both etc)... it should accept anything to =
it's destination ip for 3 packets per minute and drop the rest...

I don't have your original mail so you'll need to tweak to your needs.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Tsuyoshi Takada [mailto:acroyear@gmx.ch]
Sent: Tuesday, June 10, 2003 1:04 PM
To: Tsuyoshi Takada
Cc: netfilter@lists.netfilter.org
Subject: Re: iptables limit-burst trouble



Is there anyone who teach me ...? (;__;)

--=20
Tsuyoshi Takada <acroyear@gmx.ch>




