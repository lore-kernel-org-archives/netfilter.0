From: "Travis H." <solinym@gmail.com>
Subject: need maintainer to dfd_tbk (Dynamic Firewall Daemon - The Black
	Knight)
Date: Thu, 12 Jan 2006 05:24:23 -0600
Message-ID: <d4f1333a0601120324h6e6850b1p4e291167c2d4be1c@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi folks,

DFD is the moniker I made up to describe a program that manages your
firewall rules, allowing changes to be made in them with more ease and
less chance of error than running iptables -L, visually grepping for
what you want, counting line numbers, and the subsequent iptables
-I/A/D commands.

The Black Knight is the python/netfilter implementation that provides a
command-line style interface to your firewall rules accessible via
netcat or telnet.  The upshot of this is that you first write a script whic=
h
defines a command (let's call it "block").  Then you run it, and
connect to dfd_tbk.
Once connected you type "block add 1.2.3.4" and now the IP 1.2.3.4 can
no longer communicate with your network.  Except the commands you can
define are open-ended; any rule transformation is possible.

I am looking for a project maintainer for this project, as I do not
have time to maintain two different implementations.  Right now
dfd_tbk is far behind dfd_keeper, which is under active development.

I'm looking for someone with some of the following, roughly in order
of importance:

1) Time to spend on a cutting-edge network security project.
2) A linux machine, preferably their firewall, on which they can run and te=
st.
3) A good grasp of firewalls, network security, TCP/IP networking, netfilte=
r.
4) Knowledge of python, or at least of some scripting language.
5) Object-oriented design, or programming language design.

None are hard requirements; a willingness to learn counts for any of them.

There is lots of work to be done.  I am cleaning up my implementation of
persistence, I am thinking about a web interface instead of command-line,
I'm writing a sniffer for it (so it can tell when you're starting up bittor=
rent
and forward the connections on to the internal machine which started
bittorrent), and so forth.  I'm hoping for cross-pollination between the DF=
Ds,
but right now tbk needs to play a bit of catch-up, which is an excellent
learning opportunity for someone of moderate network security skills.

Current homepage of project:
http://www.lightconsulting.com/~travis/dfd/dfd_tbk/

Please CC me in any replies or discussion since I am not subbed to the
netfilter list.
--
"If I could remember the names of these particles, I would have been a bota=
nist"
  -- Enrico Fermi -><- http://www.lightconsulting.com/~travis/
GPG fingerprint: 50A1 15C5 A9DE 23B9 ED98 C93E 38E9 204A 94C2 641B

