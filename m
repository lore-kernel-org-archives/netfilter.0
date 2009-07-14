From: Fabio Marcone <fabio.marcone@duet.it>
Subject: tc problems
Date: Tue, 14 Jul 2009 16:44:11 +0200
Message-ID: <4A5C99BB.4080405@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
I have a problem setting traffic shaping rules for routing packets.

scenario:
I have a linux router and two workstation that generate traffic to web 
server in Internet.
I need to limit:
  - w1 to 100Kb/s in upload and 1MB/s in download
  - w2 to 200 Kb/s in upload and 2 MB/s in download

I know that I have to set upload limit on wan interface and download 
limit on lan interface.
The problem is in download: how can I setup tc filter to recognize 
response packets to w1 and to w2? only by ip? and if I use dhcp? Does 
exist a way to use mac address?

Thanks in advance,
Fabio
