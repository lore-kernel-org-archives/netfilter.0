From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: ICMP Rule Problem
Date: Mon, 2 Feb 2004 22:36:37 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402030636.i136aarB018514@server5.bandwidthco.com>
References: <1075741362.3714.25.camel@dchws.TQMcube.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075741362.3714.25.camel@dchws.TQMcube.com>
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
To: "'David C. Hart'" <dch@TQMcube.com>, 'Iptables Mailing List' <netfilter@lists.netfilter.org>

ICMP Type 0 is an echo reply.  Request (ping) is Type 8. 

-----Original Message-----
From: David C. Hart [mailto:dch@TQMcube.com] 
Sent: Monday, February 02, 2004 9:03 AM
To: Iptables Mailing List
Subject: ICMP Rule Problem

Should this not reject echo requests?

-A INPUT -p icmp -m icmp --icmp-type 0 -j REJECT --reject-with
icmp-net-prohibited

It doesn't seem to work.

                               ---------
            Quality Management - A Commitment to Excellence



