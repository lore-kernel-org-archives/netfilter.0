From: EricRyd@cdw.com
Subject: One to One NAT
Date: Wed, 5 Feb 2003 12:27:57 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4F7882716A6FD311AC7000508B6F4AEA5A814824@ranger.corp.cdw.com>
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

I have been given a task to setup One to One NAT on a Linux box.  If I'm
correct I need to do this

iptables -t nat -A PREROUTING -p tcp -d 192.168.1.1-j DNAT --to-destination
172.100.1.1

First off, is this the correct syntax?  If not, I can't find for sure what I
would have to do.  Any suggestions?

Second, here is another scenario I have to do.  I work for Tech Support, and
we have a lab full of devices to assist us when working with Customers.  Our
internal IP Scheme is 192.168.0.0/16.  Some of the devices are
192.168.1.0/24 and can't be changed.  The original plan was to setup a 1:1
NAT with the Linux box to forward to the /24 network so we could use all of
the devices, but since I have been given the project I can't see it working.
How will the Linux box know	 which network to pass information on to
since they are both 192.168.x.x.  Any suggestions or ideas?

Thanks in advance,

Eric

