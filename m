From: Jason Cosby <sky_jason@yahoo.com>
Subject: MAC Hash
Date: Thu, 25 Sep 2008 15:18:06 -0700 (PDT)
Message-ID: <604608.25377.qm@web37308.mail.mud.yahoo.com>
Reply-To: sky_jason@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

All,

I have the following running on our server:

for m in xx:xx:xx:xx:xx:xx...about 75 MACs
do
  iptables -t mangle -A PREROUTING -i eth1 -m mac --mac-source $m -j ACCEPT
done

iptables -t mangle -A PREROUTING -i eth1 DROP

iptables -t mangle -A PREROUTING -i eth1 -m iprange ! --src-range \
   192.168.1.1-192.168.1.74 -j DROP

and encountered a noticable slowdown when I incorporated the above. Can anyone offer suggestions as to how to speed this up? I know that hash tables are out there, but I am not clear on their use. 

Thanks,
Jason
