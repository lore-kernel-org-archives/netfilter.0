From: "malvika joshi" <zenith.of.perfection@gmail.com>
Subject: iptables v1.2.11 error in enabling SNAT of unknown argument --to
Date: Sat, 20 May 2006 13:06:46 +0530
Message-ID: <9157ddef0605200036r7b7e4a65v310011a3a0bd3eb8@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I downloaded the iptables v1.2.11 and have got the directory structure
in which I have the iptables binary in the source code .I then copy the
binary iptables to another file system and so ./iptables -L .I get the
output.But when I do SNAT i get the following :-
$./iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 10.0.0.1
 iptables v1.2.11: Unknown arg `--to'
 Try `iptables -h' or 'iptables --help' for more information.

Please help me out .The directory also has binaries iptables-save and
iptables-restore .Do I need to copy them too?

I have even tried giving --to-source instead of --to.
Does iptables v1.2.11 doesnt have support for SNAT ?  i did iptables -h and
couldnt find any --to or SNAT mention. have already compiled the
kernel with options to enable inclusion of iptables modules .Also if i
do
./iptables -t nat -L
I get the nat table. This means that the nat module is already loaded i
think.
Please tell me the option intead of --to to enable SNAT.I am a naive
user so please give a solution that would work.

