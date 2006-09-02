From: Jonas Meurer <jonas@freesources.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Sat, 2 Sep 2006 16:27:13 +0200
Message-ID: <20060902142712.GA31352@freesources.org>
References: <20060831151130.GA32342@freesources.org>
	<000601c6cd14$e07a28a0$0101000a@tanjian>
	<20060831155749.GC32342@freesources.org>
	<44F711D4.5090002@plouf.fr.eu.org>
	<20060901012054.GB23094@freesources.org>
	<44F7996C.9010504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <44F7996C.9010504@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On 01/09/2006 Pascal Hambourg wrote:
> Jonas Meurer a =E9crit :
> >>
> >>What do the "-d **.**.***.**/31" address ranges represent ?
> >
> >it is 62.75.128.98/31, which should be 62.75.128.98 and 62.75.128.99.
>=20
> Actually I did not ask for their exact values but their meaning=20
> network-wise. Because usually, when there is "-d <range>" in an INPUT=20
> rule there is "-s <range>" in its OUTPUT counterpart or vice versa, but=20
> both your INPUT and OUTPUT rule contain the same "-d <range>". So I was=20
> wondering. Are these the client and server addresses ?

the ftp servers listen on both ips. so both are server addresses.

do you think that i should change the "-d ..." at -A OUTPUT to "-s ..."?

> >let's say, ftp-servers are on port 9621 and 9721. then i need to open
> >9620 and 9720 as well for ftp, correct?
>=20
> Yes. But I repeat that opening 9620 and 9720 is effective for active=20
> mode only. Passive mode won't work.

i would like to support both active and passive mode.

> >after using exactly these commands, i'm still not able to connect to the
> >ftp-servers.
> >
> >if i try to login with lftp, it says [Connecting...], then
> >[FEAT negotation...] and then it hangs forever at
> >[Making data connection...].
>=20
> This indicates that the control connection succeeds but the data=20
> connection fails. Maybe lftp uses passive mode for the data connections=20
> by default, then you have to disable it with "set ftp:passive-mode off"=20
> so lftp uses active mode instead. You can also use the "debug" command=20
> in lftp to get a more verbose output.

even with "set ftp:passive-mode off" it doesn't work:

user@home~$ lftp user@62.75.128.98:9621
lftp user@62.75.128.98:/> debug

lftp user@62.75.128.98:/> set ftp:passive-mode on

lftp user@62.75.128.98:/> ls
---> PASV
<--- 227 Entering Passive Mode (62,75,128,98,180,236)
---- Connecting data socket to (62.75.128.98) port 46316
`ls' at 0 [Making data connection...]

lftp user@62.75.128.98:/> set ftp:passive-mode off

lftp user@62.75.128.98:/> ls

---- Connecting to 62.75.128.98 (62.75.128.98) port 9621
<--- 220 diana50 FTP server (Medusa Async V1.23 [experimental]) ready.
---> FEAT
<--- 530 Please log in with USER and PASS
---> AUTH TLS
<--- 500 'AUTH': command not understood.
---> USER user
<--- 331 Password required.
---> PASS XXXX
<--- 230 Login successful.
---> FEAT
<--- 211-Extensions supported:
<---  MDTM
<---  SIZE
<--- 211 END
---> PORT 192,168,3,34,197,115
<--- 200 PORT command successful.
---> LIST
<--- 150 Opening ASCII mode data connection for file list
<--- 426 Connection closed; transfer aborted
---- Closing data socket

any further suggestions?

...
 jonas

