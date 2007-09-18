From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: Re: Communication between internal hosts, using external addresses
Date: Tue, 18 Sep 2007 22:46:50 +0200
Message-ID: <m3abrjn1l1.fsf@ursa.amorsen.dk>
References: <loom.20070918T180920-169@post.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <http://lists.netfilter.org/pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>>>>> "BW" == Bryan Wright <bryan@virginia.edu> writes:

BW>      Unfortunately, it doesn't. Watching with wireshark, it
BW> appears that the hosts fail to set up a TCP session because of
BW> confusion about addresses. Traffic arriving at "B" appears to come
BW> from "A.internal", so "B" answers directly to this, causing the
BW> reply arriving at "A" to appear to be from "B.internal", which
BW> isn't what "A" was looking for.

I believe the solution is referred to as "hairpinning". Basically, you
add iptables -t nat -A POSTROUTING -i $LAN -o $LAN -j SNAT ... (or
MASQUERADE).

All the traffic then goes to the firewall and back, even for internal
traffic. It's a waste of firewall capacity and network bandwidth, of
course.


/Benny



