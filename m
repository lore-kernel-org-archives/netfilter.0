From: "Srikant S. K" <sriks82@yahoo.com>
Subject: neighbour table again
Date: Wed, 30 Jul 2003 01:31:39 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030730083139.96288.qmail@web41903.mail.yahoo.com>
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

Hi all,

I know that this question has been asked several times
and I have gone through the archieves before posting
it here unsuccessfully.

I have two NIC's one having public IP and the other
private IP.

eth0: 202.x.y.z
eth1: 10.0.0.1

System Environments:
Linux OS - 2.4.20
iptables - 1.2.8

The problem is that the moment I enable ip_forward,
the "Neighbour Table Overflow" starts and the same
stops when I disable ip_forward.

I am also running my mail server on 10.0.0.2. I have
setup port forwarding on my Linux gatewat and this
works fine the moment ip_forward is enabled.

I have checked my localhost settings as suggested by
many and is fine.

I have also tried using older kernel (2.4.14) along
with arpd but the problem still exists.

Any help will be a greate help.

Thanks in advance for any help

Regards,

Srikanth

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

