From: Bernhard Bock <mailinglists@bock.nu>
Subject: conntrack performance test results in INVALID packets
Date: Fri, 18 Jul 2008 11:39:41 +0200
Message-ID: <488064DD.5080509@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm performance testing a firewall with netfilter connection tracking 
based on Fedora Core 9 and I'm having some problems.

Every now and then the firewall drops packets in the state "INVALID".

The test setup is as follows:
- I'm using plain HTTP as test traffic, nothing else.
- Client is an ApacheBench (ab) client.
- Server is Apache.
- HTTP connection keepalive with a maximum lifetime of
   30 seconds per TCP session.

With 100 parallel TCP connections, it works. With 1000 parallel TCP 
connections, I start seeing INVALID packets.

Can somebody point me in a direction where to search for the root cause?

best regards
Bernhard

