From: Dave Strydom <strydom.dave@gmail.com>
Subject: Re: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 17:29:19 +0200
Message-ID: <fc38b710511090729n7ab1ba18r2734bcf4ce2c1441@mail.gmail.com>
References: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
	<200511081336.51769.rob0@gmx.co.uk>
	<fc38b710511090331r6c6943faw875965864a056f21@mail.gmail.com>
	<200511090918.03493.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511090918.03493.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

After trying this for a while and watching the tethereal output i have
noticed something:

a Successful upload:

=3D=3D=3D=3D=3D=3D=3D
 37.406692 196.41.186.226 -> 192.168.0.220 FTP Request: PASV
 37.406913 192.168.0.220 -> 196.41.186.226 FTP Response: 227 Entering
Passive Mode (192,168,0,220,137,132).
 37.455288 196.41.186.226 -> 192.168.0.220 TCP ms-sql-s > 35204 [SYN]
Seq=3D0 Ack=3D0 Win=3D16384 Len=3D0 MSS=3D1360
 37.455310 192.168.0.220 -> 196.41.186.226 TCP 35204 > ms-sql-s [SYN,
ACK] Seq=3D0 Ack=3D1 Win=3D5840 Len=3D0 MSS=3D1460
 37.465549 196.41.186.226 -> 192.168.0.220 FTP Request: STOR LANDING_17.jpg
 37.490491 196.41.186.226 -> 192.168.0.220 TCP ms-sql-s > 35204 [ACK]
Seq=3D1 Ack=3D1 Win=3D17680 Len=3D0
 37.490618 192.168.0.220 -> 196.41.186.226 FTP Response: 150 Opening
BINARY mode data connection for LANDING_17.jpg
 37.664991 196.41.186.226 -> 192.168.0.220 FTP-DATA FTP Data: 1360 bytes
 37.665008 192.168.0.220 -> 196.41.186.226 TCP 35204 > ms-sql-s [ACK]
Seq=3D1 Ack=3D1361 Win=3D8160 Len=3D0
 37.670007 196.41.186.226 -> 192.168.0.220 FTP-DATA FTP Data: 305 bytes
 37.670020 192.168.0.220 -> 196.41.186.226 TCP 35204 > ms-sql-s [ACK]
Seq=3D1 Ack=3D1666 Win=3D8160 Len=3D0
 37.675092 196.41.186.226 -> 192.168.0.220 TCP ms-sql-s > 35204 [FIN,
ACK] Seq=3D1666 Ack=3D1 Win=3D17680 Len=3D0
 37.675222 192.168.0.220 -> 196.41.186.226 TCP 35204 > ms-sql-s [FIN,
ACK] Seq=3D1 Ack=3D1667 Win=3D8160 Len=3D0
 37.675713 192.168.0.220 -> 196.41.186.226 FTP Response: 226 Transfer compl=
ete.
=3D=3D=3D=3D=3D=3D=3D

A Unsuccessful upload:

=3D=3D=3D=3D=3D=3D=3D
37.921391 196.41.186.226 -> 192.168.0.220 FTP Request: PASV
 37.921611 192.168.0.220 -> 196.41.186.226 FTP Response: 227 Entering
Passive Mode (192,168,0,220,137,133).
 37.961478 196.41.186.226 -> 192.168.0.220 TCP ms-sql-m > 35205 [SYN]
Seq=3D0 Ack=3D0 Win=3D16384 Len=3D0 MSS=3D1360
 37.961501 192.168.0.220 -> 196.41.186.226 TCP 35205 > ms-sql-m [SYN,
ACK] Seq=3D0 Ack=3D1 Win=3D5840 Len=3D0 MSS=3D1460
 37.967146 196.41.186.226 -> 192.168.0.220 FTP Request: STOR LANDING_18.jpg
 37.982217 196.41.186.226 -> 192.168.0.220 TCP ms-sql-m > 35205 [ACK]
Seq=3D1 Ack=3D1 Win=3D17680 Len=3D0
 37.982349 192.168.0.220 -> 196.41.186.226 FTP Response: 150 Opening
BINARY mode data connection for LANDING_18.jpg
 38.189397 196.41.186.226 -> 192.168.0.220 TCP 1407 > ftp [ACK]
Seq=3D2306 Ack=3D6579 Win=3D16535 Len=3D0
 38.309509 192.168.0.220 -> 196.41.186.226 FTP [TCP Out-Of-Order] Response:
 38.493193 196.41.186.226 -> 192.168.0.220 TCP 1407 > ftp [ACK]
Seq=3D2306 Ack=3D6581 Win=3D16533 Len=3D0
 53.301514 196.41.186.226 -> 192.168.0.220 TCP 1407 > ftp [FIN, ACK]
Seq=3D2306 Ack=3D6581 Win=3D16533 Len=3D0
=3D=3D=3D=3D=3D=3D=3D

If you check the first one, it Opens the BINARY connection and the you
have a FTP-DATA command which gives it the file size

in the 2nd one, it Opens the Binary connection and there is no FTP-DATA iss=
ued?

