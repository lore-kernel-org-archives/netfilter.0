From: edwardspl@ita.org.mo
Subject: [Fwd: Server machines behind Firewall]
Date: Fri, 07 Jan 2005 23:07:10 +0800
Message-ID: <41DEA59E.F63D5C97@ita.org.mo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------F4C325FD761246AADC2806D2"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------F4C325FD761246AADC2806D2
Content-Type: text/plain; charset=x-user-defined
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by itahost1.ita.org.mo id
	j07HIGN23841

oA0K
--------------F4C325FD761246AADC2806D2
Content-Type: message/rfc822
Content-Disposition: inline

Message-ID: <41DEA133.8319FDDD@ita.org.mo>
Date: Fri, 07 Jan 2005 22:48:19 +0800
From: edwardspl@ita.org.mo
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; uuencode=0; html=0;
	linewidth=74
X-Mailer: Mozilla 4.7 [en] (WinNT; I)
X-Accept-Language: en,zh-TW
MIME-Version: 1.0
To: Jason Opperisano <opie@817west.com>
CC: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>
Subject: Re: Server machines behind Firewall
References: <41DC1258.78D37B1D@ita.org.mo>
	<20050106163555.GA28547@bender.817west.com>
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by itahost1.ita.org.mo id
	j07HIGN23841

Jason Opperisano wrote:

> On Thu, Jan 06, 2005 at 12:14:16AM +0800, edwardspl@ita.org.mo wrote:
> > Dear All,
> >
> > Is there a sample ( nat scripts ) for the title ?
>
> EXT_IF=3D"eth0"
> INT_IF=3D"eth1"
> SRV1=3D"10.1.1.10"
>
> iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 \
> =A0 -j DNAT --to-destination $SRV1

I want to know why needn't to define the original IP ( Public IP ) ?
eg :

iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -s 202.175.xxx.xxx --dpor=
t
80 \
=A0 -j DNAT --to-destination 192.168.xxx.xxx

Sorry, what useful about the following function ( command line ) ?

> iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> =A0 --dport 80 -j ACCEPT

In additional, if I want to setup a NAT ( 192.168.101.0/24 ) with a Serve=
r
machines ( 192.168.100.1 ) behind Firewall...
So, is there more than one sample ( nat scripts ) for reference ?

Edward.



--------------F4C325FD761246AADC2806D2--



