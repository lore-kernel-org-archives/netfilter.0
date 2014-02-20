From: "Johan" <johan.grahn@kolumbus.fi>
Subject: IPTABLES Logging and Forwarding problem
Date: Thu, 20 Feb 2014 21:30:40 +0200
Message-ID: <000001cf2e72$3d880eb0$b8982c10$@kolumbus.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: fi
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I was trying to fowards some TCP traffic to port 8080 (tomcat) with the
following rule:

# iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables: No chain/target/match by that name.

I also encountered the same problem when attempting to create logging
(simple example, I removed all the params and I do have a chain called
LOGGING, so it is the LOG target that is missing):
# iptables -A LOGGING -j LOG
iptables: No chain/target/match by that name.

My personal guess is that I'm missing some modules or they are disabled. I
have been searching for help in forums and such to no avail, so it was time
to try the official list. 
I'm running CentOS release 6.5 minimal.

R
Johan

