From: Matt Killock <matt.killock@praemium.com>
Subject: Iptables Reject with TCP Reset
Date: Fri, 6 Jan 2017 15:19:38 +0000
Message-ID: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wealthcraft.onmicrosoft.com; s=selector1-praemium-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GcgSxmEzhb6nfgzgy6oxNiZboW4KLHzpGUpQBqqlR2I=;
 b=dpbkc3liMdsxUNneWwG2BZU81BeiGGJjJrO4aF4TAnrsFOCS0g5G5+hagGxjoPtFaxSnpQMFfNkPzQ7dcOTqrnsKe+LaPlxSRiFWXy9+wUY0rlRjCrFpTv1rdKH7VNIcR7OU8PPQ6XTCZNGjsElGoWWaym9D5nPFDzmLdn54yfk=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

We are using linux iptables on a firewall device to block all traffic from =
internal hosts except for a few exceptions with a default FORWARD policy of=
 DROP. So there is no general HTTP/HTTPS access. This all works fine except=
 that various applications like Microsoft Word and Adobe Reader all attempt=
 to connect to various internet hosts and introduce delays that are not the=
re if there is general access. Adobe refuses to display PDF content for 30 =
seconds whilst it attempts to connect to various cloud services. I can redu=
ce this delay to 5 seconds if I add all the hostnames it attempts to connec=
t to in the hosts file to point to 127.0.0.1.

What I'd like to do is make the firewall respond with a TCP Reset packet in=
stead of doing nothing or only sending an ICMP unreachable packet, which I =
presume is what happens when Adobe attempts to connect to 127.0.0.1 on port=
 80

The following line does not do this - does this no longer work?

iptables -A FORWARD -s 192.168.40.0/24 -d 0/0 -p tcp --dport 80 -j REJECT -=
-reject-with tcp-reset

Thanks

Matt

________________________________

Plum Software is a fully owned subsidiary of Praemium Limited.

This e-mail is confidential. It may also be legally privileged. If you are =
not the addressee, you may not copy, forward, disclose or use any part of i=
t. If you have received this message in error, please delete it and all cop=
ies from your system and notify the sender immediately by return email. Int=
ernet communications cannot be guaranteed to be timely, secure, or error or=
 virus free. The sender does not accept liability for any errors or omissio=
ns.

In the UK the Praemium Group is: Praemium Portfolio Services Ltd (Company N=
umber: 05362168), Praemium (UK) Ltd (Company Number: 05362153), Praemium Ad=
ministration Ltd (Company Number: 06016828) and Smartfund Nominees Ltd (Com=
pany Number: 07153417) each having its registered office at 4th Floor, Suit=
e 643-659, Salisbury House, London Wall, London, EC2M 5QQ, United Kingdom. =
Praemium Administration Ltd is authorised and regulated by the Financial Co=
nduct Authority under reference 463566. See http://www.fca.org.uk/register =
for more details.

In Jersey the Praemium Group is: Praemium International Ltd (Company Number=
: 107624) which has its registered office at 3rd Floor East, Salisbury Hous=
e, 1-9 Union Street, St Helier, JE2 3RF and is regulated under the Financia=
l Service (Jersey) Law 1998 by the Jersey Financial Services Commission for=
 the conduct of investment business in Jersey. See http://www.jerseyfsc.org=
 for more details.

Thank you for your cooperation. Please contact us on +44 (0)207 5622 450 if=
 you require assistance.
