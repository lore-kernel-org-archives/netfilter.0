From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Thu, 4 Jul 2002 19:51:09 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704185114.YCLZ4626.mta02-svc.ntlworld.com@there>
References: <001e01c22321$e86018a0$2400a8c0@inq7.net> <20020704182042.XIE16050.mta01-svc.ntlworld.com@there> <02070420483100.06327@Lms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02070420483100.06327@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 04 July 2002 7:48 pm, Jan Humme wrote:

> On Thursday 04 July 2002 20:20, Antony Stone wrote:

> > # Redirect http requests to local proxy
> > iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT 127.0.0.1:80
>
> Antony, just for my understanding: is this any different from:
>
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT   ?

No.   I just find the name 'redirect' a bit ambiguous (I mean, it could 
redirect it somewhere else, couldn't it, but no, it only redirects it to the 
local machine...) therefore I use DNAT which I'm familiar with from other 
uses.

 

Antony.

