From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 10:17:01 -0400
Message-ID: <46F6755D.9070407@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net> <46F66E89.1000809@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F66E89.1000809@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Just trying to get port knock working first...

When I run the client I see this error:

$ ./knocklogin
++ fwknop --Server-mode knock -A tcp/12345 -s -r --offset 55500 -D 
XXX.XXX.XXX.XXX
[+] Starting fwknop client.
[+] Enter an encryption key. This key must match a key in the file
/etc/fwknop/access.conf on the remote system.

Encryption Key:
[*] Must specify port to open. at /usr/bin/fwknop line 761, <STDIN> line 
1. <------ I thought this is what the -A argument did????
++ ssh -p 12345 user@XXX.XXX.XXX.XXX
ssh: connect to host XXX.XXX.XXX.XXX port 12345: Connection refused
++ set +x


????

Gerry

