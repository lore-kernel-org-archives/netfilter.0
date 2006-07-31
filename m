From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: common FTP+NAT problem
Date: Mon, 31 Jul 2006 20:19:24 +0200
Message-ID: <44CE49AC.6000505@plouf.fr.eu.org>
References: <44CE313A.4040204@ort.edu.uy> <44CE4193.4050603@plouf.fr.eu.org>
	<44CE4784.3090909@ort.edu.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE4784.3090909@ort.edu.uy>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Ernesto Silva a =E9crit :
> I wrote the "RELATED" specification because I thought port 20 and the=20
> rest of the connections (in passive and active mode) may be handled by=20
> ip_conntrack_ftp and ip_nat_ftp in an "automagically" way.

This is what happens, at least partly :
- ip_conntrack_ftp, by monitoring the FTP control connections,=20
identifies the first packet of an FTP data connection as RELATED ;
- ip_nat_ftp, with the help of ip_conntrack_ftp, does the necessary NAT=20
on FTP data connections.

But you still have the job of writing rules to decide their fate,=20
whether they must be accepted or dropped.

> Anyway, I used your suggestion (which I already knew)

Ok, sorry for doubting.

