From: "Rodre Ghorashi-Zadeh" <rodrico7@hotmail.com>
Subject: ip_nat_ftp module and freeswan IPSEC module don't work together?
Date: Fri, 23 Jan 2004 02:41:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F42llTdrrcwv1000519cf@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

I am having a really weird problem with the ip_nat_ftp module and the [Free=
=20
S/WAN] ipsec module. When I have the ipsec module loaded (with or without=20
any tunnels configured) the FTP Data connections to any active type FTP=20
servers get screwed up. What happens is that I am able to connect and login=
=20
to the server, I am able to do an 'ls' or 'get' operation once. On=20
subsiquent operations that require the use of the data channel the system=20
hangs. I used tcpdump on the firewall to see what 'PORT' commands where=20
being sent to the server. This is where I noticed that the first 'PORT'=20
command was getting it's IP address rewritten from the clients internal=20
address to the clients external address, thus the ip_nat_ftp module works a=
s=20
expected. However, on subsiquent 'PORT' commands, from within the same FTP =

session, the IP address in the 'PORT' command is my client machines interna=
l=20
IP address, so the remote server freaks out and drops (TCP RESET) the=20
connection. If I stop the IPSEC service (unload ipsec.o module) the 'PORT' =

commands internal IP address gets rewritten to the clients external IP=20
adddress each and every time I do a 'get' or 'ls' operation.

Now the really wierd part. When I have the IPSEC module loaded and a tunnel=
=20
configured, and I use FTP to access an FTP server that resides on the other=
=20
end of the tunnel the ip_nat_ftp module is able to rewrite the 'PORT'=20
commands IP address each and every time, hence the active FTP works like a =

charm through the tunnel. Weird Huh?

I am using kernel 2.4.20, iptables 1.2.8, patch-o-matic 20030107, and Free =

S/WAN 2.01.

Any help regarding this matter would be greatly appreciated. Thanks in=20
advance.

=AEodre

_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  =20
http://join.msn.com/?page=3Ddept/bcomm&pgmarket=3Den-ca&RU=3Dhttp%3a%2f%2fj=
oin.msn.com%2f%3fpage%3dmisc%2fspecialoffers%26pgmarket%3den-ca


