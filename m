From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Forward Chain: is Inbound traffic on eth0 not also Outbound depending 
	on your view?
Date: Sun, 8 Nov 2009 11:11:44 +0000
Message-ID: <ac5c74140911080311g21df128fte32b05d90b233a33@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=hiZ69zc3u4SHHlRpbMkhtRZnTBdsF2fgHRoyBdND0Zs=;
        b=d0I07edRfVjoN0c4659+0nUV7lUVgVXaAToy8iYsUJdpRqafMOVLSbCXQRY6VbKv8l
         /gihrtx7A6pfGle2Uec17mRnOrDeiZEsM9EwRdsCKZe81OUpaezTsBJX2gnWOQch8p6v
         5UP2mkNmKCBcZnsagNYVygg0y71x9nEE7OvWI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Experts

I am curious to know more about what FORWARD chain inbound and
outbound actually mean.

Example firewall set-up below:

Internet --- Firewall --- PC

Firewall has 2 interfaces: eth0 = External and eth1 = Internal

From what I can gather from the Netfilter website, all I need to do is
create are inbound and outbound rules on the FORWARD chain.

To allow inbound Internet access, I specify:

FORWARD -i eth0

To allow outbound PC access, I specify:

FORWARD -o eth1

The question is from whose perspective do you view what is inbound and
what is outbound?

For example, in the case of the Internet client, traffic flowing
towards the firewall is indeed Inbound so naturally "FORWARD -i eth0"
is required. However, isn't it also Outbound on eth1, given that it
leaves interface eth1 to get to PC?

Similarly, clients on the internal network think of their traffic as
being outbound only, but when traffic is being "forwarded" from eth1
to eth0 heading for the Internet, isn't that traffic classed as
Inbound on eth0?

Do I need to create rules for this scenario also or is Netfilter
handling these implied situations?

Beginner questions so apologies in advance.
Paddy.
