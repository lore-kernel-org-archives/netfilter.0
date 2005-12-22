From: =?ISO-8859-1?Q?G=E1bor_Igl=F3i?= <mdjake@gmail.com>
Subject: Why packages pass through a restrictive mangle prerouting rule?
Date: Thu, 22 Dec 2005 14:46:16 +0100
Message-ID: <b8fd3ed90512220546p4e8bef0ci6e0bb59c69dd20cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello!

I'd like to restrict WLAN access to my server by using mac filtering
policy. Here is some of my iptables chains:

#default prerouting drop policy and only allowing certain client NICs
based on mac address
iptables -t mangle -P PREROUTING DROP
iptables -t mangle -A PREROUTING -i wlan0 -m mac --mac-source
(physaddr of an allowed client NIC) -j ACCEPT

These rules however doesn't stop unauthorized clients with foreign mac
addresses to successfully connect and obtain ip address from the DHCP
server running on the same machine - and I don't understand why. The
prerouting mangle chain is supposed to be passed by all packets,
right? If I drop all of the packets coming from unknown mac addressed
clients how can they still obtain the DHCP info?

I'd like to know how to filter out all communication from all clients
and only allow authorized ones to connect to the DHCP server.

Thank you
G=E1bor

