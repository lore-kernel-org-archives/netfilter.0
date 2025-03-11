Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1378F5D
	for <netfilter@vger.kernel.org>; Tue, 11 Mar 2025 13:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741700007; cv=pass; b=sUSymhkfANsEEUCRui83RCfV2MepEwivPQEUNdYLTnw0EQAZ0XdjBFufLT58UCSiqjB0Y++cDlyA7U1VvOsKzKx+AV3iWbXNKRD4hagnyFsWg8mB/zjoRa+JFjEdFD+ehk7ZcPAzmCElJw7zrBaMLUvUq+9RH9Y2cCGcABQH/l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741700007; c=relaxed/simple;
	bh=JGMHSvRlnxy21r/xgVFnIOA3oWMOJMd8+tTDh5pxS8M=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=bnxewXGglH0//7a0f6pSEgk0EwQH+w/abi136xfHxS9nefXr0OqPv3fnhVJYM4l0teuasII8IA+V32z/1YOKxzlISMvX6jrPzsMNYNzp+6m3hCaxOZMehAdETwShA5UtOSSKGJGwWwjvLKaEDK4p77EemmnZbcam4FPm3TtFmtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eray.ca; spf=pass smtp.mailfrom=eray.ca; dkim=pass (1024-bit key) header.d=eray.ca header.i=bilgin@eray.ca header.b=J9WDoLnO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eray.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eray.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eray.ca header.i=bilgin@eray.ca header.b="J9WDoLnO"
ARC-Seal: i=1; a=rsa-sha256; t=1741700002; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kd3IUHtkBIfhB32a6wGiBYubwHUHQRW5r9gsHiGlAR7ekyn33Sye3GntPDILLsjhrui9t8ZyXJWmet05v1Ku1viERGj170+6r23RDxV2AySVVnyKDLZ9Ro25Im2Z1RMUPCzfVkML72ThoOTv6u6JIGjY4S2u2EKR3mvEpdAf0XA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741700002; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=JGMHSvRlnxy21r/xgVFnIOA3oWMOJMd8+tTDh5pxS8M=; 
	b=JXNQH1xORC9C59E/s1d6LvnREtdJeJypOj13bBNfGmTYVOw9Nmw2vJXhhqGFGsaBNYEgiyuAfa34NV2XCughlZGz5dQ1Licc5oD5QyzZ6O8yz0hLhKbQ1wONlDyt8xf6E8WTJFZH6uf62kKuPbFPm0YBtz3y8y0wyz63OFz37KA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=eray.ca;
	spf=pass  smtp.mailfrom=bilgin@eray.ca;
	dmarc=pass header.from=<bilgin@eray.ca>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741700002;
	s=zmail; d=eray.ca; i=bilgin@eray.ca;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=JGMHSvRlnxy21r/xgVFnIOA3oWMOJMd8+tTDh5pxS8M=;
	b=J9WDoLnOl4YCHmTtJEJ4omzM4TIJAWE6CHfkFpEE5175s6NqUYd4VSjnqr1bqwf2
	MjXqYHG21vIKgxP+xLJPfeTGgfIgNapmdqU71nkPWlCqvIP/8FUySYMqKyTz+Iew/34
	+z76HpviL9x2a1RS9fogI7wSu3/YVJP5xuOEy25U=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1741700000251640.8929313903682; Tue, 11 Mar 2025 06:33:20 -0700 (PDT)
Date: Tue, 11 Mar 2025 09:33:20 -0400
From: Eray Bilgin <bilgin@eray.ca>
To: "netfilter" <netfilter@vger.kernel.org>
Message-ID: <1958568e9a1.be49b3ad53051.1702359735061948725@eray.ca>
In-Reply-To: 
Subject: connection tracking fails to update udp timer
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

i noticed this when my voip phone mysteriously stopped ringing. i use
a tp-link router as a gateway which i'm certain is running
linux/netfilters, though i don't know what version. i've observed the
same problem on my raspberry pi running iptables v1.8.2.

usually the first thing a sip client does is register with the provider's
server. this has the effect of punching a hole through any firewalls in
its path. after that initial registration, my provider keeps the
connection alive by sending messages every 60 seconds.

when netfilters sees traffic moving back and forth, the connection should
transition to the assured state and set the expiration timer to
nf_conntrack_udp_timeout_stream, which by default is 120 seconds.=C2=A0but =
in
this case the timer is reset to nf_conntrack_udp_timeout, which is 30
seconds. the connection does not appear as "assured".

pi@zawardo:~ $ sudo conntrack -L | grep 5060
conntrack v1.4.5 (conntrack-tools): 26 flow entries have been shown.
udp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 17 3 src=3Dx.x.53.184.sip dst=3Dx.x.126.7=
3 sport=3D5060 dport=3D5060
src=3Dx.x.126.73 dst=3Dx.x.53.184 sport=3D5060 dport=3D5060 mark=3D0 use=3D=
1

this means that the connection is already expired before the first
keep-alive arrives. if the router is using nat or filtering new connections
then the messages bounce back until the client opens a new connection
from inside.

pi@zawardo:~ $ sudo tcpdump -i ppp0 udp port 5060 or icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 262144 =
bytes
16:28:46.010042 IP x.x.53.184.sip > sip.example.com.sip: SIP: REGISTER sip:=
sip.example.com:5060 SIP/2.0
16:28:46.018303 IP sip.example.com.sip > x.x.53.184.sip: SIP: SIP/2.0 401 U=
nauthorized
16:28:46.021205 IP x.x.53.184.sip > sip.example.com.sip: SIP: REGISTER sip:=
sip.example.com:5060 SIP/2.0
16:28:46.030034 IP sip.example.com.sip > x.x.53.184.sip: SIP: SIP/2.0 200 O=
K
16:28:46.031020 IP sip.example.com.sip > x.x.53.184.sip: SIP: OPTIONS sip:z=
awardo@x.x.53.184:5060 SIP/2.0
16:28:46.031326 IP sip.example.com.sip > x.x.53.184.sip: SIP: NOTIFY sip:za=
wardo@x.x.53.184:5060 SIP/2.0
16:28:46.034408 IP x.x.53.184.sip > sip.example.com.sip: SIP: PUBLISH sip:z=
awardo@sip.example.com:5060 SIP/2.0
16:29:46.030460 IP sip.example.com.sip > x.x.53.184.sip: SIP: OPTIONS sip:z=
awardo@x.x.53.184:5060 SIP/2.0
16:29:46.030587 IP x.x.53.184 > sip.example.com: ICMP x.x.53.184 udp port s=
ip unreachable, length 492
16:29:46.530506 IP sip.example.com.sip > x.x.53.184.sip: SIP: OPTIONS sip:z=
awardo@x.x.53.184:5060 SIP/2.0
16:29:46.530619 IP x.x.53.184 > sip.example.com: ICMP x.x.53.184 udp port s=
ip unreachable, length 492

i've tested this with a few different sip servers and it doesn't matter
whether the pi is forwarding the connection or initiating the connection
itself.

before you ask me to update netfilters, just know i'm more=20
interested in learning why this occurs since it seems to be=20
contrary to what i know about how connection tracking
should work. if it is a known bug affecting older versions of
netfilters then i would appreciate any documentation that might
persuade tp-link to update their firmware.

yours,

eray


