From: Othmar Pasteka <pasteka@kabsi.at>
Subject: Re: Getting rid of the masses of ip_conntrack messages
Date: Sun, 1 Dec 2002 21:13:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021201201344.GA29485@davinci>
References: <OE33LTrpwACkWHZqYW800004167@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OE33LTrpwACkWHZqYW800004167@hotmail.com>
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
To: hard__ware <hard__ware@hotmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>

hi,

[Btw. what about getting a proper E-Mail client, who does things
like adding a Re: to the subject line and replying to the email
and keep the thread instead of posting a completely new message.]

On Mon, Dec 02, 2002 at 05:07:27AM +1000, hard__ware wrote:
> Please try to give a more detailed info on your setup
> like Rules ect . Because i use DNAT / SNAT / with FTP
> and  ip_conntrack_ftp & ip_nat_ftp  allot with IPTables
> and have never found / seen those messages ? 

ftp server which permits ftp connections from the outside. that's
basically it.
I don't have a log target or sucha thing. it originates from the kernel
but couldn'T find a way yet, like through syslog, to disable it or
log it seperately.
my rule sets look as follows:

:INPUT DROP [1732:89835]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
[0:0] -A INPUT -i eth0 -p udp -m udp --dport 22 -j ACCEPT 
[0:0] -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT 
[3016:4082458] -A INPUT -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT 
[138:12024] -A INPUT -i lo -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT 
[136:12210] -A INPUT -p icmp -j ACCEPT 
[810:43752] -A INPUT -p tcp -m tcp --dport 20:21 -j ACCEPT 
[12:720] -A INPUT -p tcp -m tcp --dport 873 -j ACCEPT 
[0:0] -A INPUT -p udp -m udp --dport 873 -j ACCEPT 
[0:0] -A INPUT -s 62.116.33.11 -p tcp -m tcp --dport 111 -j ACCEPT 
[0:0] -A INPUT -s 62.116.33.11 -p udp -m udp --dport 111 -j ACCEPT 
[2753:169858] -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT 
[0:0] -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT 


so long
Othmar


