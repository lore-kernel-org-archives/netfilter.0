From: Simone <mimmo@ats.it>
Subject: Netfilter box with auto-redirection
Date: Tue, 13 Dec 2005 09:46:03 +0100
Message-ID: <439E8A4B.6010608@ats.it>
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

Hi all...

here is my situation..

             eth 1                          eth0
| clients | -------> | linux box |  ------->  | IP backbone |


The client get the ip address via dhcp from the linux box.. i assign a
public ip address.
The box normally act as a router and has to permit the packet to
Internet only if client has the right permit.. else no way.. the packet
is dropped.
Doing this is easy.. i just use the FORWARD chain with 2 rules and all
work ok.. when i need to permit the traffic i only add a rule with the
new IPSRC to the chain before the default drop roule (-I) and all work..

What i need to do is more hard..

I need by default that all the web traffic (80,443), for all the client
that haven't the permit rules on.. has to be redirect to a default
IP-ADDRESS where they will be able to insert their login/pwd for
authentication.. after that is verification will be ok i'll add
automatically the rule for permit the traffic without the redirection..
By default all other kind of traffic must be dropped on eth1..
I have search over the REDIRECT option but i can't use on the FORWARD
chain.. just verify some solution using the mangle table.. but nothing
over there too..

Any idea ? :)

Simon..

