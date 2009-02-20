From: Walter.Laub@schwindt.net
Subject: Translate a Network
Date: Fri, 20 Feb 2009 18:12:43 +0100
Message-ID: <OFD33628A9.95036BA7-ONC1257563.005E1FC0-C1257563.005E8C29@schwindt.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

howto translate the network address, like:

let i=1
while [ $i -lt 256 ] ; do
   iptables -t nat -A PREROUTING -d 192.168.1.$i -j DNAT --to-dest 
192.168.99.$i
  i=$i+1
done



