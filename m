From: Muneyuki KAWATANI <kawatani.muneyuki@lab.ntt.co.jp>
Subject: Why NFQUEUE doesn't use source port number on hashing.
Date: Tue, 7 Nov 2017 19:28:43 +0900
Message-ID: <8816aa27-3520-f822-1a05-b2372c226be2@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

  Hi, all.

  I have a question on NFQUEUE's --queue-balance option.

  Current implementaion of --queue-balance doesn't balance
well in some environments, because the hash value is
calculated only using saddr, daddr and protocol in the
ip-header.

  In some environment, these hash parameters are not
distributed well (ie. An environment consists of 1-server
and a few clients).

  My question is why NFQUEUE doesn't use source port
number as hash parameter to make it balance well?
  If source port number is used besides saddr, daddr
and porotocol, packets of a tcp-flow are sent to the
queue.
  I know that, kernel's flow based ECMP also uses
source and dest port number after 4.12.

  Give me some hints. Thanks.

