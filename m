From: "Volker Augustin" <volker@multiartstudio.de>
Subject: accept local processes ...
Date: Mon, 26 May 2003 23:33:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c32455$2eb79870$1405a8c0@ew2>
References: <FKEKLDLBAFLHIMEKAJJAIECJCAAA.jherschel@quarry.com>
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
To: netfilter@lists.netfilter.org

hello everybody, one question, why does
a rule like:
    iptables -A INPUT -s 127.0.0.1 -j ACCEPT
give this result?
    ACCEPT     all  --  anywhere             anywhere

im very confused....i want all local proccesses to have access to all
services, this is ok i think and needed for database access to localhost etc
and to all virtual network devices...(i think so)
can anybody explain me this behaviour? i read a lot about iptables, try
around for weeks, everything was fine but this.

thanks in advance
volker





