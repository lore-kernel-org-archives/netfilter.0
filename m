From: Pablo Allietti <pablo@lacnic.net>
Subject: snat,dnat anything
Date: Thu, 13 Feb 2003 18:56:15 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030213155615.GB20004@omega.lacnic.net.uy>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

hi people i need your help again!


have a Network 200.40.227.66/255.255.255.240

i assign ips via DHCP and all machines connect to the server with
iptables as gateway 200.40.227.66 but i have one problem.

All machine go outside with the .66 IP

I need this if my machine get via dhcp 200.40.227.71 go outside with .71
indiferent how is the gateway ip.

.71 go outside .71
.75 go outside .75

and all the same form, i test with snat and dnat but nothing when i put
snat 77 to 77 the conecction dead.

If any help me please????

 Thanks in advance.

Pablo



