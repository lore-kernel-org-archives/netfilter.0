From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: ICQ file transfers
Date: Fri, 8 Aug 2003 08:19:55 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C078@wardrive.citadelcomputer.com.au>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>, netfilter ML <netfilter@lists.samba.org>

Block everything and allow only port 5190/4000 (don't know if groupware =
is the same ports or not)..
Obviously if your allowing everything then expect more problems when =
people use IRC or Direct Connect to send to others..

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
From: Leonardo Rodrigues Magalh=E3es [mailto:leolistas@solucoesip.net]
Sent: Friday, August 08, 2003 7:59 AM
To: netfilter ML
Subject: ICQ file transfers



    Hello Guys,

    I have two LANs interconnected with FreeSWAN IPSec tunnel. It's =
working
fine. Gateway in both sides is a linux box running iptables. We're =
running
ICQ Groupware Server and ICQ Groupware clients for instant messages.

    I need, somehow, block ICQ File transfers, but I cannot block ICQ
messages. ICQ Client does not allow this kind of config. I was thinking =
on
some string match to block the initial ICQ File transfer request. =
Question
is: do anybody here has the string I'm looking for ? Has anyone =
experienced
a similar problem ?

    Sincerily,
    Leonardo Rodrigues



