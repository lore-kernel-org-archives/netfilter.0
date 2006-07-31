From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: common FTP+NAT problem
Date: Mon, 31 Jul 2006 18:52:52 +0200
Message-ID: <5801cedd6a9e2c3fb5137903c6ba8c73@former03.de>
References: <44CE313A.4040204@ort.edu.uy>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE313A.4040204@ort.edu.uy>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Ernesto Silva <silva@ort.edu.uy>
Cc: netfilter@lists.netfilter.org

Hi Ernesto, hi everybody,

> _fwd=3D"iptables -A FORWARD"
> _nat=3D"iptables -A POSTROUTING"

Postrouting is in the nat table, so you have to add "-t nat" to _nat=20
and make it
    _nat=3D"iptables -t nat -A POSTROUTING"

>    I'm having a problem to access internet ftp servers from my=20
> internal network. I understand the ftp connection but I don't have=20
> enough information about ip_conntrack_ftp and ip_nat_ftp modules, so=20=

> here is my situation.

Apart from that you will need more rules for FTP, that's the tricky=20
part. What worked well for me was using vsftpd with a port=20
specifiaction for the data connections and allow these ports in=20
INPUT|FORWARD.
It may work using the ftp conntack module, but I don't know anything=20
about that. You will have to add some port 20 rule, though.

Baltasar

--
Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


