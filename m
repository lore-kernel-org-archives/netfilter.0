From: "Gabor Z. Papp" <gzp@papp.hu>
Subject: Re: iptables1.4.1.1 no iptables
Date: Thu, 19 Jun 2008 09:37:54 +0200
Message-ID: <x6fxr9an8t@gzp>
References: <66c5208e0806182020x5465cfb8s6dc73a156259a7a3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michael <mteicher@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

* michael <mteicher@gmail.com>:

| On linux 2.4.34
| ran configure && make && make install
| Everything looks good but I cannot see where iptables was installed.
| The only new file I can see installed is /usr/local/bin/iptables-xml ,
| /usr/local/libexec/xtables (no files in there), and several man pages
| in /usr/local/share/man/man8.

Should be local problem, because make install works here with
2.4.36.6, and its LFS.
