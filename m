From: "Farshad" <farshadas@excite.com>
Subject: the right way to grab UDPs
Date: Sun, 13 Apr 2003 17:25:18 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030413212518.073493E10@xmxpita.excite.com>
Reply-To: farshadas@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.netfilter.org


Hi,

 I want to intercept UDP packets from a specific IP when they are 
going to be forwarded though a machine. There are basically two ways
to do this using iptables:

- sending packets to the userspace by libipq and then reinjecting them
- opening a dummy socket, making packets forwarded to the dummy socket
  instead, then resending them over another dummy socket, setting the
  iptables to spoof their source IP to the original IP of the sender

 What do you think of these ways? Thanks for any comments.

      ciao,
      Farshad





_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!

