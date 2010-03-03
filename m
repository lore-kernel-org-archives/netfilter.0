From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: How does netfilter decide which in/out-interface a packet has
Date: Wed, 03 Mar 2010 16:54:22 +0100
Message-ID: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi.

How does netfilter decide which in/out-interface a packet has? I mean  
the following:
Image I have a host with the following interfaces and addresses:
lo: 127.x.x.x and :1/128
eth0: 88.88.88.88
99.99.99.99 is a remote address (packets come in via eth0)

Now consider the following cases (source --> destination):
"internal traffic":
127.x.x.x   --> 127.x.x.x     => quite clear, in=lo out=lo
127.x.x.x   --> 88.88.88.88   => in=??? out=???
88.88.88.88 --> 88.88.88.88   => in=??? out=???
88.88.88.88 --> 127.x.x.x     => in=??? out=???

"incoming traffic (from remote):
99.99.99.99 --> 127.x.x.x     => is that possible at all? how would  
the in=/out= be?
99.99.99.99 --> 88.88.88.88   => quite clear, in=eth0 out=n/a

"outgoing traffic (to remote):
127.x.x.x --> 99.99.99.99     => is that possible at all? how would  
the in=/out= be?
88.88.88.88 --> 99.99.99.99   => quite clear, in=n/a out=eth0


Thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

