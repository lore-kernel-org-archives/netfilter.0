From: Thomas Bach <t.bach@ilexius.de>
Subject: IPSec, masquerade and dnat with nftables
Date: Fri, 09 Sep 2016 09:06:59 +0200
Message-ID: <8737l9mu0c.fsf@ilexius.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ilexius.de; s=mail;
        t=1473404819; bh=PiIh2f7YWSkh1s3vSpN48l+n9il+LU+0qSAFS4Jq0Ek=;
        h=From:To:Subject:Date:From;
        b=njFn0EKFXHeujEhzIqp9IHJWwHRJOgJUXLfB5DDZm7tmy4vLTgtkNe9UTyaYCu+sR
         1jonR2tkMzlk73yMQvo0NHwhQNG3n7BLlthBKC0RPvre53qjiGoozpDsdGO8LEIqiy
         kFK9jtFYk5cc/G0p61KvzWOpUbCgd8tLcPu7qCkM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I have two hosts with public ip addresses running Ubuntu 16.04 with
Kernel version 4.4.0.

I want to interconnect two containers (systemd-nspawn) with veth
interfaces running on these hosts in a server client setup.

So on the first host, where the server in the container runs I have
the following rules:
# nft list ruleset
table ip nat {
  chain prerouting {
    type nat hook prerouting priority 0; policy accept;
    tcp dport { 4506, 4505} dnat 10.0.0.2=20
  }

  chain output {
    type nat hook output priority 0; policy accept;
    tcp dport { 4505, 4506} dnat 10.0.0.2
  }

  chain input {
    type nat hook input priority 0; policy accept;
  }

  chain postrouting {
    type nat hook postrouting priority 0; policy accept;
    ip saddr 10.0.0.0/8 oif enp4s0 masquerade=20
  }
}

On the second host, where the client runs i have the following:
# nft list ruleset
table ip nat {
  chain prerouting {
    type nat hook prerouting priority 0; policy accept;
  }

  chain output {
    type nat hook output priority 0; policy accept;
  }

  chain input {
    type nat hook input priority 0; policy accept;
  }

  chain postrouting {
    type nat hook postrouting priority 0; policy accept;
    ip saddr 10.0.0.0/8 oif enp0s31f6 masquerade=20
  }
}

This works as expected and without any problems at all. Now IPSec
enters the picture. As soon as I setup a policy to encrypt everyting
between the two hosts the following happens:
+ I can still connect from the second host to the server in the
  container without problems,
+ I can still /connect/ (i.e. establish a connection) from the
  container on the second host to the server on the first host, but
+ in tcpdump listening on the interface of the container (on the
  second host) I see lots of TCP Retransmissions and the TCP connection
  is effectively broken.

Can someone give me a hint what is going on here?

Regards

    Thomas Bach.
--=20
ilexius GmbH
Thomas Bach
Unter den Eichen 5
Haus i
65195 Wiesbaden
Fon: +49-(0)611 - 180 33 49
Fax: +49-(0)611 - 236 80 84 29
----------------------------------------
ilexius GmbH
vertreten durch die Gesch=C3=A4ftsleitung:
Thomas Schl=C3=BCter und Sebastian Koch
Registergericht: Wiesbaden
Handelsregister: HRB 21723
Steuernummer: 040 236 22640
Ust-IdNr.: DE240822836
----------------------------------------
