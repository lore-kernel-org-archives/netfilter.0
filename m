From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forwarding traffic from public IP to public IP.
Date: Wed, 28 Nov 2007 13:17:04 -0600
Message-ID: <474DBEB0.8050501@riverviewtech.net>
References: <AFB1C16E164D73439741623EBFEA771C4DB039@lex-exch1.lexionmedical.com> <474D9991.5000009@riverviewtech.net> <AFB1C16E164D73439741623EBFEA771C4DB07D@lex-exch1.lexionmedical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AFB1C16E164D73439741623EBFEA771C4DB07D@lex-exch1.lexionmedical.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/28/07 11:45, Jason Hawthorne wrote:
> So would the rules look like this than?  Because it doesn't seem to be 
> working.
> 
> iptables -t nat -A POSTROUTING -d DESTINATION-IP -j SNAT --to-source 
> DEBIAN-IP
> iptables -t nat -A PREROUTING -d DEBIAN-IP -j DNAT --to-destination 
> SOURCE-IP

No, you do not want to DNAT to SOURCE-IP.  You want to do something like 
the following:

On DEBIAN, you would want to do something like the following:

# Redirect traffic originally to DEBIAN to be to DESTINATION
iptables -t nat -A PREROUTING -d DEBIAN-IP -j DNAT --to-destination 
DESTINATION-IP
# SNAT DNATed traffic from DEBIAN to DESTINATION to be from DEBIAN
iptables -t nat -A POSTROUTING -d DESTINATION-IP -j SNAT --to-source 
DEBIAN-IP

SOURCE ---> DEBIAN ---> DESTINATION ---> DEBIAN ---> SOURCE



Grant. . . .
