From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: SMTP HTTP problem
Date: 31 Aug 2003 09:41:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062315713.1607.6.camel@kermit>
References: <20030830143115.91071.qmail@web20705.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030830143115.91071.qmail@web20705.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,
Am Sam, 2003-08-30 um 16.31 schrieb ads nat:
> PROBLEM-1
> When I try to send email to squid emailing list I get
> following error.
> ****
> Hi. This is the qmail-send program at squid-cache.org.
> I'm afraid I wasn't able to deliver your message to
> the following=20
> addresses.
> This is a permanent error; I've given up. Sorry it
> didn't work out.
> <squid-users@squid-cache.org>:
> ezmlm-reject: fatal: Sorry, I don't accept messages of
> MIME=20
> Content-Type 'multipart/alternative' (#5.2.3)
Read the error message. Your email gets to the mailserver, but it did
not accept it! No netfilter issue!

> Also my LAN users can not send emails through outlook
> express.
Different story.

> STATUS:> Retrieving directory listing...
> COMMAND:> PORT 192,168,0,42,4,62
>  500 Illegal PORT command.
> STATUS:> Error opening data socket=20
> *****
Did you load the inspection modules for ftp? ip_conntrack_ftp,
ip_nat_ftp?

Correct me if I am wrong, but your iptables script does not filter
anything, does it? Therefore you essentially do not have a firewall at
the moment which could block anything, do you?
Your Policy is ACCEPT and you do not have any DROP rules, only one NAT
rule.=20

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

