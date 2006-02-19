From: Steve Purcell <netfilter@sanityinc.com>
Subject: 2.6.16-rcX: Existing iptables rules not working
Date: Sun, 19 Feb 2006 11:23:48 +0100
Message-ID: <200602191123.48513.netfilter@sanityinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I have a set of iptables rules that have stopped working between 2.6.15 and 
2.6.16-rc[1-4]:

iptables -t nat -A OUTPUT -d 127.0.0.1 -p tcp -m tcp \
         --dport http -j ACCEPT
iptables -t nat -A OUTPUT -d 192.168.0.0/255.255.255.0 -p tcp -m tcp \
         --dport http -j ACCEPT
iptables -t nat -A OUTPUT -d 192.168.1.0/255.255.255.0 -p tcp -m tcp \
         --dport http -j ACCEPT
iptables -t nat -A OUTPUT -m owner -p tcp --gid-owner proxy -m tcp \
         --dport http -j ACCEPT
iptables -t nat -A OUTPUT -p tcp -m tcp \
         --dport http -j REDIRECT --to-ports 3128

The intent is that only the 'proxy' group on the local machine can talk HTTP 
directly to sites outside the named networks, and that connections from all 
other users should be transparently redirected to the squid process at port 
3128 (owned by 'proxy').

These rules have worked nicely for several kernel versions, but not in the 
latest -rc series.  I receive no error messages in the logfiles or when 
executing the iptables commands above, but the redirected connections just 
hang.

I'll be happy to provide any further information that might help diagnose 
the problem, or to find an alternate solution.

Thanks in advance,

-Steve

