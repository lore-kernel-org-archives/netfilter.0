From: "HareRam" <hareram@sol.net.in>
Subject: NAT and NAT
Date: Sat, 14 Sep 2002 14:53:38 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ec01c25bd0$6a8f5a20$7cfcc5cb@humanpc>
References: <5.1.0.14.2.20020912090056.012e6d48@linda> <200209121022.g8CAMTv09831@vulcan.rissington.net> <052701c25a4f$eb00a740$7cfcc5cb@humanpc> <200209121354.g8CDssv10202@vulcan.rissington.net>
Reply-To: "HareRam" <hareram@sol.net.in>
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
To: netfilter@lists.samba.org

Hi all 

i have ADSL connection
ADSL provider didnot provide Public IP
he is doing NAT with ADSL router

iam trying to have Redhat Box as a gateway for all
my ADSL router ip is 192.168.40.1
my router (linux is 192.168.40.2, gateway is 192.168.40.1)
now any Router (Linux) another ethernet start from 192.168.30.1
and client ip start from 192.168.30.2.... 253.
iam running transparent Squid also

and i have another Link which is Public IP also connected to same network
here iam using another Linux Server with Different IP block
192.169.100.1 ethernet 1 and clients are from 192.168.100.2 onwards


now iam looking
i want to club both network to one  IP block and Serve them load balance
is this NAT and NAT os possible
is there any performance issues
is there any limitations
how do the load automatically shift if link 1 down to link 2
how do the load automatically shift if link 2 down to link 1

any sample URL or script will be appriciated

thanks
hare






