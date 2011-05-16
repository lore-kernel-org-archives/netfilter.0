From: Ryan Gelobter <r.gelobter@limestonenetworks.com>
Subject: Blocking UDP Fragments
Date: Mon, 16 May 2011 15:42:29 -0500
Message-ID: <216636937ABE004E8CD94DDB2AD8BAA501AE75C2BE63@lsnexchange.limestonenetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <'netfilter@vger.kernel.org'>

Can anyone provide me with some help in creating an iptables rule to drop packets such as the ones below? I've modified the amount of XXX in the packet contents since they are normally much larger however they do vary in size. I've come to realize the -f flag does not work for this type of packet and am confused by examples that explain matching by using the u32 module/"more fragments" flag.

U 0.0.0.0 -> 0.0.0.0 +39221@5920:1480
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#
U 0.0.0.0-> 0.0.0.0 +39221@7400:800
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

U 0.0.0.0-> 0.0.0.0 +39221@2960:1480
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

Thanks,
Ryan G
