From: "Kim B. Heino" <b@bbbs.net>
Subject: [Announce] Foomuuri - New firewall software using nftables
Date: Thu, 20 Apr 2023 14:09:37 +0300
Message-ID: <20230420140937.29bd87c2@cobra.bbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bbbs.net; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :x-mailer:message-id:subject:subject:from:from:date:date
        :received:received:received:received:received; s=key1; t=
        1681988979; x=1682852980; bh=01AB0TeDty4HXe+L9p+h130DktAq+GQnhY8
        mxORfO34=; b=INHw9dqvvOKFqdRD3jbDnPi8IHgC9SxnBYNf0W5id5PWXIncH3s
        z/Hr8BXdGLIZ81282evFP2FeawjyUmb6pJ7HwkzOiVybkWr5FSCjw1rRIaKG7BtT
        qomqqmS2WqxbKt4gWmfsNokN+PhkDZ8CMKx0ESs9uOnegTNukQ61GrvTZJGpd6ST
        XpNQqHGHfAhfx3TL3X60USHkMAUwNkAzKDbjUfZSPLLID4oyyhLtrN918aa9mea/
        uCEDx8GwT8LyF81fwztewqJYH7GGnLWJUL0DdHnzZp9nMq1zYXxpRek0Cr7vUTs/
        Ol85PPXjSsuywue3ZWKIVA04Iydikb7BLuQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Foomuuri is a multizone bidirectional nftables firewall.

We have been developing Foomuuri firewall software for last four
months. It's already installed to ~50 different systems, from laptops
to servers to corporate router firewall.

Now we consider it as "stable" so it's time to annouce is more
publicly. It should fit most firewalls as is, only some advanced
features (like multi-ISP) are missing.

Source, documentation and release files are available at:

https://github.com/FoobarOy/foomuuri

Help wanted: All kind of ideas, testing, documentation, patches, etc
are welcome. For example, we use rpm packages ourself and deb packages
are only briefly tested.

Features:

- Firewall zones
- Bidirectional firewalling for incoming, outgoing and forwarding traffic
- Suitable for all systems from personal laptop to corporate firewalls
- Rich rule language for flexible and complex rules
- Predefined list of services for simple rule writing
- Rule language supports macros and templates
- IPv4 and IPv6 support with automatic rule splitting per protocol
- SNAT, DNAT and masquerading support
- Logging and counting
- Rate limiting
- DNS hostname lookup support with dynamic IP address refreshing
- IPsec matching support
- Ability to map certain traffic to separate zones
- D-Bus API
- FirewallD emulation for NetworkManager's zone support
- Raw nftables rules can be used
- Fresh design, written to use modern nftables's features

Sorry if this email is considered spam. I will not send it again.
