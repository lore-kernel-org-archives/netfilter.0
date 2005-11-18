From: "Pedro Drimel" <pedrodrimel@uol.com.br>
Subject: Many client with same IP
Date: Fri, 18 Nov 2005 08:38:12 -0200
Message-ID: <IQ5C7O$E2767ECC0C41D2F2833F0216F3EF135D@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,
 
I need to do a configuration in a server that I don't know if is possible=
.
 
The clients connect to the server under ssh to access the database, I nee=
d that some clients connect under only one IP, because the database count=
 only one license for four IPs. The first thing that I tought was to take=
 a machine and do it a gateway and the clients of local network connect t=
o the server thgouth this new server and in this new server will be a SNA=
T, well OK with a sub network but I thinked that this could be possible u=
sing iptables on the server that run the databse (the server ever is linu=
x). The clients use putty with Windows XP.
 
Firstly I configured another IP on the network device:
ifconfig eth0:0 10.0.0.10 netmask 255.255.255.0
then I did this rule:
iptables -t nat -A POSTROUTING -s 10.0.0.20 -j SNAT --to 10.0.0.10
 
10.0.0.20 is the IP of the client
10.0.0.10 is the IP of "logic" network device
 
but it did not function... I tried this rule with the IP of eth0 (10.0.0.=
9) but eighter did not function...
 
Sorry for my bad english...
 
Best Regards.


