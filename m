From: Marco Simon <marco_simon@web.de>
Subject: Using iptables for bandwidth mesurement
Date: Mon, 06 Jan 2003 11:43:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ID0NVT4YQPJ4WB6TSIMGSLF8632.3e195dc8@europe>
Reply-To: marco_simon@web.de
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

Hello netfilter-group,
 
we are using iptables on our gateway-server for doing NAT and 
package-filtering. 
 
Actually one of our hosting-customers wants to be informed how much off
of our bandwidth to the internet (1.5 MBit maximum) is used, in order to avoid
that some of his "homepage - guests" are not able visite his site due lack of 
bandwidth. Is there any way, how I can use IPtables for giving him a report
about the bandwith usage ? e.g. how can I get the current bandwidth - usage
on a special interface ?
 
The other point we need, is an report about the traffic which comes up between
our cusomers web-server (which is inside our lan, packages will have to pass the firewall) and the outside-world. How can I set up such a service using iptalbes ??
 
Thanks for any comment !




