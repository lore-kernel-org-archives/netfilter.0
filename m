From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: source mac address
Date: 01 Aug 2003 09:50:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059724207.1178.5.camel@elendil.intranet.cartel-securite.net>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAA9QxKLSpdOESQ12+Zk6/CxgEAAAAA@sicredi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAA9QxKLSpdOESQ12+Zk6/CxgEAAAAA@sicredi.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: jmurlick@sicredi.com.br
Cc: netfilter@lists.netfilter.org

Le jeu 31/07/2003 =E0 22:02, Juliano Murlick a =E9crit :
> How can i log the source mac address ? I'm logging every dropped packet=
,
> my log is like it :=20
> Jul 15 08:51:26 fwwan kernel: IPT: INPUT DROPPED IN=3Deth0 OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:8827:42:00:08:00 SRC=3DIP1 DST=3DIP2 LEN=3D=
60
> TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D52070 DF PROTO=3DTCP SPT=3D43812 D=
PT=3D25
> WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0
> that mac is a destin address, i wanna log the source, is it possible ?

What you have in log is the whole MAC header :

	00:00:00:00:00:00:00:00:8827:42:00:08:00

You read it like this :

	DST MAC : 00:00:00:00:00:00 (strange...)
	SRC MAC : 00:00:88:27:42:00
	PROTO : 08:00 (IP)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

