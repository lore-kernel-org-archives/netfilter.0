From: diadicic@optonline.net
Subject: port Forwarding
Date: Tue, 16 Nov 2004 11:44:52 -0500
Message-ID: <48e60748e206.48e20648e607@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Can someone help me understand this=3F

  I have a firewall setup up with two nic=27s in it=2E

               1 eth0 24=2E190=2Ex=2Ex  which is my Internet connection
               2 eth1 172=2E16=2E12=2E165 which is a local area network=2E=


              I have a web server at 172=2E16=2E12=2E160  =93I hope thats=
 clear=94

    Now if I port forward this way it will not work=2E

             =93iptables -A PREROUTING -i eth0 -t nat -p tcp =96dport 80 =
-j DNAT =96to =

                172=2E16=2E12=2E160=3A80=94
               =93iptables -A FORWARD -p tcp -d 172=2E16=2E12=2E160 =96dp=
ort 80 -i eth0 -o eth1 =

                 -j ACCEPT=94


But if I do it this way It will work=3A

                 =93iptables -t nat  -A PREROUTING -p tcp =96dport 80 -d =
24=2E190=2Ex=2Ex -i eth0 -j   =

                   DNAT --to-destination 172=2E16=2E12=2E160  172=2E16=2E=
12=2E160=94

                   =93iptables -A POSTROUTING -p tcp =96dport 80 -d 172=2E=
16=2E12=2E160 -j SNAT -o    =

                     eth1 =96to-source 172=2E16=2E12=2E165=94


Could anyone please explain why the first way did not work=2C all the dir=
ections I read claim that is how to port forward=2E


Any help is appreciated



Thanks =

Dominic Iadicicco


