From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: NAT and DNS/NTP servers
Date: Fri, 30 Apr 2004 22:52:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409310DE.2020004@isoar.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm observing lost packets when a gateway doing NAT also locally hosts
a server for DNS or NTP.  I believe this the result of the ambiguous
conditions that can exist when routing server-to-server packets coming
into the gateway.

I can avoid it by specifying --to-source ports in a SNAT rule for NTP,
or with DNAT and --to-destination port to force usage of the gateway's
server (which is likely the best solution).  I've not tried this on DNS
yet, but I expect it will solve the problem as well.

Is this a known situation for these protocols (and similar)?  Or am I
barking up the wrong tree?

Thanks.

-- 
Andrew E. Mileski


