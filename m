From: "Joris Dobbelsteen" <Joris@familiedobbelsteen.nl>
Subject: RE: Traffic auditing per user
Date: Tue, 12 Dec 2006 17:55:14 +0100
Message-ID: <73427AD314CC364C8DF0FFF9C4D693FF546D@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: tom <tom@t0mb.net>
Cc: netfilter@lists.netfilter.org

Thanks Tom,

This seems quite promising. It looks like /proc/net/tcp and
/proc/net/udp must be combined together with /proc/net/ip_conntrack.
The first two to figure out the uid, the latter to find the actual
bytes/packets transferred.
Some clever matching the results will be good and some post-processing
will reveil any delta values (for easier computations later on). Thanks
for the pointers, these seem to be exactly what I needed!

I'll give it some testing later on...


A slight note: if you have IPv6 enabled, connections are listed in
tcp6|udp6 too, also IPv4 connections. It contains the same content, but
with longer addresses. The following is a IPv4 address, see RFC 3513,
paragraph 2.5.5...
   2: 0000000000000000FFFF00001F7EA8C0:0016
0000000000000000FFFF0000017EA8C0:084E 01 00000034:00000000 01:0000001C
00000000     0        0 10047 4 cb314040 80 10 1 3 100

I'm a little bit worried about endianess of linux implementations on
different hardware platforms, however. Hopefully they did it right:
correct formation conversion.

- Joris

>-----Original Message-----
>From: tom [mailto:tom@t0mb.net]=20
>Sent: zondag 10 december 2006 15:52
>To: Joris Dobbelsteen
>Cc: netfilter@lists.netfilter.org
>Subject: Re: Traffic auditing per user
>
>/proc/net/tcp and udp both have a column for the UID of any=20
>particular connection. The last column is the inode of the=20
>socket, and you can resolve this to a prticular program by=20
>searching through all the /proc/[0-9]+/fd/ folders. There will=20
>be symbolic links to sockets and one of them will have the=20
>inode. Here's an example from /proc/net/tcp
>
>sl local_address rem_address st tx_queue rx_queue tr tm->when=20
>retrnsmt uid timeout inode
>
>7: CAF01B52:CD14 5DC20B55:1A0B 01 00000000:00000000=20
>02:000855AB 00000000
>666 0 11007 2 f6780a00 815 40 30 2 100
>
>as you can see, my UID is 666
>
>
>I wrote this code for a netstat plugin for an app i'm working=20
>on. (it's python btw)
>
>def get_connections(self):
>
>temp_inodes =3D {}
>cdict =3D {}
>
>try:
>procnettcp_f =3D open('/proc/net/tcp')
>except IOError:
>raise
>
>procnettcp_f.readline()
>while 1:
>cdict =3D {}
>line =3D procnettcp_f.readline()
>if line =3D=3D '': break
>spline =3D line.split()
>inode =3D spline[9]
>[lhost, lport] =3D spline[1].split(':', 1) [rhost, rport] =3D=20
>spline[2].split(':', 1) status =3D spline[3]
>
>if int(status,16) =3D=3D 0x01:
>cdict['status'] =3D "ESTABLISHED"
>elif int(status,16) =3D=3D 0x0A:
>cdict['status'] =3D "LISTENING"
>elif int(status, 16) =3D=3D 0x100:
>cdict['status'] =3D "WAITING"
>else:
>cdict['status'] =3D '-'
>continue
>
>lhost =3D int(lhost, 16)
>rhost =3D int(rhost, 16)
>cdict['lport'] =3D str(int(lport,16))
>cdict['rport'] =3D str(int(rport,16))
>cdict['lhost'] =3D ".".join(map(str,(lhost & 0xff, (lhost >> 8)=20
>& 0xff, (lhost >> 16) & 0xff, (lhost >> 24) & 0xff)))=20
>cdict['rhost'] =3D ".".join(map(str,(rhost & 0xff, (rhost >> 8)=20
>& 0xff, (rhost >> 16) & 0xff, (rhost >> 24) & 0xff)))=20
>temp_inodes[inode] =3D cdict for iknowd, pid, prog_name in=20
>self.resolve_inodes(temp_inodes):
>temp_inodes[iknowd]['pid'] =3D pid
>temp_inodes[iknowd]['prog_name'] =3D prog_name print temp_inodes=20
>return temp_inodes
>
>def resolve_inodes(self, inodes):
>
>for file in glob.glob('/proc/[0-9]*/fd/*'):
>try:
>fdno =3D os.readlink(file)
>if fdno[0:8] =3D=3D 'socket:[':
>this_inode =3D fdno[8:-1]
>if this_inode in inodes:
>pid =3D file.split('/')[2]
>try:
>pid_status =3D open(''.join(['/proc/', pid, '/status'])) name =3D=20
>pid_status.readline().split()[-1].rstrip()
>pid_status.close()
>except IOError:
>name =3D '?'
>yield this_inode, pid, name
>except os.error:
>pass
>
>
>This code doesn't do anything with the UID, but it's there in=20
>/proc/net/tcp, so easy to get to. I don't think netfilter=20
>itself really has what you're looking for. Hope this helps you=20
>out. Another thing worth mentioning actually is=20
>/proc/net/ip_conntrack, which has lines like. This would be=20
>useful in conjunction with the corresponding lines from=20
>/proc/net/tcp etc...
>
>tcp 6 431482 ESTABLISHED src=3D82.27.240.202 dst=3D213.171.192.50
>sport=3D34571 dport=3D143 packets=3D274 bytes=3D15668 =
src=3D213.171.192.50
>dst=3D82.27.240.202 sport=3D143 dport=3D34571 packets=3D268=20
>bytes=3D153509 [ASSURED] mark=3D0 use=3D1
>
>Joris Dobbelsteen wrote:
>> I'm looking for a solution to audit network traffic usage per user.
>> After a long enough search I was not able to find a solution that=20
>> suited my needs.
>>
>> It must fit the following requirements:
>> * The traffic must be logged on a uid basis.
>> * Some traffic should not be counted, which is protocol=20
>(i.e. non-IP)=20
>> and IP address based (i.e. no local network).
>> * Of course not have a dramatic effect on performance
>>
>> Hopefully its not to hard for me, thus the tool has some (decent)=20
>> instructions/documentation.
>> Further I want to keep using my stock application. The platform is=20
>> Ubuntu 6.06 LTS, and I prefer to have the packages from the=20
>> repositories, rather than my own complications. Mostly for=20
>reasons of=20
>> testing and maintenance.
>>
>> I would guess this is not directly a netfilter question, but=20
>it should=20
>> be close enough.
>>
>> - Joris
>>
>>  =20
>
>

