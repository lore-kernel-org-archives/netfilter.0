From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: SNATTING FTP
Date: Tue, 3 May 2005 14:30:55 +0200
Message-ID: <20050503123058.24BC58EDCEB@smtp.sterenborg.info>
References: <110c7844050503050579575350@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <110c7844050503050579575350@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> i wanted to do SNAT on FTP connections which are destined 
> from my local 
> network to outside network. I tried the SNAT for ssh and it 
> was working with 
> the following rule
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -p 
> tcp -m tcp --dport 22 -m state --state NEW -j SNAT --to
> 192.168.1.5
> 
> I tried the following rules for FTP but it is no working
> 
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -p 
> tcp -m tcp --dport ftp -m state --state 
> NEW,ESTABLISHED,RELATED -j SNAT --to 
> 192.168.1.5
> 
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -p 
> tcp -m tcp --sport ftp-data -m state --state 
> NEW,ESTABLISHED,RELATED -j SNAT 
> --to 192.168.1.5

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

$IPT -A FORWARD -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
# This will handle ftp-data (port 20) as well because
# it is related to ftp (port 21).

$IPT -A FORWARD -s 192.168.1.0/24 -p tcp --dport 21 \
  -j ACCEPT

$IPT -t nat -A POSTROUTING -s 192.168.1.0/24 -p tcp \
  --dport 21 -j SNAT --to <ext-ip>

If 192.168.1.0/24 is your internal network, then 192.168.1.5 is an
internal IP too.
If you want to use ftp from your internal to an external network then
your SNAT ip would have an external IP, not 192.168.1.5 which is
internal. My guess is to replace 192.168.1.5 with an IP that is not in
192.168.1.0/24 (or you made a typo ?).


Gr,
Rob


