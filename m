From: Tom Eastep <teastep@shorewall.net>
Subject: Re: HTTP Port forwarding issues
Date: Mon, 08 Jul 2002 12:56:27 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D29EE6B.6030404@shorewall.net>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net> <3D29EB93.9080109@shorewall.net> <000d01c226b8$eb7b9ce0$6702a8c0@internal.monstersolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Big Daddy <bigdaddy@monster-solutions.net>
Cc: netfilter@lists.samba.org

Big Daddy wrote:
> It worked when I was using a Linksys router. However maybe they have changed
> it since then. Do my rules look fine?
> 

Yes, assuming that $int_http is set correctly and that you have a rule 
that passes --state ESTABLISHED packets in both directions through the 
FORWARD chain.


-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


