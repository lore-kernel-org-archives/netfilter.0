From: Andreas Herz <andi@geekosphere.org>
Subject: adding more options for ipset
Date: Mon, 16 Apr 2012 13:27:58 +0200
Message-ID: <20120416112758.GD29947@sweethome.fritz.box>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i'm playing around with ipset and i'm adding two new options. The one is
the possibility to add a timeout to a existing timeout value and the
other one is to compare the timeouts of two sets. The second also gets a
threshold value to return true or false for a match.

I got it working for several testcases, but still not finished. I'm just
asking if there is any interest in these featueres. I already wrote the
first idea to Josef and he did put it on the feature request list.

The new options look like this:

1. Addition example on the Target:

iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SET
--add-set firstset src,src --timeout 4000 --exist --addition

with this option the existing timeout for this source in the "firstset"
set is now 4000 more seconds long. The "--addition" flag forces ipset to
increase the timeout instead of replacing it.

2. Compare example of the match:

iptables -A INPUT -m set --compare-set firstset src,src secondsec
--threshold 1000

So the match is true if the source is in both sets and the timeout
difference between the two entries is greater then 1000 seconds.

So if there is anyone interested in this i will publish the sourcecode
here, although it's far from perfect and i'm totally new to this :)
Nevertheless i will work on this and i will also test around with ipset
more.

Greetings
-- 
Andreas Herz
