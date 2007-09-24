From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 20:43:57 -0400
Message-ID: <20070924004357.GE11683@minastirith>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net> <46F66E89.1000809@verizon.net>
 <46F6755D.9070407@verizon.net> <46F68391.5060905@verizon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F68391.5060905@verizon.net>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sep 23, 2007, Gerry Reno wrote:

> Is this correct for logging on the server?:
> 
> Chain INPUT (policy ACCEPT)
> num target prot opt source destination
> 1 LOG tcp -- 0.0.0.0/0 0.0.0.0/0 tcp dpts:55000:62000 LOG flags 2 level 4
> 2 LOG udp -- 0.0.0.0/0 0.0.0.0/0 udp dpts:55000:62000 LOG flags 0 level 4

iptables logging is not required in SPA mode.  But, in legacy port
knocking mode those logging rules should work for encrypted knock
sequences since fwknopd would need ports 61000 + 256 to be logged.

--Mike
