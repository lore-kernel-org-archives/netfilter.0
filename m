From: "Jeffrey Glass" <Jeffrey.Glass@fox.com>
Subject: kernel warning NAT: no longer support implicit source local NAT
Date: Mon, 29 Oct 2007 09:45:46 -0700
Message-ID: <63FE92A65648AC4B9395047CA5255E1A0163BDCE@fegplmsexmb10.ffe.foxeg.com>
References: <008401c81a46$8adab100$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <008401c81a46$8adab100$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Everyone,

Starting with kernel 2.6.11 we started getting this kernel warning:

kernel: NAT: no longer support implicit source local NAT
kernel: NAT: packet src 10.92.1.200 -> dst 10.9.0.2

We have some special rules for routing packets (DNAT) and based on the
error message I would say that we are not explicitly defining something
that we should for future compatibility.

Does anyone have any insight on why "implicit source local NAT" is not
going to be supported and what a typical "source local NAT" definition
would look like?

Thanks.

Richard Glass

