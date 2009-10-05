From: Fabio Marcone <fabio.marcone@duet.it>
Subject: tc and CONNMARK
Date: Mon, 05 Oct 2009 11:32:30 +0200
Message-ID: <4AC9BD2E.301@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!
I'm building a firewall/traffic shaper using tc and connmark but I note 
a strange behaviour.

Configuration:
eth0 - lan interface - rate 600kbit/s connection with mark X (download)
eth1 - wan interface - rate 600kbit/s connection with mark X (upload)

Starting a single connection (upload or download) traffic is limited 
correctly but if I start two connection (one in upload and the other in 
download) I note that the one in upload runs correctly (how in the 
previous test) but the one in download stalls and then send some packets 
and then stalls alternatively.

I don't understand why!

always (and only) the download connection has this behaviour.


two connection have the same mark (in netfilter table), is it a problem 
for the shaper?
also I think about ack packets but they have a very short size (66 
bytes) so I believe they are not the cause for this problem.

thanks in advance,
Fabio Marcone
