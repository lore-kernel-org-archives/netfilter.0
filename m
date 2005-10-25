From: "sameer bagwe" <sameerb@techknowledge.co.in>
Subject: Iptables problem with Mail Server
Date: Tue, 25 Oct 2005 12:28:32 -0700
Message-ID: <000b01c5d99a$49bb74a0$3a01010a@TRAINERSB>
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
To: netfilter@lists.netfilter.org

 I have two servers running Linux. Server A is SAMBA domain controller =
and Server B is MAIL server(qmail)
My Server A has two NIC. One two my ISP(172.16.57.188/30) and the other =
to my LAN.(172.16.19.0/24)

Server A LAN IP =3D 172.16.19.230
Server A ISP IP =3D 172.16.57.190

Server B IP =3D 172.16.19.231
Server B also has a dial up option for backup if ISP is down

I have attached my iptable script.
http://s59.yousendit.com/d.aspx?id=3D...GF23Y94C8R092VF

If i set default INPUT Policy to DROP then incoming Mail stop coming.

I add a rule at the end of the script:
ipt -A -s 0/0 -d $LAN_IP -j REJECT

The above rule will also block nmap port scans.

I am not a pro in iptables. Just know scripting and adding intermediate =
level rules.Please let me know how to fix this

Thanks=20

Best Regards,
Sameer Bagwe

--
Only The Inquiring Mind Solves Problems !
