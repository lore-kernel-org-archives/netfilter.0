From: <sschlesi@chello.at>
Subject: how to stop broadcasts using iptables
Date: Tue, 27 Apr 2004 14:35:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040427123529.HVYI23570.viefep19-int.chello.at@localhost>
Reply-To: sschlesi@chello.at
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

hi, 

I'm trying to stop broadcasts getting forwarded, but I'm  not sure how to do 
this. i read that *.255 - which are afaik broadcast addresses - doesnt 
guarantie that its a broadcast. then i read that its possible by matching the 
mac address, because broadcast will have ff:ff:ff:ff:ff:ff . but I'm not sure 
if that's all  nonsense.

maybe someone here could help me.

~sts


