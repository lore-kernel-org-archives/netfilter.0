From: "Sig Pam" <spam@itserv.de>
Subject: AW: nftables equivalent for iptables -m recent
Date: Thu, 23 Jan 2020 19:25:03 +0000
Message-ID: <kcEE.LpII0HkB7kmx9fv8WDctFA.gNGKzyLS1QE@exchange64.corp.itserv.de>
References: <kcEE.pOI45menO0OHYgWymsen8Q.gO9QrKDP1QE@exchange64.corp.itserv.de> <5aa1a916-0bc3-80cd-efd5-b0d5ce0c3af3@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itserv.de; s=201701;
        t=1579807518; bh=TnUHQTPB5rN5ZWeyKQGna8NQRYZGDXyctr2GLYTaGDw=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=WOpYvCy1pVT9v1FuZlV0mC873iF5YC/5H5oS2AdWL9LrKyu0VJlWJyfCvVEzw0Q2Y
         fF34TLx/TqO89BlL3ir4/vqTiKPN8ZVpQCpsQxenV6qeghvUVHJTnnM41bukgMOPVP
         47mWD6KvTibyhH+xGyLjna/kw8R/UROMRYP85vJ2UPr4C2dLo/uteVfW7ejoewALrP
         rf0gFxw6ntSEGxzcbOXP/HN0qAcv79K5l3JU1IiCZPr21lgAbBuUn2x8qh1z2E4Acz
         yVkqG2mO3AgmRzCuCEZ7LDiIez9PKYEbs6sgyCDNEKp9sjJZBV2tH7Sz/TEKBHnyzx
         bjmWTb0Sbn76g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itserv.de; s=201701;
        t=1579807510; bh=TnUHQTPB5rN5ZWeyKQGna8NQRYZGDXyctr2GLYTaGDw=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=ffuyU+HKmY3nnep/geVQQxOVS8t85XizLUqai0/C66f+62asDf8AeGKggrwfF4V0A
         JleTnHM0qgbx1Cio6aZ8hS1YIEWEmDXOzrNOoUI9e6N6YxkfVdpftGdmbmCwVUT0/1
         wu0tc7WGWqB0X2k8AZDpmYSC7vFMbDiPUy0MVpV9G9EcF4c6PS7aVAryFL1HPPIpk1
         caL5i4w1J8iEqpe5fjErO4m/9kj5DPcBEgu2ZIPCvIGap0kTdzW2D5YvKaTsnKCJC7
         VnyE691PpacwDE/8QUZ5Tw0J6eihcS0EMzZmfsPAaE6OFWv5dEqmf/2VEfny9STMR/
         vBzgKZBlJhpeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itserv.de; s=201701;
        t=1579807504; bh=TnUHQTPB5rN5ZWeyKQGna8NQRYZGDXyctr2GLYTaGDw=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=zkEKrmXiOJnKL84Se6r/L4h4Lnn18RZq6F6FxLZVih+8hm3MGRC0kt1c3QJIv2qKH
         JjH3NWMHJdf9mRZOxMYKhNDUo7haw+jhavQMl0mX6veSFeAJaL1+VSm0LB14tzrgnI
         I/ZOZ122TKv1c2JIuqykh2J5bwy7qaDlQ/5ZUpOQR0MfZ2mlH9S6UGHDPktslcvB+k
         E9EmXxLEeT23pBFWBsEj9DYdaN6mkH+O6pn7vRDJ4tG5xk4ZbEKb89uB24RleFRG5f
         O/bvMBGTCG3ayq28nb5SVIK+A7L/fEDxGFKzvsbddCCl6xYcImhNrPOPmg+LUHeOJW
         j/glNAcppEw9Q==
In-Reply-To: <5aa1a916-0bc3-80cd-efd5-b0d5ce0c3af3@plushkava.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?us-ascii?Q?kfm=40plushkava=2Enet?= <kfm@plushkava.net>, =?us-ascii?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

This works:

table ip filter {
=09set enemies {
=09=09type ipv4_addr
=09=09flags timeout
=09=09timeout 5m
=09}

=09chain INPUT {
=09=09type filter hook input priority 0; policy accept;

=09=09iifname ens192 ip saddr @enemies \
=09=09=09update @enemies { ip saddr }

=09=09iifname ens192 tcp dport { 1-21, 23-24, 26-79 } \
=09=09=09update @enemies { ip saddr }

=09=09iifname ens192 ip saddr @enemies log drop
=09}
}


First, the set "enemies" is defined with a 5 Minute timeout

In the INPUT Chain,
- ip addresses already in the set are re-added and theire ban is prolonged
- ip addresses trying to open one of the specified ports are newly put into the set
- if the ip source address is in the enemies set, the packet is dropped.

Thank you four your help!

Sig.

