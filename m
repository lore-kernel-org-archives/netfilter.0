From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 20:16:07 -0400
Message-ID: <20070924001607.GD11683@minastirith>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net> <46F66E89.1000809@verizon.net>
 <46F6755D.9070407@verizon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F6755D.9070407@verizon.net>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sep 23, 2007, Gerry Reno wrote:

> Just trying to get port knock working first...
> 
> When I run the client I see this error:
> 
> $ ./knocklogin
> ++ fwknop --Server-mode knock -A tcp/12345 -s -r --offset 55500 -D 
> XXX.XXX.XXX.XXX
> [+] Starting fwknop client.
> [+] Enter an encryption key. This key must match a key in the file
> /etc/fwknop/access.conf on the remote system.
> 
> Encryption Key:
> [*] Must specify port to open. at /usr/bin/fwknop line 761, <STDIN> line 
> 1. <------ I thought this is what the -A argument did????
> ++ ssh -p 12345 user@XXX.XXX.XXX.XXX
> ssh: connect to host XXX.XXX.XXX.XXX port 12345: Connection refused
> ++ set +x

Ok, thanks for reporting that; I'll fix it for the next release.  Still,
this is the legacy port knocking mode.  How about trying this?:

$ fwknop -A tcp/12345 -R -D XXX.XXX.XXX.XXX

...and setting your /etc/fwknop/access.conf file per one of my previous
emails?  This will get you going with SPA mode.

--Mike
