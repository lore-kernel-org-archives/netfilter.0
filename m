From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Is "--ctstate RELATED" deprecated ?
Date: Tue, 24 Oct 2017 20:49:16 +0200
Message-ID: <61748987-95d0-3c6e-2be7-5edd6245a777@plouf.fr.eu.org>
References: <518706823.59969905.1508834982526.JavaMail.root@zimbra65-e11.priv.proxad.net>
 <236899556.60177991.1508838174605.JavaMail.root@zimbra65-e11.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <236899556.60177991.1508838174605.JavaMail.root@zimbra65-e11.priv.proxad.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: marcfun@free.fr
Cc: netfilter@vger.kernel.org

Le 24/10/2017 à 11:42, marcfun@free.fr a écrit :
> 
> [root@archlinux ~]# iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp
> [root@archlinux ~]# iptables -A INPUT -m conntrack --ctstate RELATED -m helper --helper ftp -j ACCEPT
> [root@archlinux ~]# iptables -A INPUT -m conntrack --ctstate RELATED -j ACCEPT
> 
> => That gives :
> 
> [root@archlinux ~]# iptables -nvL

Please consider using iptables-save instead of iptables -L. IMO, its 
output is much easier to read.

> I follow the conntrack events for expect with "conntrack -E expect", and i another shell I initiate a PASSIVE FTP session.
(...)
> BUT in the filter table, the RELATED ctstate is not matched...

Passive FTP means that the client initiates the data connection to the 
server. From your first rule, I guess that the client is the local host. 
So shouldn't the RELATED rules also be in the OUTPUT chain instead of 
INPUT ?

Or use active FTP instead, so that the server initiates the data 
connection to the client.
