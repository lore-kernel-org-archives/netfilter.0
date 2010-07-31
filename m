From: Mark Ryden <markryde@gmail.com>
Subject: ipv6 forwarding without netfilter
Date: Sat, 31 Jul 2010 17:44:52 +0300
Message-ID: <AANLkTik0MPyj4Vthm1fFXA56yEMW-a5FJ_vP6+-U+WhQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=yKWRI2cEFwWRROWEU6JP4E2WDKfil0IMrb7VLlh6xE8=;
        b=nXNN8xCl4pTl+PD7Om6O4gSm+4tMZy9q4V3bA6BPyfHyIyXPt+TDnzgHVj3a7k0JIE
         qSJtuN/pi6nl1yZoeJMIqTdPC+u8R7d13/R9VfnCnEQEVcoD4XFb4RsKYzYnFwsDogYi
         og/ByGm7xpgcYRgoG7PUeMTIUO54mZSEZVFiQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
According to this link:
http://www.faqs.org/docs/Linux-HOWTO/Linux+IPv6-HOWTO.html#FIREWALLING-NETFILTER6

"In IPv6 you can't control forwarding per device, forwarding control
has to be done using IPv6-netfilter (controlled with ip6tables)
rulesets and specify input and output devices (see
Firewalling/Netfilter6  for more). This is different to IPv4, where
you are able to control forwarding per device (decision is made on
interface where packet came in). "


My question is:
Suppose you don't want to control forwarding in IPv6 on a certain
device, just forward packets which are received on any device.
I am not sure that this howto is relevant.
Is it true that in order to achieve IPV6 forwarding you must use
netfilter rule ?

Is it possible to achieve forwarding simply by running:
echo "1" /proc/sys/net/ipv6/conf/all/forwarding

without setting any ip6tables netfilter rule ?


rgs,
Mark
