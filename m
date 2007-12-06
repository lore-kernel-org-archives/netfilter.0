From: Neal Becker <ndbecker2@gmail.com>
Subject: policy based routing question
Date: Wed, 05 Dec 2007 21:19:19 -0500
Message-ID: <fj7m77$n14$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm interested in implementing policy based routing on a system with
multiple interfaces.  I'd like to use some kind of classifier to determine
the type of traffic associated with a packet.  I know iptables/mark + ip
route can be used to classify packets by port #, but that isn't always
sufficient.

I wonder if anyone has implemented anything like this and can give me any
advice?

