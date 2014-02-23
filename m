From: test account <850.test.email@gmail.com>
Subject: Unable to Block Individual Ports from the LAN to the Internet
Date: Sun, 23 Feb 2014 13:46:20 -0500
Message-ID: <CAPNjXEmGdBJaFFRs0xsLHQxBui6SFZ9ku=sr816Pd+xcw_nU8A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=cMEe0qsGfqCXWCpwNr7OOZDkYi7K3paVoqBhnIZvXAs=;
        b=pMb8YGuEd3QaXOmMaOh8WyxLxe5CBQuvkt5eXS8XnjBL9JhlTDvpnGSqXh5z2oK91/
         +oLZyXHzoW9WeUk1NjqHBIMrXjvrnE1uRL4jrpoAdZf7M9q5Y8940ljcBopBHzxtNVVz
         amLowg2E1fh7heNHW0H9ohy/LUjuMMj+e14im0Hnuon08uKD0SNAPz+uQLVDxiSsQTVl
         Xcltlt24kNZHF0XGaa1kpkTlfpZj+wqlbQGpbIsdsrF/UvALTb/UygM5fTnItkPfs+mQ
         rnydws6oQuAf8654/Z7iXIgjGRmTcYTSpSTINcsaHU0aBnivif1uzy59Ja6DzSgCbWO7
         mryQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am doing something wrong but I am at a loss to know what it is.   I
am using Slackware with the 3.10.30 kernel and iptables v1.4.20 with
eth0 as Internet side and eth1 as the LAN user's side.

If I set up the following in rc.iptables

           #!/bin/sh
           # define the path to the iptables executable
           IPTABLES=/usr/sbin/iptables

           # FLUSH TABLE RULES
           $IPTABLES -F

           # FLUSH NAT-CHAIN TABLE RULES
           $IPTABLES -t nat -F

           # ENABLE IP FORWARDING
           echo 1 > /proc/sys/net/ipv4/ip_forward

 IPTABLES looks like this.

          Chain INPUT (policy ACCEPT)
          target     prot opt source               destination

          Chain FORWARD (policy ACCEPT)
          target     prot opt source               destination

          Chain OUTPUT (policy ACCEPT)
          target     prot opt source               destination

I would think with this configuration I should be able to browse the
Internet from a LAN PC, but I cannot.  ??????

If I add this rule to rc.iptables

          $IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE

The output of  $IPTABLES -t nat -L  adds the following to IPTABLES

          MASQUERADE  all  --  anywhere             anywhere

I can now use a browser on the LAN side to reach a web site on the Internet.

If I then add this rule.

          IPTABLES -A INPUT -i eth1 -p tcp --dport 1:1054 -j DROP

Which results in this

          Chain INPUT (policy ACCEPT)
          target     prot opt source               destination
          DROP       tcp  --  anywhere             anywhere
 tcp dpts:tcpmux:1054

          Chain FORWARD (policy ACCEPT)
          target     prot opt source               destination

          Chain OUTPUT (policy ACCEPT)
          target     prot opt source               destination

 I would think that would block just about everything again, but I can
use a browser on the LAN side and see Internet sites just fine.

 I have also tried to configure it in other ways with different rules
and/or IP addresses instead of eth0 or eth1 including the order the
rules are applied, but I always end up with the same results.  Either
it passes nothing or when it does pass traffic, the drop rules do not
seem to work.

 Ideally I would like the LAN side on eth1 to be able to reach
anything on eth0, the Internet side, except those ports and IP
addresses that I would specifically block but I am obviously not
applying the rules correctly.   Any hints or suggestions?
