From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: REDIRCT vs. DNAT...
Date: Fri, 22 Apr 2005 17:12:41 -0500
Message-ID: <426976D9.2010009@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Are there any merits to using REDIRECT over (or under) DNAT when redirecting traffic back to the box that is doing the redirecting?  Reference Alejandro Villarroel's post (and thread) at https://lists.netfilter.org/pipermail/netfilter/2005-April/059942.html.

I responded with an email stating to REDIRECT the traffic only moments after Jason Opperisano responded stating to DNAT the traffic.  I'm just curious if any one knows of any performance benefits / penalties for using REDIRECT vs. DNAT.



Grant. . . .

