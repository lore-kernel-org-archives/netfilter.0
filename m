From: mailinglist@plobe.com
Subject: IPTables routing
Date: Fri, 28 Nov 2003 13:32:38 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35733.141.150.249.168.1070044358.squirrel@mail.plobe.com>
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

I have a question, I would like to know the best way to do something with
IPTables.

I have a network which has a gateway wwith iptables on it.  I want
iptables to send all data bound for a external server (Ex. server.com or
20.20.20.20) to a third server (server_mirror.com).  So iptables needs to
rewrite the header on every packet bound for the intended server
(server.com) so that the packets get routed to the third server
(server_mirror.com).  Also, the third server and person making the request
are making a socket connection that sends data two ways.

--Can I do this with iptables? And if so, how?

--Also, will I have problems with the server responding? And if so, how do
I fix that?

Thanks a lot for any help.  It is greatly appreciated!

Chris

