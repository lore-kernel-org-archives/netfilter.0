From: Roberto Nibali <ratz@tac.ch>
Subject: Re: Iptables Log - session Log
Date: Mon, 16 Dec 2002 12:04:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFDB331.4040101@tac.ch>
References: <10887.1039682956@www54.gmx.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?ISO-8859-1?Q?Jens_K=FChlberg?= <jn_k@gmx.de>
Cc: netfilter@lists.netfilter.org

> I looking for a tool, witch can analyse iptales logs and show me only
> connections-session in realtime and not the complete IP-traffic.

Define 'realtime' in the context of logging filtered traffic flows. I hear it 
everywhere but people mostly seem to have a strange view about that, especially 
when it comes to IDS.

I presume that you'd like to log:

o session start packet (entering conntrack table with its own timer)
o session end packet (lifetime defined through TSM of the conntrack core)
o session time (endlife packet time - packet entering time)
o session stats
   - total amount of bytes per session
   - total amount of packets per session
   - whatever conntrack has to give us and is interesting ;)

If so, in the beginning of next year (probably February) I will release a new 
target for netfilter called SLOG, which stands for session log. It was done 
exactly for this purpose and because logging anything else then sessions in most 
of the cases doesn't make too much sense (we have IDS doing that for example).

I need to rework and fix some issues of the initial work that has been done by 
Roman Hoog Antink as a contract work for our company in conjunction with his 
semester thesis at uni. An outstanding thing for example is the usage of 
ctnetlink, which still seems to have quite a few rough edges.

Best regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


