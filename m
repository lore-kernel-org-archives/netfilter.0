From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: what's this in my ip_conntrack
Date: Wed, 11 Dec 2002 15:55:21 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021211205521.66284.qmail@web14511.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

just curious, i checked /proc/net/ip_conntrack in my gateway computer and found this,

the gateway 192.168.0.1 sends request to all the internal ip (goes on to 192.168.0.254). is it a
network broadcast or what, for what reason ?  .0.1 and .0.3 are alway almost connected to the Lan.


tcp      6 134316 ESTABLISHED src=192.168.0.1 dst=192.168.0.255 sport=42750 dport=80 [UNREPLIED]
src=192.168.0.255 dst=192.168.0.1 sport=80 dport=42750 use=1 
tcp      6 134280 ESTABLISHED src=192.168.0.1 dst=192.168.0.0 sport=42750 dport=80 [UNREPLIED]
src=192.168.0.0 dst=192.168.0.1 sport=80 dport=42750 use=1 
tcp      6 134286 ESTABLISHED src=192.168.0.1 dst=192.168.0.0 sport=42751 dport=80 [UNREPLIED]
src=192.168.0.0 dst=192.168.0.1 sport=80 dport=42751 use=1 
tcp      6 134312 ESTABLISHED src=192.168.0.1 dst=192.168.0.2 sport=42750 dport=80 [UNREPLIED]
src=192.168.0.2 dst=192.168.0.1 sport=80 dport=42750 use=1 
tcp      6 134312 ESTABLISHED src=192.168.0.1 dst=192.168.0.2 sport=42751 dport=80 [UNREPLIED]
src=192.168.0.2 dst=192.168.0.1 sport=80 dport=42751 use=1 
tcp      6 134312 ESTABLISHED src=192.168.0.1 dst=192.168.0.4 sport=42750 dport=80 [UNREPLIED]
src=192.168.0.4 dst=192.168.0.1 sport=80 dport=42750 use=1 
tcp      6 134312 ESTABLISHED src=192.168.0.1 dst=192.168.0.4 sport=42751 dport=80 [UNREPLIED]
src=192.168.0.4 dst=192.168.0.1 sport=80 dport=42751 use=1 
tcp      6 134312 ESTABLISHED src=192.168.0.1 dst=192.168.0.5 sport=42750 dport=80 [UNREPLIED]
src=192.168.0.5 dst=192.168.0.1 sport=80 dport=42750 use=1 

...... 
...... more .. 
tcp      6 134315 ESTABLISHED src=192.168.0.1 dst=192.168.0.254 sport=42750 dport=80 [UNREPLIED]
src=192.168.0.254 dst=192.168.0.1 sport=80 dport=42750 use=1



=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

