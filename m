From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Issue in conntrack udpate cmd for UDP -- "conntrack -U -p udp -t
 xx" updates only unreplied connections
Date: Sun, 15 Mar 2015 21:44:31 +0100
Message-ID: <20150315204431.GA3673@salvia>
References: <CAMVHObOzkWxn2ivJsT=R0xdT59wj2y09C7cxGYhh+Rqcnwz0kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMVHObOzkWxn2ivJsT=R0xdT59wj2y09C7cxGYhh+Rqcnwz0kw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Murugan Venugopal <muruga86@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Mar 11, 2015 at 05:32:40PM +0530, Murugan Venugopal wrote:
> Hi,
> 
> I face an Issue in conntrack udpate cmd for UDP.
>  "conntrack -U -p udp -t xx" cmd only updates unreplied connections,
> while ASSURED UDP connections are left out.
> 
> # conntrack -U -p udp -t 60
> 
> 
> # conntrack -L -p udp | grep ASSU
> conntrack v1.0.0 (conntrack-tools): 23 flow entries have been shown.
> udp      17 598 src=125.17.98.97 dst=8.8.8.8 sport=33029 dport=53
> packets=5 bytes=340 src=8.8.8.8 dst=125.17.98.97 sport=53 dport=33029
> packets=5 bytes=508 [ASSURED] mark=0 use=3
> udp      17 598 src=125.17.98.97 dst=8.8.8.8 sport=49407 dport=53
> packets=15 bytes=900 src=8.8.8.8 dst=125.17.98.97 sport=53 dport=49407
> packets=15 bytes=1635 [ASSURED] mark=0 use=2
> 
> Packages used:
> conntrack-tools-1.0.0
> libnetfilter_conntrack-0.9.1
> libnfnetlink-1.0.0
> iptables-1.4.16
> Linux kernel 2.6.34.8
> 
> 
> Please let me know, whether there are any reason to skip assured
> connection out of updation. If possible, how to update assured
> connection too.

Note that the follow up packet resets the timeout to what the default
timeout policy specifies.

If you want to adopt specific timeout policies for a subset of flows,
you have to use the cttimeout infrastructure [1].

[1] http://lwn.net/Articles/485195/
