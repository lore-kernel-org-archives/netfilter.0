From: asclark <asclark@lanl.gov>
Subject: Total data limiting
Date: Fri, 17 Jan 2003 09:59:20 -0700 (MST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.40.0301170955110.5759-100000@wolfman.lanl.gov>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi.

I was wondering if anyone had ideas about this.
I am interested in doing the following:

Node A connects to Node B through an iptables/netfilter box on port 80.

The netfilter is providing NAT services to Node B and portforwarding.

Node A then downloads X amount of data from node B.

When X amount of data reaches a certain limit, say 50mb then the
netfilter box drops all further connections from Node A for a specified
period of time, say 12 hours.

Is this possible with netfilter? would this be something better suited to
Squid or even perhapse some of the ip and traffic shaping stuff?

Any advice or pointers would be greatly appreciated.

A.

??????????????????????????????????
?      Anthony S. Clark          ?
?      asclark@lanl.gov          ?
? Los Alamos National Laboratory ?
? 0 1 1 3 5 8 13 21 34 55 89 144 ?
??????????????????????????????????


