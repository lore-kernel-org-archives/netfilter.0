From: Danny Thuering <danny@inm.de>
Subject: Re: Rules for blocking Email from libero.it domain
Date: Mon, 28 Oct 2002 16:30:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DBD57FE.9050203@inm.de>
References: <OF4868D659.17C45E12-ON65256C60.003E4AD9-65256C60.004175C4@lntinfotech.com> <006901c27e8a$fbde4630$8c01a8c0@sundaram>
Reply-To: danny@inm-magic.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hi,

dig just tells you which servers will accept mail for libero.it:

; <<>> DiG 9.2.1 <<>> libero.it any
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18016
;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 2, ADDITIONAL: 3

;; QUESTION SECTION:
;libero.it.                     IN      ANY

;; ANSWER SECTION:
libero.it.              86391   IN      MX      10 smtp4.libero.it.
libero.it.              86391   IN      MX      10 smtp5.libero.it.
libero.it.              86391   IN      MX      10 smtp6.libero.it.
libero.it.              86391   IN      NS      ns1.libero.it.
libero.it.              86391   IN      NS      ns2.libero.it.

;; AUTHORITY SECTION:
libero.it.              86391   IN      NS      ns1.libero.it.
libero.it.              86391   IN      NS      ns2.libero.it.

;; ADDITIONAL SECTION:
smtp4.libero.it.        86391   IN      A       193.70.192.54
smtp5.libero.it.        86391   IN      A       193.70.192.55
smtp6.libero.it.        86391   IN      A       193.70.192.59

;; Query time: 2 msec
;; SERVER: 195.20.81.60#53(195.20.81.60)
;; WHEN: Mon Oct 28 16:25:39 2002
;; MSG SIZE  rcvd: 205


if all mail from libero.it is send over smtp[456] you can block them.

but it is much better if you use your sendmail (qmail,...) mailgateway
to deny all mail from libero.it.

bye
danny



Sundaram Ramasamy wrote:
| Hi,
|
| I want to block all incoming mail from the libero.it domain. I have NATed
| mail server.
|
| I set the following rules in my firewall, But still I am getting mails
from
| this domain.
|
| Can you please help on this.?
|
| #libero.it - 195.210.91.83
| SIP=195.210.91.83
| $IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
| $IPT -A INPUT -s $SIP -j DROP
|
| $IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
| $IPT -A FORWARD -s $SIP -j DROP
|
|
| [root@gw root]# dig libero.it
|
| ; <<>> DiG 9.2.0 <<>> libero.it
| ;; global options:  printcmd
| ;; Got answer:
| ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8861
| ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 0
|
| ;; QUESTION SECTION:
| ;libero.it.                     IN      A
|
| ;; ANSWER SECTION:
| libero.it.              86169   IN      A       195.210.91.83
|
| ;; AUTHORITY SECTION:
| libero.it.              86169   IN      NS      ns2.libero.it.
| libero.it.              86169   IN      NS      ns1.libero.it.
|
| ;; Query time: 4 msec
| ;; SERVER: 192.168.1.1#53(192.168.1.1)
| ;; WHEN: Mon Oct 28 09:00:45 2002
| ;; MSG SIZE  rcvd: 79
|
| -SR
|
|

- --
Linux xtc i686
~ 16:25:01 up 8 days, 22:12,  3 users,  load average: 0.97, 0.93, 0.91

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9vVf9aZin/WSv/IARAkGgAKDCAdKGPwDawIKFrH7GcP+Pv+RRSgCfeDqR
3si2ob6GgGyinDSt91NbLV8=
=Wdmg
-----END PGP SIGNATURE-----


