From: Ed W <lists@wildgooses.com>
Subject: New/Updated L7 netfilter  option - nDPI
Date: Wed, 24 Oct 2012 23:53:47 +0100
Message-ID: <5088717B.6080300@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, ntop-dev@unipi.it
Cc: "G. Elian Gidoni" <geg@gnu.org>

Hi all.  There is an interesting project that was called opendpi 
(originally by ipoque GmbH) and recently been forked and maintained by 
the ntop guys under the nDPI label.  It offers a new and currently 
maintained layer 7 (L7) packet identification library.  It could 
definitely benefit from more eyes and development effort, but at present 
it gives much better breakdown of traffic for ntop

There is a netfilter library, originally by Elian Gidoni, that I have 
updated to use the nDPI fork

     https://github.com/ewildgoose/ndpi-netfilter



The practical upshot is that you can do stuff like:

     iptables -I FORWARD -m opendpi --WinUpdate -j LOG
or
     iptables -I FORWARD -m opendpi --skype -j REJECT

In theory you can also filter Facebook, Twitter, etc, but I concede that 
doesn't seem to work as expected right now...

Another of the clever things that nDPI does is to try and classify SSL 
traffic by examining the name on the cert.  A technique that seems 
likely to allow crude identification of significant traffic.


We could benefit from more eyes on this, both the netfilter module and 
the nDPI library

Thanks for your feedback

Ed W
