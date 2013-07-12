From: Die Optimisten <inform@die-optimisten.net>
Subject: iptables Qu2: how to specify !dst:port
Date: Fri, 12 Jul 2013 14:06:56 +0200
Message-ID: <51DFF160.1050607@die-optimisten.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi again!

Do I get a loop if I
iptables -t nat -D PREROUTING  -p tcp -d 0.0.0.0:443  -j DNAT
--to-destination 127.0.0.1:443
(if my proxy would be at the same port 443) ?

thanks again,
Andrew

Mail: inform  <AT>              ## Newline just against mailfiltering-robots
    die-optimisten <DOT> net

