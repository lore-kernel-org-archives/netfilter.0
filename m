From: gui <whereisgui@gmail.com>
Subject: Protecting multiple webservers
Date: Tue, 11 Jan 2005 17:01:29 -0800
Message-ID: <48be50bb05011117016487055e@mail.gmail.com>
Reply-To: gui <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I work as a computer programmer for a small university and I was asked
to set up a firewall to protect three Apache web servers.  Each server
runs on its own machine, each server has its own name, public IP
address and they all listen on port 80.

After reading a few howto's, I came up with the following iptables
rules (I won't list all of them):

#www.server1.edu
-A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 80 -j DNAT --to 192.168.0.2:80

#www.server2.edu
-A PREROUTING -i eth0 -p tcp -d X.X.X.103 --dport 8080 -j DNAT --to
192.168.0.3:80

Those rules work fine in the little network I created in my office.

Now I want to try the set up with the real servers. Due to the fact
that I know little about networking, can someone tell me whether I can
keep the public IP addresses and names of the servers and somehow make
requests to www.server2.edu go through the firewall?

I want to do this so that our users won't notice the change and if
something goes wrong I can easily undo the changes without having to
contact our IT department to make changes to the school's DNS server.

I would also appreciate if someone tells me whether I can add two more
web servers to this set up without having to open another "dport". Is
it possible to create a one-to-many mapping with iptables? That way I
only have to open port 80 on the firewall and still allow incoming
connections to different nated machines.

Any pointers, suggestions will be greatly appreciated.

Thanks.

