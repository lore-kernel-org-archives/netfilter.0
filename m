From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: DNAT + user defined chains
Date: Fri, 05 Mar 2004 14:15:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078514111.2057.4.camel@localhost>
References: <20040305170028.GA7730@palus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040305170028.GA7730@palus>
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
To: Jan Kanty Palus <atler@poczta.onet.pl>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-03-05 at 12:00, Jan Kanty Palus wrote:
> My firewall configuration consist of many rules which redirect some ports
> on my server to particular hosts in lan. I wanted to reduce them so I tried
> to do something like this:
> 
> iptables -t nat -N new
> iptables -t -A PREROUTING -i ethX -p tcp --dport <port>:<port> -j new
> 
> and in chain 'new' redirect port to right machine. The problem is that in 
> chain 'new' i have no option '--to-destination'. Is it possible to do 
> this or where can i find some info about it?

Hmmm . . . I just tried creating such a chain and adding a bogus DNAT
rule to it and it worked fine.  I haven't tested it with real traffic
but I assume you are getting some kind of error when you try to add a
rule.  What error are you getting? Are you remembering the preface the
-A or -I with -t nat?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


