From: Sergi Coll <sergi@sim00.net>
Subject: Re: Continuous attempt to connect to UDP port 2002
Date: Mon, 16 Sep 2002 18:46:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209161846.56497.sergi@sim00.net>
References: <C10C67C29E56FE48A787648B25C5A8CD9BFB@hercules.idea.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C10C67C29E56FE48A787648B25C5A8CD9BFB@hercules.idea.com.mx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Omar Castaneda Acosta <omar@idea.com.mx>
Cc: netfilter@lists.netfilter.org

Hola,

> Has anyone experienced this?
> Sep 16 11:09:42 myhost kernel: Bad: IN=3Deth2 OUT=3D
> MAC=3D00:e0:81:10:85:85:00:60:5c:f3:eb:f7:08:00 SRC=3D216.229.183.80
> DST=3D148.223.7.178 LEN=3D69 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D0 DF =
PROTO=3DUDP
> SPT=3D2002 DPT=3D2002 LEN=3D49

I think is Apache/mod_ssl Worm. Yo can read report in=20
http://www.cert.org/advisories/CA-2002-27.html

--=20

sergi@sim00.net
http://www.sim00.net/

