From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] libnftnl 1.2.6 release
Date: Mon, 17 Jul 2023 10:09:09 +0200 (CEST)
Message-ID: <36852014-p9pp-srp2-pn24-orr4385p70qo@vanv.qr>
References: <ZK2KUlzZzlQ8/mKa@calendula>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <ZK2KUlzZzlQ8/mKa@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


On Tuesday 2023-07-11 18:58, Pablo Neira Ayuso wrote:
>The Netfilter project proudly presents:
>        libnftnl 1.2.6

Something is off here.
With 1.2.5 I had:

/usr/lib/python3.11/site-packages/nftables
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg-info
/usr/lib/python3.11/site-packages/nftables/__init__.py
/usr/lib/python3.11/site-packages/nftables/__pycache__
/usr/lib/python3.11/site-packages/nftables/__pycache__/__init__.cpython-311.pyc
/usr/lib/python3.11/site-packages/nftables/__pycache__/nftables.cpython-311.pyc
/usr/lib/python3.11/site-packages/nftables/nftables.py
/usr/lib/python3.11/site-packages/nftables/schema.json

With 1.2.6 I get:

/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/EGG-INFO
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/EGG-INFO/PKG-INFO
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/EGG-INFO/SOURCES.txt
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/EGG-INFO/dependency_links.txt
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/EGG-INFO/not-zip-safe
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/EGG-INFO/top_level.txt
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/__init__.py
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/__pycache__
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/__pycache__/__init__.cpython-311.pyc
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/__pycache__/nftables.cpython-311.pyc
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/nftables.py
/usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/schema.json

And then python3 -c 'import nftables' no longer wants to do anything with it:

Traceback (most recent call last):
  File "<string>", line 1, in <module>
ModuleNotFoundError: No module named 'nftables'

Looking at how other modules are laid out, I find e.g.

[...]
/usr/lib/python3.11/site-packages/pycparser/plyparser.py
/usr/lib/python3.11/site-packages/pycparser/yacctab.py
/usr/lib/python3.11/site-packages/pycparser-2.21-py3.11.egg-info
/usr/lib/python3.11/site-packages/pycparser-2.21-py3.11.egg-info/PKG-INFO
/usr/lib/python3.11/site-packages/pycparser-2.21-py3.11.egg-info/SOURCES.txt
[...]

So there is one directory level too much.
