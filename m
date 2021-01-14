From: Julian Somers <juliansomers@gmail.com>
Subject: nftables: counters in sets missing from nft --json output
Date: Thu, 14 Jan 2021 12:43:47 +0000
Message-ID: <CAJ2-ft9rR36SPoZdyOdLYAKpsTTNA9QZdY4X+gabTsJohw3u1A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sQh1quE8VfhILrc2LWdplT9Oppe0z9clem5YYjV+eYo=;
        b=IqCaadRkYtwRAKDmp3De9WZK/QRwEkmTMtVDBFjJ/FWH440lAaJhQqX8DwUarNYREf
         ytnu+3eRPIPDb1O6h/gv4nSGkMS6HCOy50j7CEhuHKdVSBSo4vliKm9OAQPJydUJayks
         +s71/zpDI+jX2Ae/OTPiCraNsPiRbpx8y+tdkuXd9rGPGLjDkqGWqhiTBqpLv4YnV6M2
         I9FFD4vQfk0oFcBFjHwXnhIeAhbOusjrIg4kE9HavvEF/QxMkb8L2i5ZlodYmOWz45dP
         ORQz0E+ch9sjDhR3Cf9Y1tkYapWv9ZwdJFuwI1KAvNSYVXbyNgNP+n1Flx5MLQHK5sJN
         Y53Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello

I can see counters in my sets when I use `nft list` but not when I use
`nft --json list`

The counters are also missing when I use the nftables python libraries
to list the sets.

I have no problem getting named stateful counters with `nft --json
list ruleset`  and with the python nft.cmd("list ruleset")

Is there any other machine readable way to get counters for set elements?

Many thanks!

julian@db-fw-a:~$ sudo nft list set inet filter to_databases
table inet filter {
set to_databases {
type ipv4_addr
size 65536
flags dynamic,timeout
timeout 1d
elements = { 172.16.98.8 expires 22h15m15s948ms counter packets
25275074 bytes 2244973824, 172.16.98.18 expires 6h43m52s400ms counter
packets 34 bytes 1440 }
}
}

julian@db-fw-a:~$ sudo nft --json list set inet filter to_databases |jq
{
  "nftables": [
    {
      "metainfo": {
        "version": "0.9.6",
        "release_name": "Capital Idea #2",
        "json_schema_version": 1
      }
    },
    {
      "set": {
        "family": "inet",
        "name": "to_databases",
        "table": "filter",
        "type": "ipv4_addr",
        "handle": 8,
        "size": 65536,
        "flags": [
          "timeout"
        ],
        "timeout": 86400,
        "elem": [
          {
            "elem": {
              "val": "172.16.98.8",
              "expires": 79987
            }
          },
          {
            "elem": {
              "val": "172.16.98.18",
              "expires": 24103
            }
          }
        ]
      }
    }
  ]
}

julian@db-fw-a:~$ sudo nft --json list counter inet filter ha-conntrack |jq
{
  "nftables": [
    {
      "metainfo": {
        "version": "0.9.6",
        "release_name": "Capital Idea #2",
        "json_schema_version": 1
      }
    },
    {
      "counter": {
        "family": "inet",
        "name": "ha-conntrack",
        "table": "filter",
        "handle": 4,
        "packets": 70305,
        "bytes": 3105800
      }
    }
  ]
}

I am using debian buster with nftables and python3-nftables from
buster-backports
julian@db-fw-a:~$ sudo dpkg -l | grep nftables
ii  libnftables0:amd64            0.9.0-2
amd64        Netfilter nftables high level userspace API library
ii  libnftables1:amd64            0.9.6-1~bpo10+1
amd64        Netfilter nftables high level userspace API library
ii  libnftnl11:amd64              1.1.7-1~bpo10+1
amd64        Netfilter nftables userspace API library
ii  nftables                      0.9.6-1~bpo10+1
amd64        Program to control packet filtering rules by Netfilter
project
ii  python3-nftables              0.9.6-1~bpo10+1
amd64        nftables/libnftables python3 module
julian@db-fw-a:~$ uname -a
Linux db-fw-a 4.19.0-13-amd64 #1 SMP Debian 4.19.160-2 (2020-11-28)
x86_64 GNU/Linux
