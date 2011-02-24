From: jobhunts02@aol.com
Subject: Timeout for TCP connections
Date: Wed, 23 Feb 2011 16:22:50 -0800
Message-ID: <A7B48E1B-130E-4904-9E8F-22AA42418720@aol.com>
Mime-Version: 1.0 (iPhone Mail 8C148)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am seeing it take several minutes for TCP connections to be closed after data has stopped flowing.  I saw the same behavior with UDP connections and was able to shorten the time by setting ip_conntrack_udp_timeout and ip_conntrack_udp_timeout_stream to 5.

I have tried modifying the TCP variables in /proc/sys/net/ipv4/netfilter and nothing seems to lower the time for TCP connections to close.

Any suggestions how to make TCP connections close faster?