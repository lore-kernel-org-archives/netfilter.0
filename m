From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Traffic limitation with iptables
Date: Wed, 23 Jul 2003 08:07:40 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF6B@wardrive.citadelcomputer.com.au>
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
To: Xemul <epv_xemul@mail.ru>, netfilter@lists.netfilter.org

Use the Quota patch and it'll limit the rule by itself..		=09

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au



-----Original Message-----
From: Xemul [mailto:epv_xemul@mail.ru]
Sent: Wednesday, July 23, 2003 2:09 AM
To: netfilter@lists.netfilter.org
Subject: Traffic limitation with iptables


Hi.
I wanna solve such a problem:
When I see that byte counter on some chain reaches or exceedes any fixed
value - then IMMEDIATELY insert into that cahin new first rule (e.g. -j
DROP) or delete some rules from any other chain. Or more abstract - how
can can discover that byte counter is higher than smth without
"polling" chains?

Sorry for sending such a mail into announce, developers and user
maillists but I need help as soon as possible. :)


