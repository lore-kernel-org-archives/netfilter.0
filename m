From: "Hal Moroff" <hmoroff@teltone.com>
Subject: question about connection tracking tcp timeout values
Date: Wed, 7 Nov 2007 16:43:43 -0800
Message-ID: <1C795E2FCD154E46979DDDD5374B5ABE01B99B7B@TTMAIL2.teltone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm working on a router application.  The application monitors
activity on the router, and in certain cases it must terminate
a TCP connection.  It does this by watching sequence numbers
and sending RST to both participants of the connection that it
wants to cut.  I look in /proc/net/ip_conntrack for information
about the connection (source port) before I cut it.

My problem is that entries in ip_conntrack persist for a short
time after I cut the connection.  If another connection from the
same client is opened, and if I must cut that one as well then I
may find both the new connection and the obsolete one in ip_conntrack.
This causes my application fits, and I can't find any way to distinguish
the two sessions.

The solution I've found is to set ip_conntrack_tcp_timeout_wait_close
and ip_conntrack_tcp_timeout_wait_close down to 1.

I have 2 questions:
  1. what's the difference between these 2 parameters
  2. is there going to be a downside to me setting these to 1?
