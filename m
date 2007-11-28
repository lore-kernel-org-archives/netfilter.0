From: "Jason Hawthorne" <jhawthorne@lexionmedical.com>
Subject: RE: Forwarding traffic from public IP to public IP.
Date: Wed, 28 Nov 2007 14:11:52 -0600
Message-ID: <AFB1C16E164D73439741623EBFEA771C4DB0D8@lex-exch1.lexionmedical.com>
References: <AFB1C16E164D73439741623EBFEA771C4DB039@lex-exch1.lexionmedical.com> <474D9991.5000009@riverviewtech.net> <AFB1C16E164D73439741623EBFEA771C4DB07D@lex-exch1.lexionmedical.com> <474DBEB0.8050501@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <474DBEB0.8050501@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

> No, you do not want to DNAT to SOURCE-IP.  You want to do something
> like
> the following:
> 
> On DEBIAN, you would want to do something like the following:
> 
> # Redirect traffic originally to DEBIAN to be to DESTINATION
> iptables -t nat -A PREROUTING -d DEBIAN-IP -j DNAT --to-destination
> DESTINATION-IP
> # SNAT DNATed traffic from DEBIAN to DESTINATION to be from DEBIAN
> iptables -t nat -A POSTROUTING -d DESTINATION-IP -j SNAT --to-source
> DEBIAN-IP
> 
> SOURCE ---> DEBIAN ---> DESTINATION ---> DEBIAN ---> SOURCE

Thanks this worked like a charm! 
