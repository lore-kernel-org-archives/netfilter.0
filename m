From: "Stuart J. Browne" <stuart@promed.com.au>
Subject: RE: ftp and ssl
Date: Wed, 5 Nov 2003 14:33:03 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33da01c3a34d$84fe6660$2288e7c0@promed.com.au>
References: <1068001340.7813.47.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068001340.7813.47.camel@tarkus>
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
To: netfilter@lists.netfilter.org



>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org 
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ted Kaczmarek
>Sent: Wednesday, 5 November 2003 13:03
>To: Michael Klinteberg
>Cc: netfilter@lists.netfilter.org
>Subject: Re: ftp and ssl
>
>
>Allow tcp port 443 :-)
>
>Ted
>On Tue, 2003-11-04 at 09:36, Michael Klinteberg wrote:
>> I need to setup ftp that use ssl. I don't know if 
>ip_conntrack_ftp supports
>> ssl. What are my options here?
>> What do I need to know to setup the iptables rules/modules?
>> 
>> Regards
>> Michael

Isn't 443 SSL over HTTP? :)

By default, it looks as if netfilter only watch port 21, but you can
pass it an option (called 'ports') of the ports you want to treat as FTP
as well.

How are you doing SSL FTP's?

	Using ssh's sftp? This just uses standard ssh ports.

	SSL FTP client (does anybody use this?) I beleive has the
services entry of 'sftp' and is port 115.  I've not seen a production
implementation of this though.


If using 'sftp' from the OpenSSH packages, there is no need for any
conntrack helpers, as it all uses the same port.

If using the later however, given that the channel will be encrypted, I
don't see how this conntrack would work at all.

just my thoughts..


