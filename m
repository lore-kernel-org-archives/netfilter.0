From: Marian Stepka <marians@itdimensions.com>
Subject: NAT problem with iptables...
Date: Wed, 11 Sep 2002 10:43:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7F567F.3437E5C7@itdimensions.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Guys;

I'm fighthing almost second day with NAT problem. I need to translate
local IP to 'normal' Inet IPs. I set up one box which have two NIC
cards. One side is connected to local LAN with IP 192.168.0.x and other
side is connected to 'copy' of firewall which is used in production. I
would like to simulate situation as on Inet. I don't want to change IP
of firewall which I would like to debug. I need to setup iptables on
linux translating box as follows:

192.168.0.230 <-> 64.124.175.104
192.168.0.231 <-> 64.124.175.105
192.168.0.232 <-> 208.184.248.9


--
*IN ROOT WE TRUST*
Marian Stepka <mailto:stepka@tris.sk>

