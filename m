From: "Ed Street" <blacknet@simplyaquatics.com>
Subject: RE: hosts.deny
Date: Sun, 7 Jul 2002 19:48:19 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <006f01c22610$c5b634a0$0a01a8c0@ed>
References: <20020707233858.OZRQ19225.mta07-svc.ntlworld.com@there>
Reply-To: <blacknet@simplyaquatics.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0070_01C225EF.3EA494A0"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020707233858.OZRQ19225.mta07-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0070_01C225EF.3EA494A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Sure attached is the hosts.trashcan file I am currenly testing.
Basically it uses the netfilter time patch.  You edit the file to
include the ip/hostmask the start_time, stop_time and days to deny.  The
only down side to this is the date wraping (i.e. deny time going past
midnight) and you have to rerun the script after any change to the
files.

Ed

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
Sent: Sunday, July 07, 2002 7:39 PM
To: netfilter@lists.samba.org
Subject: Re: hosts.deny

On Monday 08 July 2002 12:33 am, Ed Street wrote:

> Hello,
>
> I've taken the hosts.deny file a bit further and wrote a
hosts.trashcan
> and a hosts.dnat.
>
> The hosts.trashcan uses the time patch, it will reject any ip/netmask
> from start_time to end_time on days.
>
> The hosts.dnat file will setup a dnat rule, it's format is
> Sport	ip	dport	protocol

Can you give some more details on how these work please ?

 

Antony.

------=_NextPart_000_0070_01C225EF.3EA494A0
Content-Type: application/octet-stream;
	name="hosts.trashcan"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="hosts.trashcan"

# ------------------------------------------------------------=0A=
#			hosts.trashcan=0A=
# this is the trashcan file used for iptables to deny from=0A=
#=0A=
# ------------------------------------------------------------=0A=
=0A=
#=0A=
# you should restart /etc/init.d/rc.firewall.iptables when making *ANY*=0A=
# changes to this file!=0A=
#=0A=
# Currently there is NO need to restart the script on a timed basis.=0A=
#=0A=
# Timed restarts will be added with ip accounting for daily stats.=0A=
#=0A=
#=0A=
#	start_time and end_time is HH:MM=0A=
#	days is Mon,Tue,Wed,Thu,Fri,Sat,Sun=0A=
#	if these 3 fields are NA then put an X but do NOT leave it blank!=0A=
#=0A=
#  **********NOTE**********=0A=
#=0A=
#	if stoptime is *AFTER* midnight then create 2 rules.=0A=
#	rule 1) start_time	23:59=0A=
#	rule 2) 00:00		stop_time=0A=
#=0A=
#	This is a bug in the time patch and is being worked on by the=0A=
#	developer in the next release=0A=
#=0A=
#  **********NOTE**********=0A=
#=0A=
# example formats=0A=
# host/mask	start_time	end_time	days=0A=
# www.google.com x x x=0A=
# 10.0.0.1/24 x x x=0A=
=0A=
#TEST BLOCK=0A=
#192.168.1.200	17:00	23:59   Mon,Tue,Wed,Thu,Fri,Sat,Sun=0A=
#192.168.1.200	00:00	08:00	Mon,Tue,Wed,Thu,Fri,Sat,Sun=0A=
=0A=
=0A=
# ------------------------------------------------------------=0A=
#			p0rn spam locations=0A=
# ------------------------------------------------------------=0A=
=0A=
#<ip/netmask>    <start_time>    <stop_time>     <days>=0A=
217.56.69.170 x x x=0A=
=0A=
#mail1.famk.com x x x=0A=
64.38.209.73/24 x x x=0A=
youvegotpornmail.com x x x=0A=
=0A=
211.250.155.163/24 x x x=0A=
#sexymailers.com/24 x x x=0A=
64.119.200.138/24 x x x=0A=
210.102.176.5/24 x x x=0A=
193.230.98.160/24 x x x=0A=
61.141.213.83/24 x x x=0A=
21.119.57.33/24 x x x=0A=
210.21.102.67 x x x=0A=
=0A=
webport-cl6-cache3.ilford.mdip.bt.net x x x=0A=
213.120.56.41 x x x=0A=
=0A=
=0A=
# ------------------------------------------------------------=0A=
#			spam crap=0A=
# ------------------------------------------------------------=0A=
=0A=
#<ip/netmask>	<start_time>	<stop_time>	<days>=0A=
doubleclick.net/24 x x x=0A=
216.255.192.1/24 x x x=0A=
=0A=
#annoying junk from lop=0A=
www.lop.com/16 x x x=0A=
=0A=
www.x10.com/24 x x x=0A=
www.entercasino.com/24 x x x=0A=
media.fastclick.net/24 x x x=0A=
www.casino-on-net.com/24 x x x=0A=
=0A=
#korea=0A=
210.95.109.130/16 x x x=0A=
=0A=
# ------------------------------------------------------------=0A=
#			misc user defined=0A=
# ------------------------------------------------------------=0A=
=0A=
#<ip/netmask>    <start_time>    <stop_time>     <days>=0A=

------=_NextPart_000_0070_01C225EF.3EA494A0--


