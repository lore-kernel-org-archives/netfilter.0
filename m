From: Rakotomandimby Mihamina <mihamina@gulfsat.mg>
Subject: iptables with CLASSIFY
Date: Sat, 29 Aug 2009 11:03:28 +0300
Message-ID: <4A98E0D0.1000603@gulfsat.mg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all
http://www.tummy.com/journals/entries/jafo_20050717_164535
talks about CLASSIFY:
[...]
iptables -A FORWARD -d 10.1.2.3 -j CLASSIFY --set-class 1:2
iptables -A FORWARD -s 10.1.2.3 -j CLASSIFY --set-class 2:2
[...]

http://lists.netfilter.org/pipermail/netfilter-devel/2003-August/012220.html
talks about the patch.

Would you know the status of this? I have to strongly manage bandwidth and
this CLASSIFY target would ease some of the work.


-- 
       Architecte Informatique chez Blueline/Gulfsat:
    Administration Systeme, Recherche & Developpement
                                    +261 34 29 155 34
