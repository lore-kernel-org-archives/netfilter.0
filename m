From: Christian Seberino <seberino@spawar.navy.mil>
Subject: what is conntrack & how ipchains works without it?!?
Date: Wed, 10 Jul 2002 09:50:44 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710095044.A28060@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Is conntrack the "memory" of iptables that allows
it to make filtering decisions based on history
of network traffic in and out of PC???

Imagine a private LAN PC trying to do DNS thru
an SSH-only DNAT/SNAT firewall... it is the conntrack
that allows ESTABLISHED/RELATED packets to bypass
the rules allowing DNS to work right?

How can *ipchains* do DNS thru an SSH-only ipchains
firewall since it does *not* have conntrack!!!
It must have some other mechanism right? What?

Chris
-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
53560 Hull Street
San Diego, CA 92152-5001
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-2836
Email: seberino@spawar.navy.mil
_______________________________________

