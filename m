From: Tim Dionne <tim@ruffrecordings.com>
Subject: no route to host on port 80
Date: Sun, 04 May 2003 19:56:01 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB5D2C1.5080001@ruffrecordings.com>
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

Hi --

I'm trying to allow outside access to my linux box on port 80.  However,
   when I try to connect (using a web browser, or telnet) the connection
is not created.  When I use telnet and specify port 80 I get a "no route
to host" error.  I've experimented with my firewall by completely
removing all rules from all chains, but the connection can still not be
made.  I can establish connections on all other ports except 80!  Can
anyone help me?

Thanks.



