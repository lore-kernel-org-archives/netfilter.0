From: Wojciech Sobola <Wojciech.Sobola@snt.pl>
Subject: ip_conntrack cleanup
Date: Tue, 21 May 2002 09:33:11 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CE9F837.3040606@snt.pl>
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
To: netfilter@lists.samba.org

Hello,

I've been using ipt 1.2.6a for 2 month's. There's seem to be a problem in /proc/net/ip_conntrack.
I have chains here, that can't be cleared out. Example:
tcp      6 321156 ESTABLISHED src=63.218.135.142 dst=62.xx.x.44 sport=63920 dport=80 [UNREPLIED] src=192.168.101.2 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322238 ESTABLISHED src=63.218.135.142 dst=62.xx.x.45 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.45 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322374 ESTABLISHED src=63.218.135.142 dst=62.xx.x.46 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.46 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322240 ESTABLISHED src=63.218.135.142 dst=62.xx.x.45 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.45 
dst=63.218.135.142 sport=80 dport=63921 use=1
tcp      6 322376 ESTABLISHED src=63.218.135.142 dst=62.xx.x.46 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.46 
dst=63.218.135.142 sport=80 dport=63921 use=1
tcp      6 321842 ESTABLISHED src=63.218.135.142 dst=62.xx.x.47 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.47 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322390 ESTABLISHED src=63.218.135.142 dst=62.xx.x.48 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.48 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 321843 ESTABLISHED src=63.218.135.142 dst=62.xx.x.47 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.47 
dst=63.218.135.142 sport=80 dport=63921 use=1
tcp      6 321930 ESTABLISHED src=63.218.135.142 dst=62.xx.x.49 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.49 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 321930 ESTABLISHED src=63.218.135.142 dst=62.xx.x.49 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.49 
dst=63.218.135.142 sport=80 dport=63921 use=1
tcp      6 321960 ESTABLISHED src=63.218.135.142 dst=62.xx.x.51 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.51 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322328 ESTABLISHED src=63.218.135.142 dst=62.xx.x.52 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.52 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322036 ESTABLISHED src=63.218.135.142 dst=62.xx.x.53 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.53 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322096 ESTABLISHED src=63.218.135.142 dst=62.xx.x.54 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.54 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322036 ESTABLISHED src=63.218.135.142 dst=62.xx.x.53 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.53 
dst=63.218.135.142 sport=80 dport=63921 use=1
tcp      6 321518 ESTABLISHED src=63.218.135.142 dst=62.xx.x.55 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.55 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322290 ESTABLISHED src=63.218.135.142 dst=62.xx.x.56 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.56 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322022 ESTABLISHED src=63.218.135.142 dst=62.xx.x.57 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.57 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322024 ESTABLISHED src=63.218.135.142 dst=62.xx.x.57 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.57 
dst=63.218.135.142 sport=80 dport=63921 use=1
tcp      6 321565 ESTABLISHED src=63.218.135.142 dst=62.xx.x.58 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.58 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 321238 ESTABLISHED src=63.218.135.142 dst=62.xx.x.59 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.59 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 321342 ESTABLISHED src=63.218.135.142 dst=62.xx.x.60 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.60 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 321515 ESTABLISHED src=63.218.135.142 dst=62.xx.x.61 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.61 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 322192 ESTABLISHED src=63.218.135.142 dst=62.xx.x.62 sport=63920 dport=80 [UNREPLIED] src=62.xx.xx.62 
dst=63.218.135.142 sport=80 dport=63920 use=1
tcp      6 321516 ESTABLISHED src=63.218.135.142 dst=62.xx.x.61 sport=63921 dport=80 [UNREPLIED] src=62.xx.xx.61 
dst=63.218.135.142 sport=80 dport=63921 use=1

Such table can stay even 2 or 3 days. If I put DROP into INPUT or PREROUTING it doesn't change. Is this something suspicious?
Maybe there's setting which can be adjusted to stop such behavior? I can say that kernel is patched with freeswan-1.97.
Seems that connection was initiated by 192.168.101.2.

Regards,
-- 
Wojciech Sobola
Unix System Engineer


