From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: HTTP Port forwarding issues
Date: Tue, 9 Jul 2002 11:52:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070911523900.05759@Lms>
References: <40fb01c226c7$5014e810$2901a8c0@amos>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <40fb01c226c7$5014e810$2901a8c0@amos>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Cassano <nathan@cjhunter.com>, 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Of course, HTTP runs over TCP, but who can explain why in /etc/services:

# grep http /etc/services
#	http://www.isi.edu/in-notes/iana/assignments/port-numbers
http		80/tcp		www www-http	# WorldWideWeb HTTP
http		80/udp		www www-http	# HyperText Transfer Protocol
https		443/tcp				# MCom
https		443/udp				# MCom
gss-http	488/tcp
gss-http	488/udp
http-alt	8008/tcp
http-alt	8008/udp

Ports and port numbers are different for TCP and UDP, right?

Jan Humme.

On Monday 08 July 2002 23:35, Nathan Cassano wrote:
> Hmm... After a little research it appears that I am wrong. Darn, I hate
> looking like a fool. Sorry for the misinformation.
>
> RFC 2616: Hypertext Transfer Protocol -- HTTP/1.1
> ftp://ftp.isi.edu/in-notes/rfc2616.txt
>
> Antony Stone wrote:
> >> Remember HTTP runs over UDP protocol also.
> >
> >WHAT ?????
> >
> >RFC # ?
> >
> >
> >
> >Antony.

