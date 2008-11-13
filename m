From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Re: INVALID state
Date: Thu, 13 Nov 2008 10:16:53 -0800
Message-ID: <491c6f1c.27b38c0a.7748.ffffe1d6@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :mime-version:content-type:content-transfer-encoding:x-mailer
         :thread-index:content-language:message-id;
        bh=OAfv3k2lj3Pnit8I8IXsP92uM0sYCRHgH19uXuwiZec=;
        b=BB9UCRRO+X2Mr1TrFJ3ykirYG7x1Y8t/KxhlC9vs25kp/vmDkHpOdo+EMKrEU8+BcK
         kUrixzIMQC7gT7CVQW2AhqapgxFSFsXfSZmMRb59/lDZpEwQgg2oHJgq65BaZYaRD1SK
         9Hm9je8cBSTDkREZLc6GnpElV3bu0Jj8nRk/Q=
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Here is my partial analysis of the code (2.6.24) , trying to understand what
INVALID state means.
Feedbacks are appreciated.

- init_conntrack calls l4proto->new. If a zero value is returned,
nf_conntrack_free is called and the packet's connection is considered
INVALID
- l4proto->new can be one of
	- tcp_new
		- Determines the new state according to tcp_conntracks
		- Returns 0 in these cases:
			- The new state is invalid
			- The new state is not SYN_SENT, and loose TCP is
turned off
	- icmp_new
		- Return 1 only for ICMP: ECHO,
TIMESTAMP,INFO_REQUEST,ADDRESS
	- icmpv6_new
		- Return 1 only for ECHO, NI_QUERY
	- sctp_new
		- (not sure of the details) 
	- A list of functions which always return 1; i.e. never produce an
INVALID state
		- udp_new
		- new (@nf_conntrack_proto_generic.c)
		- gre_new
		- udplite_new


