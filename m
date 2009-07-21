From: Fabio Marcone <fabio.marcone@duet.it>
Subject: tc and traffic established,related
Date: Tue, 21 Jul 2009 17:13:24 +0200
Message-ID: <4A65DB14.2000602@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!

I'm studying traffic shaping and I have some doubts...

I have a linux router and I mark packets from lan to wan and I use a tc 
class to limit datarate (selecting packets by mark).
but how can I recognize answer packets? How can I know is a packet is 
about a connection previously established?

If I succeed I can limit upload and download rate of a particular 
connection...

Thanks in advance,
Fabio
