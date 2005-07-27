From: Nagy Zoltan <kirk@elte.hu>
Subject: Re: SSH Brute Force not working (any longer)
Date: Wed, 27 Jul 2005 20:30:22 +0159
Message-ID: <42E7D2D4.9040606@elte.hu>
References: <5d2f37910507270936737ad3d1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f37910507270936737ad3d1@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "curby ." <curby.public@gmail.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

hi

> Hopefully it's a really simple typo or something, though with all the
> variations I've tried, I'm starting to doubt that simple explanation.
> What might the problem be?  Thanks!

i've read 1-3 the files, i think your problem is a skip of the "update" (my english is really bad ;)
because your --update lines have other condition like:seconds and rate
the attacking machine when it begins to send those packets, recent knows nothing about him, it will be enlist with a --set match
and then you don't update it's record with a single --update, so it can't reach the hitcount :)

i've wrote another one of these recent based flood protectors ;)
i use this to prevent syn scans/icmp floods to go out from our lan or come in - this is a sort of "make the days of the conntrack table a bit easier, by droping the shit" :)
a line like: iptables -t raw -A PREROUTING -i $lan_if -j OUT_CHECK should prevent scans from your lan to go out.


message-u       "OUT_CHECK..."
        ipt="$iptables -t raw -A OUT_CHECK"
        $ipt    -p icmp                         -j OUT_F_PRO
        $ipt    -p tcp  --tcp-flags ALL SYN     -j OUT_F_PRO
        $ipt    -j ACCEPT

message-u       "OUT_F_PRO..."
        ipt="$iptables -t raw -A OUT_F_PRO"
        $ipt    -m recent --name out --rcheck   -j OUT_F_CHK
        $ipt    -m recent --name out --set      -j ACCEPT

message-u       "OUT_F_CHK..."
        ipt="$iptables -t raw -A OUT_F_CHK"
        $ipt -m recent --name out --rcheck --seconds 3 --hitcount 15    -j OUT_XDROP		
	# this is the currently used version, it forces that a client can't open more than 5 new tcp connections/sec and icmp
#       $ipt -m recent --name out --update --seconds 3 --hitcount 15    -j OUT_XDROP		
	# this version is very aggressive, it eats http traffic too ;) because of the many images/etc
	# it can be combined with small ipset, with ports like 22,135,139 that will prevent ssh bf too ;)
        $ipt -m recent --name out --update --seconds 30                 -j ACCEPT
        $ipt -m recent --name out --remove                              -j ACCEPT

message-u       "OUT_XDROP..."
        ipt="$iptables -t raw -A OUT_XDROP"
        $ipt    -s $e_n -m account --aname xdrop_e --aaddr $e_n -j DROP
        $ipt    -s $b_n -m account --aname xdrop_b --aaddr $b_n -j DROP
        #       miracle situation...in this case: flood klogd ;)
        $ipt    -m limit --limit 1/sec  -j LOG --log-prefix raw/OUT_XDROP
        $ipt                            -j DROP


kirk

