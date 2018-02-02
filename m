From: Eric Grunt <gruntblue@gmail.com>
Subject: Re: How to add rules to ip6/inet tables without getting unknown
 [invalid type] with nft list?
Date: Fri, 2 Feb 2018 20:00:25 +0300
Message-ID: <CADB9fJHAoU2VBBKfTGHeTv8sUkZK6cTUO-sRuKE9uA7tU6y8Dg@mail.gmail.com>
References: <CADB9fJHanmSUUhjrGt9SmM-9t_kFMFH6jApAGrSvo80rgvDnZw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=/aY4l2zo/w/hVA/2lmRygH0+3RAwrBKN0Y3NaRHb8GM=;
        b=kZTjkwcbSGfGc1a+TsIHwhtdQ6OugprdY2Vlu4FhWBSS9baS6CaPrR7oyd9Jh3/bzr
         HmaOUdSZqZpwE/B5/58l6TBINgeMLJbJKCPKlstQWguTkjdSHVgG2xEKp1hL9vefRhPO
         LwEfHUJ4VRWqrPbwMar9QJ4nNIFNhCku/7yvqVd53zlcxpq97ptEoIsdDV0Uc18CWZJt
         34kZtM68XzLiGkAyxbxp9XD2ufNFkv3h8q64s3hKamNMg4KYYYDRopQbL0i7/6kyR+Mf
         mjqG2v43tVQjzMDN+DFJkaLvPjAFLNxI6aovNArrAnL72/j038528OihOcDe/4eHTO0t
         ocNg==
In-Reply-To: <CADB9fJHanmSUUhjrGt9SmM-9t_kFMFH6jApAGrSvo80rgvDnZw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm fairly stuck in understanding, why the nft-rule-add.c example code
goes wrong with ip6
Is there another example code adding rules that's known to work with ipv6?

When comparing the (parsed with pyroute2) strace output about what was
sent to the kernel
by the (modified, working with ipv4) example code and by the nft
command line tool,
it's mostly the same.
Beside different sequence numbers and flags (once with and once
without NLM_F_ACK)
in the netlink message header built with nftnl_rule_nlmsg_build_hdr,
there where three netlink messages in the beginning [1].
All with nfgen_family 2, when using the nft command line tool,
but two of them with nfgen_family 0, when using the example code [2].

I'm a bit puzzled, about what these additional three messages are needed for,
since all the information about the rule is in the fourth message [3],
and about how these three messages can be changed, since they are not
built by hand.

[1]

{'attrs': [],
 'header': {'flags': 1,
            'length': 20,
            'pid': 0,
            'sequence_number': 1522814987,
            'type': 16},
 'nfgen_family': 0,
 'res_id': 10,
 'version': 0}
........................................
{'attrs': [],
 'header': {'flags': 5,
            'length': 20,
            'pid': 0,
            'sequence_number': 1522814988,
            'type': 2569},
 'nfgen_family': 2,
 'res_id': 0,
 'version': 0}
........................................
{'attrs': [],
 'header': {'flags': 1,
            'length': 20,
            'pid': 0,
            'sequence_number': 1522814989,
            'type': 17},
 'nfgen_family': 0,
 'res_id': 10,
 'version': 0}
........................................

[2]
 {'attrs': [],
  'header': {'flags': 1,
             'length': 20,
             'pid': 0,
+            'sequence_number': 1522814987,
-            'sequence_number': 0,
             'type': 16},
+ 'nfgen_family': 0,
- 'nfgen_family': 2,
  'res_id': 10,
  'version': 0}
 ........................................

 {'attrs': [],
  'header': {'flags': 5,
             'length': 20,
             'pid': 0,
+            'sequence_number': 1522814988,
-            'sequence_number': 1,
             'type': 2569},
  'nfgen_family': 2,
  'res_id': 0,
  'version': 0}
 ........................................

 {'attrs': [],
  'header': {'flags': 1,
             'length': 20,
             'pid': 0,
+            'sequence_number': 1522814989,
-            'sequence_number': 2,
             'type': 17},
+ 'nfgen_family': 0,
- 'nfgen_family': 2,
  'res_id': 10,
  'version': 0}
 ........................................

[3]

{'attrs': [('NFTA_RULE_TABLE', 'filter'),
           ('NFTA_RULE_CHAIN', 'input'),
           ('NFTA_RULE_EXPRESSIONS', [{'attrs': [('NFTA_EXPR_NAME',
'payload'), ('NFTA_EXPR_DATA', {'attrs': [('NFTA_PAYLOAD_DREG',
'NFT_REG_1'), ('NFTA_PAYLOAD_BASE', 'NFT_PAYLOAD_NETWORK_HEADER'),
('NFTA_PAYLOAD_OFFSET', 9), ('NFTA_PAYLOAD_LEN', 1)]}, 32768)]},
{'attrs': [('NFTA_EXPR_NAME', 'cmp'), ('NFTA_EXPR_DATA', '
\x00\x02\x80\x08\x00\x01\x00\x00\x00\x00\x01\x08\x00\x02\x00\x00\x00\x00\x00\x0c\x00\x03\x80\x05\x00\x01\x00\x06\x00\x00\x00')]},
{'attrs': [('NFTA_EXPR_NAME', 'payload'), ('NFTA_EXPR_DATA', {'attrs':
[('NFTA_PAYLOAD_DREG', 'NFT_REG_1'), ('NFTA_PAYLOAD_BASE',
'NFT_PAYLOAD_TRANSPORT_HEADER'), ('NFTA_PAYLOAD_OFFSET', 2),
('NFTA_PAYLOAD_LEN', 2)]}, 32768)]}, {'attrs': [('NFTA_EXPR_NAME',
'cmp'), ('NFTA_EXPR_DATA', '
\x00\x02\x80\x08\x00\x01\x00\x00\x00\x00\x01\x08\x00\x02\x00\x00\x00\x00\x00\x0c\x00\x03\x80\x06\x00\x01\x00\x00\x16\x00\x00')]},
{'attrs': [('NFTA_EXPR_NAME', 'immediate'), ('NFTA_EXPR_DATA',
'\x1c\x00\x02\x80\x08\x00\x01\x00\x00\x00\x00\x00\x10\x00\x02\x80\x0c\x00\x02\x80\x08\x00\x01\x00\x00\x00\x00\x01')]}],
32768)],
 'header': {'flags': 3077,
            'length': 288,
            'pid': 0,
            'sequence_number': 1522814988,
            'type': 2566},
 'nfgen_family': 10,
 'res_id': 0,
 'version': 0}
