From: "Atkins, Brian" <Brian.Atkins@netapp.com>
Subject: RE: nft JSON rule output order
Date: Wed, 20 Apr 2022 14:20:46 +0000
Message-ID: <DM8PR06MB771787A86147CE37B06554E8F9F59@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <DM8PR06MB7717442CEA8AD5A96EE9BFBCF9F29@DM8PR06MB7717.namprd06.prod.outlook.com>
 <87lew06ufy.fsf@alfa.kjonca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netapp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJELJ9OBNDgMFfYCiZYoycO05fFFIE8v4Xa0eBzh/oA=;
 b=lhN4QYzH0mwDTDG/+AUvHudpyK2J9ePK3l47Vzi2Pyy16PhC0G0NKhsuzZsxMuxp5z06A83q8AS+db90MSABnLHnXkNTEGcg1exSGihK1Rr2Z8SSxK0+T5YGvYyZxCI8puh5cZw39J002WcUv7vu4MqbhDyWI61znvoy73hvMpMFFKJ3WRsprBTZNFJfbywZlEkoWfJ8XGOrhjIVK4YClskPvCvAvctxF0sX6N98RQzbmwcmAj3kuMLCsYT7nx4GXpW5wvVSoAB3YUq7pBOfXdlPv4y36L5f5TKeH/kI8bGO9QfhKfUrWBD1aH2KsqhKk40sZKIWgRnahCudGX59lA==
In-Reply-To: <87lew06ufy.fsf@alfa.kjonca>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

So, if I dump a table in JSON, all the rules for all the chains appear toge=
ther, apparently ordered by chain.  Each rule is a complex JSON object (I d=
on't know what you mean by line in this context).
For example, the following configuration:

table ip filter {
        chain input {
                tcp dport 22 counter packets 0 bytes 0 accept
                tcp dport 443 counter packets 0 bytes 0 accept
                counter packets 0 bytes 0 drop
        }

        chain second_chain {
                udp dport 53 counter packets 0 bytes 0 accept
                udp dport 68 counter packets 0 bytes 0 accept
                counter packets 0 bytes 0 drop
        }
}

produces this json:
{
  "nftables": [
    {
      "metainfo": {
        "version": "0.9.8",
        "release_name": "E.D.S.",
        "json_schema_version": 1
      }
    },
    {
      "table": {
        "family": "ip",
        "name": "filter",
        "handle": 14
      }
    },
    {
      "chain": {
        "family": "ip",
        "table": "filter",
        "name": "input",
        "handle": 1
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "filter",
        "chain": "input",
        "handle": 2,
        "expr": [
          {
            "match": {
              "op": "=3D=3D",
              "left": {
                "payload": {
                  "protocol": "tcp",
                  "field": "dport"
                }
              },
              "right": 22
            }
          },
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          },
          {
            "accept": null
          }
        ]
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "filter",
        "chain": "input",
        "handle": 3,
        "expr": [
          {
            "match": {
              "op": "=3D=3D",
              "left": {
                "payload": {
                  "protocol": "tcp",
                  "field": "dport"
                }
              },
              "right": 443
            }
          },
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          },
          {
            "accept": null
          }
        ]
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "filter",
        "chain": "input",
        "handle": 4,
        "expr": [
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          },
          {
            "drop": null
          }
        ]
      }
    },
    {
      "chain": {
        "family": "ip",
        "table": "filter",
        "name": "second_chain",
        "handle": 5
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "filter",
        "chain": "second_chain",
        "handle": 6,
        "expr": [
          {
            "match": {
              "op": "=3D=3D",
              "left": {
                "payload": {
                  "protocol": "udp",
                  "field": "dport"
                }
              },
              "right": 53
            }
          },
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          },
          {
            "accept": null
          }
        ]
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "filter",
        "chain": "second_chain",
        "handle": 7,
        "expr": [
          {
            "match": {
              "op": "=3D=3D",
              "left": {
                "payload": {
                  "protocol": "udp",
                  "field": "dport"
                }
              },
              "right": 68
            }
          },
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          },
          {
            "accept": null
          }
        ]
      }
    },
    {
      "rule": {
        "family": "ip",
        "table": "filter",
        "chain": "second_chain",
        "handle": 8,
        "expr": [
          {
            "counter": {
              "packets": 0,
              "bytes": 0
            }
          },
          {
            "drop": null
          }
        ]
      }
    }
  ]
}

My question is will the order of the rules when output in JSON always be in=
 the correct order (like it is for non-JSON output).

-----Original Message-----
From: Kamil Jo=F1ca <kjonca@op.pl>=20
Sent: Wednesday, April 20, 2022 2:17 AM
To: netfilter@vger.kernel.org
Subject: Re: nft JSON rule output order

NetApp Security WARNING: This is an external email. Do not click links or o=
pen attachments unless you recognize the sender and know the content is saf=
e.




"Atkins, Brian" <Brian.Atkins@netapp.com> writes:

> Will the rules for a given chain always appear in the correct order when =
using JSON?
> I didn't see it explicitly stated, and the data structures used in JSON d=
on't suggest a required ordering (as might be assumed if rules where an arr=
ay within a chain).
>

If I understand correctly (please correct me if I am wrong) Whole nftables =
config is dumped as json table where simple record in table is "line" - thi=
s should prevent oredr.
KJ

--
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
