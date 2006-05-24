From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Problem with SNAT
Date: Thu, 25 May 2006 07:59:36 +1200
Message-ID: <4474BB28.1050801@aut.ac.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

For those of you who remember my problem from a week or so ago, this is 
a continuation of the same thing.

I've now changed from using MASQ to using SNAT in order to work around 
the problem where MASQ and policy routing don't work together, however 
I've run into a new problem.

My linux box has 3 interfaces -
eth0 - 192.168.0.1/24 (outside - goes to an adsl modem
eth1 - x.x.252.33/29   (inside)
ppp0 - z.z.2.204/32 (ssh tunnel to work)

In order to source nat anything I route down the tunnel onto the 
tunnel's IP address,I have the following SNAT command active:

iptables -t nat -I POSTROUTING -o ppp0 -j SNAT --to-source z.z.2.204

The problem is that the -o ppp0 bit seems to be being ignored. If I ssh 
from my windows machine (x.x.252.36) to x.x.252.33,  my address gets 
translated to z.z.2.204, even though it the address I connect to is on 
the same subnet. I.e., it shouldn't have gone anywhere near the ppp0 
interface.

A tcpdump -n shows that the SYN comes from the correct address of 
x.x.252.36, and the reply is sent there, but unless I add ALL:z.z.2.204 
into /etc/hosts, sshd resets the tcp connection, strongly suggesting 
that the SNAT has occured by the time the sshd process sees the packet.

Is this expected behaviour ?



