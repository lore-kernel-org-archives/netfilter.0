From: toml <toml@thlu.de>
Subject: Re: Nftables + ALG + Linux 6.1.0-10-amd64
 =?UTF-8?Q?=E2=80=A6=3F=2E=2E=2E?= is it a kown Problem?
Date: Tue, 01 Aug 2023 16:20:57 +0200
Message-ID: <b47e1dc20a97eb4e6972d5cbfd2cf9dcaaab7e06.camel@mail>
References: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
         <20230731133608.GA21425@breakpoint.cc>
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230731133608.GA21425@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello Florian

Thank you for your response!=20

Am Montag, dem 31.07.2023 um 15:36 +0200 schrieb Florian Westphal:
> You need to assign the helper to use in your nftables ruleset.
>=20

> You might need to do this from output too if you need
> this to work from the machine itself as well.

That is my test rule. My Server is both, FTP-Server (Web-Cams) and FTP-
Client for various uploads.

If I understand correctly, incoming packets (as FTP-Server) will first
activate the helper in prerouting. The input rules then allow the
control channel port 21 and the helper the (related) data channel port
n.

For outgoing packets (as FTP-Client) first the helper is activated in
the output chain, then port 21 is allowed again, the helper handles the
related data channel.=20

Have I understood this correctly?


table ip filter {
  ct helper ftp-helper {
      type "ftp" protocol tcp
      l3proto ip
  }

  chain prerouting {
      type filter hook prerouting priority -100; policy accept;
      ct state 0x8 tcp dport 21 ct helper set "ftp-helper"
  }

  chain input {
      type filter hook input priority 0; policy accept;
      tcp dport 21 accept
      ct helper "ftp" accept
  }

  chain output {
      type filter hook output priority 0; policy accept;
      ct state 0x8 tcp dport 21 ct helper set "ftp-helper"
      ct state 0x8 tcp dport 21 accept
      ct helper "ftp" accept
  }
}

Best Regards
Thomas
