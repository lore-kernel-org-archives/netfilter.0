From: netfilter@buglecreek.com
Subject: Change source port
Date: Mon, 26 Nov 2007 15:19:58 -0700
Message-ID: <1196115598.27273.1223346377@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We have a situation where our nameservers are contacting an upstream
nameserver to resolve a name using a source port 53 and a destination
port 53.  We have found out that the upstream name server will not honor
our request since the source port from our nameservers is 53.  Until we
can resolve this with the upstream admin, we would like
change the source port from our name server to a high numbered port
using iptables when it tries to contact the upstream nameserver.  We can
not seem to put together a rule to do this.  Is it even possible?  
