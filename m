From: Susan.Scheibe@t-online.de (Hugo Mildenberger)
Subject: RELATED connections and the feeling of security
Date: Fri, 13 Apr 2007 12:02:27 +0200
Message-ID: <200704131202.27971.Hugo.Mildenberger@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Sifting through a workstation firewall log file some time ago, I stumbled on 
an ip-address translating to a webserver of a well known German newspaper 
(actually it was www.faz.net) which apparently had tried to intiate a 
connection to port 80 of my workstation, which itself was sitting behind an 
NATing router running an iptables based firewall on top of linux.

But it  was not iptables, who prevented this form of professional curiosity, 
it was the windows firewall running on the workstation itself, who stopped 
and disclosed it.

Looking at my iptables rule set, I asked myself, why all over the world nearby 
everybody suggests inexperienced users to allow connections based 
on "RELATED" state. You can find  literally thousands of such well-meant 
hints: oh, you need a firewall setup, here it is:

"iptables -A INPUT -m state --state ESTABLISHED, RELATED - j ACCEPT"

This means to allow inbound connections having nothing in common with the 
initiating outbound connection, except for the ip-address pair used by the 
initiating connection, leaving your nominal firewalled systems exposed to any 
malicious site you accidentally stumble on, whereas using "ESTABLISHED" alone 
here would restrict connections to be outbound only.

Also the "Shorewall" firewall ruleset actually builds upon "RELATED" state, 
and has dropped any provisions it made in earlier revisions to switch off 
this feature at least optionally. 

I felt alienated when I noticed a certain thread concerning that very same 
issue on Tom Eastep's "Shorewall" site. A user (not me), who had complained 
about this insecure prerequisite was informed by Mr. Eastep personally, that 
he had the choice either to use Shorewall and accept those related inbound
connections, or not to use shorewall at all.

The balance is: What kind of security a SPI firewall product provides, when 
each host you contact from inside is able to invade your private network 
within a few milliseconds? Most users are not aware that following the simple 
ruleset once proposed in a popular netfilter FAQ leads to a system showing 
the behavior of a molten polarity protection diode: you would not notice it 
just until the moment someone permutes the poles.


Best Regards

Hugo Mildenberger

