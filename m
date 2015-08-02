From: /dev/rob0 <rob0@gmx.co.uk>
Subject: BIND/TKEY vulnerability (CVE-2015-5477): firewall blocking?
Date: Sun, 2 Aug 2015 08:43:46 -0500
Message-ID: <20150802134346.GI23739@harrier.slackbuilds.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

https://kb.isc.org/article/AA-01272

The most recent BIND vulnerability, CVE-2015-5477, is particularly 
bad, affecting just about every BIND nameserver, regardless of the 
role it serves, and with no possible configuration workaround.  To 
make it worse, a simple exploit has been published.

I saw someone in IRC who claimed to have an iptables rule which 
protects against this bug.  Unfortunately the rule was not shared, 
and I am doubtful that it will work.  Now it would be easily
testable, at least using the published exploit.

Does anyone have a rule to share which you believe should protect 
against this bug & exploit?  Does it also block legitimate TSIG- 
signed queries, or have other side effects?

Thanks.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
