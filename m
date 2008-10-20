From: Morgan Read <mstuff@read.org.nz>
Subject: IP redirect?
Date: Mon, 20 Oct 2008 22:34:13 +1300
Message-ID: <48FC5095.5040202@read.org.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Folks

To redirect lan traffic addressed to the wan IP (e.g.) 123.456.789.012
to the lan IP address 192.168.1.123, I'm using the following:
$ iptables -t nat -I PREROUTING 1 -d 123.456.789.012 -j DNAT
--to-destination 192.168.1.123

But, all internal traffic seems to get lost - 18 months ago when I last
did this, traffic to 123.456.789.012 seemed to hit 192.168.1.123 and
come back without problem.

I've added the following, with some interesting results:
$ iptables -t nat -I POSTROUTING 1 -s 192.168.1.40 -j SNAT --to-source
58.28.20.69

Now, the traffic from the specific lan IP 192.168.1.123 does seem to be
redirected correctly and come back to itself.  But still, all other lan
traffic seems to get lost.

Any ideas what's happening, where I'm getting lost?

Regards,
Morgan.
-- 
Getting errors: "There are problems with the signature" (or similar)?
Update your system by installing certificates from CAcert Inc, see here:
http://wiki.cacert.org/wiki/BrowserClients?#head-259758ec5ba51c5205cfb179cf60e0b54d9e378b
Or, if Internet Explorer is your default browser, simply click this link:
http://www.cacert.org/index.php?id=17

Morgan Read
NEW ZEALAND
<mailto:mstuffATreadDOTorgDOTnz>

fedora & freedom; fact || fiction?
http://fedoraproject.org/wiki/Overview
get freed-ora!
http://www.fsfla.org/svnwiki/selibre/linux-libre/freed-ora
