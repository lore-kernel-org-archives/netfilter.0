From: Bob Weber <bob@seldensystems.com>
Subject: Re: Strange outgoing packet ...
Date: Fri, 16 Jan 2004 08:35:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040116153516.GI14780@probate-software.com>
References: <200401161015.41975.mrakotom@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401161015.41975.mrakotom@free.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 01/16/04, Rakotomandimby Mihamina wrote:
> Hi all,
> Im' running 2.4.24 and iptables 1.2.9 on slackware .

> and i get many lines like this in my log file :
> 
> Jan 16 06:54:40 milina kernel: dropped_output_: IN= OUT=ppp0 SRC=81.248.95.208 
> DST=81.56.193.129 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP 
> SPT=39332 DPT=113 WINDOW=18276 RES=0x00 SYN URGP=0
> 
> What would be this stuff on 113 port ??

Port 113 is the auth port.  Mail servers will attempt to connect to this
port to determine if you are at the ip address your name resolves to.  If
your mail server has to wait for this connection to timeout pop3 and smtp
connections will be slow

Bob

