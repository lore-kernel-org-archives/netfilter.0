From: gvt_lnx@gmx.net
Subject: Nat OUTPUT chain
Date: Sun, 2 Jun 2002 15:42:52 +0200 (MEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20747.1023025372@www58.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.samba.org, netfilter@lists.samba.org

Hi friends, I'am reading some howto and I found that OUTPUT chain in NAT
table is broken...? that's true?

Could I write a rule like this:

iptables -t nat -A OUTPUT -d x.x.x.x -j DNAT --to-destination y.y.y.y

Thanks in advance.
Geffrey

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net


