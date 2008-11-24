From: "JC Janos" <jcjanos245@gmail.com>
Subject: Which "illegal" tcp-fragments should be blocked?
Date: Mon, 24 Nov 2008 09:01:35 -0800
Message-ID: <7259d7020811240901o53a4fd7bt99985dd2b3a7cb74@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=ehkjebvB0ZfqJ80w3/bIWGkE2WnTnm2eYHwtDatNsMI=;
        b=phH8B8tp8hi/IlvwsN5B4TVZgl9xXAJsorSr+QI+bckYRLy0DhO111fXMPV3Jb9pE5
         vjWiTV6Cnx7HShSSVayvQ0fwgEd4cZPRnxLZnaz0W2g5musaVWeNXuHYw0mRGX7oc09q
         WJ3lgI5WnvfgW+R9jqQ5zBmUc7ntz53nCyjPc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

I've read on numerous sites, and in bunches of examples, that "illegal
tcp fragments" should be blocked early in a firewall rule set.

As I understand it, the rule takes the form,

	iptables -A INPUT -p tcp --tcp-flags "mask" "comp" -j DROP

Every source I read seems to match & block a different combination of
fragments.  So far, the list of "block these" mask/comp pairs that
I've come across are:

	"mask"                            "comp"
	----------------                  ----------------
	ALL                               ALL
	ALL                               NONE
	ALL                               FIN,URG,PSH
	ALL                               FIN,URG,PSH
	ALL                               SYN,RST,ACK,FIN,URG
	ACK                               ACK
	FIN,ACK                           FIN
	FIN,URG,PSH                       FIN,URG,PSH
	SYN                               NONE
	SYN,RST                           SYN,RST
	SYN,FIN,RST,ACK                   NONE
	SYN,FIN,RST,ACK,URG               NONE
	SYN,FIN                           SYN,FIN
	SYN,FIN,RST,ACK                   FIN
	SYN,FIN,RST,ACK,URG               URG
	SYN,FIN                           SYN,FIN
	SYN,FIN,RST,ACK                   SYN,FIN
	SYN,FIN,RST,ACK,URG,PSH,ECE,CWR   FIN,URG,PSH
	SYN,FIN,RST,ACK,URG               SYN,FIN,RST,ACK,URG
	SYN,FIN,RST,ACK,URG,PSH           SYN,FIN,RST,ACK,URG,PSH

Which of these are really valid targets to block?  Each of the pairs
is blocked at least sometimes; noone I've found so far blocks them
all.  Is this list even complete?

Thanks.

--JC
