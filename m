From: David Gaston Rodriguez <davidgr@interlap.com.ar>
Subject: Re: Masquerading problems (fix)
Date: Wed, 3 Jul 2002 22:51:56 +0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207032251.56428.davidgr@interlap.com.ar>
References: <200207030613.59855.davidgr@interlap.com.ar>
Reply-To: davidgr@interlap.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207030613.59855.davidgr@interlap.com.ar>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

Thanks to all!! I already could solve the problem using the line:
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to=
-pmtu


--=20

---------------------------------
DAVID GAST=D3N RODRIGUEZ
Linux Tucum=E1n
Nick: [[D4V|D]]
---------------------------------
Email:  davidgr@interlap.com.ar
        david_80gr@hotmail.com
ICQ: 81492566
MSN Messenger: david_80gr
---------------------------------


