From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Subject: question regarding netfilter and Kernel 2.6
Date: Fri, 31 Oct 2003 22:37:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c3a018$c3af4a10$8b00000a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter ML <netfilter@lists.netfilter.org>


    Hello Guys,

    I'm working on a presentation about netfilter/iptables and I could not
find interesting text regarding netfilter/iptables/kernel 2.6 compatibility
with netfilter/iptables/kernel v2.4. I'd like you to help me answering some
simple questions and/or pointing me some URLs where I can find something
regarding this subject.

    Well, I'm trying to figure out:

    1) will kernel 2.6 iptables/netfilter rules be compatible with
iptables/netfilter kernel 2.4 rules ? (i think the answer is obvious, yes,
no matter if internally netfilter will chagne a lot)
    2) will iptables/netfilter v2.4 rules be 100% compatible with
iptables/netfilter v2.6 rules ?
    3) if NOT 100%, how compatible it will be: a) NOT compatible, you'll
have to rewrite rules (ipchains and iptables for example); b) compatible BUT
you'll have to rewrite lots of rules; c) VERY compatible, you'll have to
change some minor details

    Please note tham I'm not interested (for this presentation) on how
netfilter v2.6 has changed internally. I've read a lot about all the work
done on statefull inspecting and failover solutions. I'm just worried about
the iptables rules.

    Can you help me and/or sending me some URLs where I can look further on
this subject ?

    Thanks,
    Leonardo Rodrigues


