From: mindb0t@mail.ru
Subject: snat --persistent
Date: Tue, 27 Apr 2010 00:17:03 +0600
Message-ID: <1393124438.20100427001703@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I'm using SNAT with --persistent, but I just don't understand
clearly what you ment in its description:
"Gives a client the same source-/destination-address for each connection."

1. What does "client" mean? An IP, process?

2. If I have one server with several IPs.
- Will all my connections go through one IP?
ip1->facebook
ip1->twitter
ip1->something-else.com
- Or for each connection IP will be chosen randomly?
ip3->facebook
ip7->twitter
ip233->something else

