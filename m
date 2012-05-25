From: Eric Petit <eric@lapsus.org>
Subject: Re: connlimit and rejected connections staying in conntrack table
Date: Fri, 25 May 2012 11:50:12 +0200
Message-ID: <83E58892-1E4E-4209-897B-88F42D739EDF@lapsus.org>
References: <3558CE94-A347-48A9-8F5F-D10D51390681@lapsus.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3558CE94-A347-48A9-8F5F-D10D51390681@lapsus.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On May 23, 2012, at 5:29 PM, Eric Petit wrote:
> I am trying to limit the total number of concurrent connections that may be established on a given port. I need additional connection attempts to be explicitly rejected, so I went for something like:
> 
> iptables -P INPUT DROP
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 512 --connlimit-mask 0 -j REJECT
> iptables -A INPUT -p tcp --dport 80 -j ACCEPT
> 
> My problem is, when the limit is reached and new connections are rejected, those stay in the conntrack table in a SYN_SENT / UNREPLIED state, and are only cleaned up after 120 seconds (ip_conntrack_tcp_timeout_syn_sent). As such, they are accounted for as active connections by connlimit, and new connections keep being rejected even though the number of established connections is, in fact, lower than the limit that I set. If connections keep coming in at a fast pace, it may just never accept a connection again. I've tried "--reject-with tcp-reset" and the behavior was the same.

Finally figured this out - those conntrack entries weren't, in fact related to connlimit rejecting connections. The SYNs were unreplied because SYN flood protection kicked in when I tested by throwing lots of connections at it. I have enabled SYN cookies and things are now working as expected.

Eric