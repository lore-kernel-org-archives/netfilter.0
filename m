From: jwsacksteder@ramprecision.com
Subject: forwarding/proxying
Date: Tue, 9 Sep 2003 18:09:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <71650A6F73F1D411BE8000805F65E3CB3B35DC@SRV-03>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

With netcat it is possible to proxy arbitrary ip:port destination pairs.
Could this be done with netfilter rules entirely?

As an example, I have a host that listens for incoming tcp connections on
port 110 and I want to forward them to port  5900 on another host
transparently. Obviously ftp and any other multichannel protocols would have
complications, but that's not a problem for my situation. 

