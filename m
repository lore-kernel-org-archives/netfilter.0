From: "Jonathan Villa" <jvilla@e37.net>
Subject: Allow only certain ip addresses
Date: Thu, 10 Jun 2004 12:39:35 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2169.64.2.245.108.1086889175.squirrel@64.2.245.108>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

I have a machine running mysql only.

I want to allow connections on ports 3306, 22, and 80 for a group of ip
address.

Some will be from the block, others are dispersed.

Will I know how to allow block of ips, and how to allow a single ip, how
would I combine the 2?

My assumption is this

1. create an array of the single ip addresses.
2. loop throught the array printing an iptables command which will allow
access on those ports to the loop index.
3. hardcode the ip block xx.xxx.xx.0/24

Am I correct so far?


