From: Askar Ali Khan <askarali@gmail.com>
Subject: redirecting
Date: Thu, 1 Jul 2004 16:52:15 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e50407010452713ae264@mail.gmail.com>
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
here im again with my simple question :), actually im learning netfilter thingy.
I want if i or someone else type www.microsoft.com on my box (linux,
netfilter) which is part of LAN instead of microsoft.com browrse give
him www.linuxiso.org
im practicing on my box and I will apply rule on this box. My boxes
use another system running (win) as router/gateway

I do know if i want to block microsoft.com or some other sites this
rule is working for me
#iptables -A OUTPUT -d www.microsoft.com -j DROP
but i duno how to redirect the request with iptables thingy,

antony i hope I will hear from you fast :)
im learning lot of things from you :D

