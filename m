From: leolistas@solucoesip.net
Subject: question on mdev patch
Date: Mon, 20 Jan 2003 07:32:27 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043058747.3e2bd03b26b6f@www.solucoesip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



    Hello Guys,

    I got some question about mdev netfilter patch. I've tried to contact 
its author ( Jay ) but message couldnt be delivered, seems some DNS 
problems on his domain. So, here it is ... hope Jay subscribes this 
mailing with another address :)

    And if some other persons uses mdev patch and could give me some 
advices too, I'll be thankful.

    Sincerily,
    Leonardo Rodrigues

-------

    Hi Jay,

    I'm trying to use your mdev patch posted on netfilter mailing list ( =
http://marc.theaimsgroup.com/?l=3Dnetfilter&m=3D103242357315342&w=3D2 ). =
It seems to work, but I'm having some problems with it and I'd your =
opinion about that :)

    Let's suppose I have this set of rules on FORWARD chain:

-A FORWARD -m mdev --i eth0:eth4 --o eth1:eth2 -j ACCEPT
-A FORWARD -m mdev --i eth0:eth4 --o eth3 -j DROP

    Well ....... what I want is:
1st rule: allow all traffic to flow from eth0-4 to eth1-2
1nd rule: deny ALL traffic from eth0-4 to eth3

    It's not working as desired. Seems that ALL traffic from eth0-4 is =
getting ACCEPTED on first rule because of the --i option, no matter what =
the --o is.

    As a workaround, I've build these rules:

-A FORWARD -m mdev --i eth0:eth4 -o eth1 -j ACCEPT
-A FORWARD -m mdev --i eth0:eth4 -o eth2 -j ACCEPT
-A FORWARD -m mdev --i eth0:eth4 -o eth3 -j DROP

    ( note I've used single -o not --o . These rules works as expected )

    Question: do your patch handle the situation where --i AND --o are =
specified ? Seems that if I specify ONLY --i OR --o your patch works =
fine, but specifying both seems, at least on my tests, to not work as =
expected. Would you mind in check this ?

    And thanks for mdev patch, it's a very great idea and, at least for =
me, will be very useful :)

    Sincerily,
    Leonardo Rodrigues



