From: Jay <jeno@finali.com>
Subject: MARK Locally Generated Packets
Date: Thu, 19 Jun 2003 12:11:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030619121130.H26250@finali.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

     I'm trying to mark locally generated packets to be able to re-route
HTTP(S) requets out a different gateway. Similar to a transparent proxy,
with the exception that I want only traffic generated from this box to
get marked and re-routed. I've setup everything correctly according to
the many documents I've found, and I can manually use ip rules to get the
actions I want, I'm jut not getting a mark recognized by the ip rules.
Anybody have any ideas on how to get iptables to mark locally generated
packets?

-= Jay =-


