From: uniplex <uniplex@maximum-linux.net>
Subject: Re: Spoofed ip's
Date: Tue, 11 Feb 2003 15:56:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E491D30.1000909@maximum-linux.net>
References: <1044948351.23287.11.camel@filth.sadomain.co.za>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: deff <deff@sadomain.co.za>
Cc: netfilter@lists.netfilter.org

deff wrote:
> Hello everyone.=20
>=20
> I set up a firewall that filters out, logs, and drops packets
> originating from spoofed ip addresses.=20
>=20
> The definition here of a spoofed ip is :
> a) A non-routable ip=20
> b) A ip thats not destined for us ( shouldn't get past router anyway ) =

> c) A local ip=20
> d) the loop back ip=20
>=20
> Originally the firewall only filtered 172.16.0.0/12, 192.168.0.0/16,=20
> 10.0.0.0/8 and 127.0.0.1 addresses.=20
>=20
> Then i took a look at Firestarter's iptables script and saw that it als=
o
> filters out other addresses.=20
>=20
> Could anyone please check the rules below and tell me if the the source=
=20
> ip'ss are valid. I'm seeing an incredible amount of these ip's
> attempting to get through .=20
>=20
> To me it looks like i'm blocking out the whole internet, but that makes=

> me wonder why firestarter does it .=20
>=20
> thanks ,
> Cilli=C3=A9
>=20

Would something like this look a little better for you?

RESERVED_NET=3D"0.0.0.0/8 1.0.0.0/8 2.0.0.0/8 5.0.0.0/8 7.0.0.0/8=20
10.0.0.0/8 23.0.0.0/8 27.0.0.0/8 31.0.0.0/8 36.0.0.0/8 37.0.0.0/8=20
39.0.0.0/8 41.0.0.0/8 42.0.0.0/8 58.0.0.0/8 59.0.0.0/8 60.0.0.0/8=20
69.0.0.0/8 70.0.0.0/8 71.0.0.0/8 72.0.0.0/8 73.0.0.0/8 74.0.0.0/8=20
75.0.0.0/8 76.0.0.0/8 77.0.0.0/8 78.0.0.0/8 79.0.0.0/8 81.0.0.0/8=20
82.0.0.0/8 83.0.0.0/8 84.0.0.0/8 85.0.0.0/8 86.0.0.0/8 87.0.0.0/8=20
88.0.0.0/8 89.0.0.0/8 90.0.0.0/8 91.0.0.0/8 92.0.0.0/8 93.0.0.0/8=20
94.0.0.0/8 95.0.0.0/8 96.0.0.0/8 97.0.0.0/8 98.0.0.0/8 99.0.0.0/8=20
100.0.0.0/8 101.0.0.0/8 102.0.0.0/8 103.0.0.0/8 104.0.0.0/8 105.0.0.0/8=20
106.0.0.0/8 107.0.0.0/8 108.0.0.0/8 109.0.0.0/8 110.0.0.0/8 111.0.0.0/8=20
112.0.0.0/8 113.0.0.0/8 114.0.0.0/8 115.0.0.0/8 116.0.0.0/8 117.0.0.0/8=20
118.0.0.0/8 119.0.0.0/8 120.0.0.0/8 121.0.0.0/8 122.0.0.0/8 123.0.0.0/8=20
124.0.0.0/8 125.0.0.0/8 126.0.0.0/8 127.0.0.0/8 172.16.0.0/12=20
192.168.0.0/16 197.0.0.0/8 201.0.0.0/8 219.0.0.0/8 220.0.0.0/8=20
220.0.0.0/8 221.0.0.0/8 222.0.0.0/8 223.0.0.0/8 224.0.0.0/4 240.0.0.0/8=20
240.0.0.0/5 241.0.0.0/8 242.0.0.0/8 243.0.0.0/8 244.0.0.0/8 245.0.0.0/8=20
246.0.0.0/8 247.0.0.0/8 248.0.0.0/8 249.0.0.0/8 250.0.0.0/8 251.0.0.0/8=20
252.0.0.0/8 253.0.0.0/8 254.0.0.0/8 255.0.0.0/8"

for NET in $RESERVED_NET, do
	iptables --append spoofed_ip --source $NET -jump spoof_log
done


> ______________________CUT____________________________
>=20
>=20
> iptables --append spoofed_ip --source 1.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 2.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 5.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 7.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 23.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 27.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 31.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 36.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 37.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 39.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 41.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 42.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 58.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 59.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 60.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 69.0.0.0/8 --jump spoof_log =20
> iptables --append spoofed_ip --source 70.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 72.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 73.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 74.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 75.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 76.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 77.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 78.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 79.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 82.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 83.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 84.0.0.0/8 --jump spoof_log
> iptables --append spoofed_ip --source 85.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 86.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 87.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 89.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 90.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 91.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 92.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 93.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 94.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 95.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 96.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 97.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 98.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 99.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 100.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 101.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 102.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 103.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 104.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 105.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 106.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 107.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 108.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 109.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 110.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 111.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 112.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 113.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 114.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 115.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 116.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 117.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 118.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 119.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 120.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 121.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 122.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 123.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 124.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 125.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 126.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 128.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 128.66.0.0/16 --jump spoof_log=20
> iptables --append spoofed_ip --source 192.168.0.0/16 --jump spoof_log=20
> iptables --append spoofed_ip --source 172.16.0.0/12 --jump spoof_log=20
> iptables --append spoofed_ip --source 221.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 197.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 222.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 223.0.0.0/8 --jump spoof_log=20
> iptables --append spoofed_ip --source 240.0.0.0/4 --jump spoof_log=20
>=20
> ______________________CUT___________________________
>=20
>=20
>=20
>=20
>=20
>=20



