From: "Udo A. Steinberg" <us15@os.inf.tu-dresden.de>
Subject: ipt_hook: happy cracking with 2.6.0-test9-bk7
Date: Wed, 5 Nov 2003 08:30:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031105083015.57e2dff1.us15@os.inf.tu-dresden.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1";
 boundary="Signature=_Wed__5_Nov_2003_08_30_15_+0100_jm7GW6ITz6c/j5Tw"
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

--Signature=_Wed__5_Nov_2003_08_30_15_+0100_jm7GW6ITz6c/j5Tw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit


[ please CC: me on replies because I'm not subscribed to the netfilter list ]

Hi,

I'm currently running Linux-2.6.0-test9-bk7 compiled with gcc-3.3.2.
After upgrading from -test9 to -test9-bk7 I'm getting a lot of

ipt_hook: happy cracking.

messages. Google search revealed that this indicates broken packets being
sent out from the machine - and this is indeed so.

The problem goes away, if I remove all my firewall rules, which looks to me
as if netfilter's --reject-with is the culprit.
Below is my netfilter configuration (not wrapped for readability reasons).

Can anyone comment on what might be going wrong here?

-Udo.


Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
TCP        tcp  --  0.0.0.0/0            0.0.0.0/0          
UDP        udp  --  0.0.0.0/0            0.0.0.0/0          
ICMP       icmp --  0.0.0.0/0            0.0.0.0/0          
IGMP       2    --  0.0.0.0/0            0.0.0.0/0          
IPV6       41   --  0.0.0.0/0            0.0.0.0/0          
ACCEPT     esp  --  0.0.0.0/0            0.0.0.0/0          
ACCEPT     ah   --  0.0.0.0/0            0.0.0.0/0          
LOG        all  --  0.0.0.0/0            0.0.0.0/0          limit: avg 3/min burst 3 LOG flags 0 level 6 prefix `IP Drop: ' 

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain ICMP (1 references)
target     prot opt source               destination         
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0          icmp type 8 
LOG        icmp --  0.0.0.0/0            0.0.0.0/0          limit: avg 3/min burst 3 LOG flags 0 level 6 prefix `ICMP Drop: ' 
REJECT     icmp --  0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

Chain IGMP (1 references)
target     prot opt source               destination         
ACCEPT     2    --  0.0.0.0/0            0.0.0.0/0          

Chain IPV6 (1 references)
target     prot opt source               destination         
ACCEPT     41   --  0.0.0.0/0            0.0.0.0/0          

Chain TCP (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  141.30.0.0/16        0.0.0.0/0          state NEW multiport dports 22,111,137,138,139 tcp flags:0x16/0x02 
ACCEPT     tcp  --  141.76.0.0/16        0.0.0.0/0          state NEW multiport dports 22,111,137,138,139 tcp flags:0x16/0x02 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          state NEW multiport dports 113,522 tcp flags:0x16/0x02 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          state NEW tcp dpts:1024:65535 flags:0x16/0x02 
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0          limit: avg 3/min burst 3 LOG flags 0 level 6 prefix `TCP Drop: ' 
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0          reject-with tcp-reset 

Chain UDP (1 references)
target     prot opt source               destination         
ACCEPT     udp  --  141.30.0.0/16        0.0.0.0/0          state NEW multiport dports 111,137,138,139 
ACCEPT     udp  --  141.76.0.0/16        0.0.0.0/0          state NEW multiport dports 111,137,138,139 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          state NEW multiport dports 123,517,518 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          state NEW udp dpts:1024:65535 
LOG        udp  --  0.0.0.0/0            0.0.0.0/0          limit: avg 3/min burst 3 LOG flags 0 level 6 prefix `UDP Drop: ' 
REJECT     udp  --  0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

--Signature=_Wed__5_Nov_2003_08_30_15_+0100_jm7GW6ITz6c/j5Tw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/qKcHnhRzXSM7nSkRAr4fAJ9fZ5R0ronDXzkRmhpjmVIJJfuQ7gCfe6gK
YpIUsSVu8lS1AsBPJr9S+hU=
=dJbC
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Nov_2003_08_30_15_+0100_jm7GW6ITz6c/j5Tw--

