From: Joel Vosu <joel.vosu@mail.ee>
Subject: Change source address on incoming packets
Date: Mon, 10 May 2004 00:50:30 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409EA7A6.8070000@mail.ee>
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

I would need to be able to change the source address of incouming 
packets. I have 2 different subnets, but I need the server to see the 
packes from the 2nd subnet as coming from the 1st.
in iptables it would be something like:
iptables -A PREROUTING -t nat -s 2nd_subnet -j SNAT --to-source 
local_machine
but this is not possible because SNAT only works for outgoing packets in 
POSTROUTING.
Is there a way to get this to work other than adding a second router box 
for NAT?
I tried to do it like this:
Added another IP address eth0:0 to the server,
added rules:
iptables -A PREROUTING -t nat -d eth0:0_ip -p tcp --dport server-port -j 
DNAT --to-destination eth0_ip:server_port
iptables -A POSTROUTING -t nat -d eth0_ip -p tcp --dport server_port -j 
SNAT --to-source eth0:0_ip
but when I check from: iptables -L -t nat -nv then the second rule does 
not get used at all. I presume the pacet intended for local machine does 
not traverse the outgoing part of the nat table.


Sincerely,
Joel

